#-------------------------------------------------------------------------------
# HGSS PauseMenu
# Credit: bo4p5687, graphics by Richard PT
#-------------------------------------------------------------------------------
PluginManager.register({
  :name    => "HGSS_PauseMenu",
  :credits => ["bo4p5687", "graphics by Richard PT"]
})
#-------------------------------------------------------------------------------
class HGSS_PauseMenu
  
  def initialize
    @viewport = Viewport.new(0,0,Graphics.width,Graphics.height)
    @viewport.z = 99999
    @sprites = {}
    # Scene
    @sprites["scene"] = Sprite.new(@viewport)
    @sprites["scene"].bitmap = Bitmap.new("Graphics/Pictures/HGSSPauseMenu/hgsspausemenubg")
    # Choose bar
    @sprites["select"] = Sprite.new(@viewport)
    @sprites["select"].bitmap = Bitmap.new("Graphics/Pictures/HGSSPauseMenu/select")
    # Ball (Overlay)
    (1..3).each{|i|
    @sprites["b#{i}"] = Sprite.new(@viewport)
    @sprites["b#{i}"].bitmap = Bitmap.new(Graphics.width, Graphics.height)}
    # Set x_y (12)
    create_xy_arr
    # Position
    @position = 0
    # Exit
    @exit = false
  end
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
  def loop_pause_menu
    if !$Trainer
      if $DEBUG
        pbMessage(_INTL("The player trainer was not defined, so the pause menu can't be displayed."))
        pbMessage(_INTL("Please see the documentation to learn how to set up the trainer player."))
      end
      return
    end
    # Check pokedex
    pbSetViableDexes
    pbSEPlay("GUI menu open")
    # Create
    push_option
    set_option
    # Position
    set_position_img
    return if @option.size == 0
    # Loop
    loop do
      break if @exit
      # Update
      update_ingame
      # Set position
      set_position_p
      # Input
      if Input.trigger?(Input::DOWN)
        pbPlayCursorSE
        @position += 1
        @position = 0 if @position >= (@option.size)
      end
      if Input.trigger?(Input::UP)
        pbPlayCursorSE
        @position -= 1
        @position = (@option.size-1) if @position < 0
      end
      if Input.trigger?(Input::RIGHT)
        pbPlayCursorSE
        @position += 3
        @position = 0 if @position >= @option.size
      end
      if Input.trigger?(Input::LEFT)
        pbPlayCursorSE
        @position -= 3
        if @position <= (-3)
          @position = (@option.size-1)
        elsif @position==(-1) || @position==(-2)
          @position+=((@position+11) < @option.size)? 11 : ((@position+8) < @option.size)? 8 : ((@position+5) < @option.size)? 5 : 2
        end
      end
      if Input.trigger?(Input::C) || $mouse && $mouse.click?
        pbPlayCursorSE
        # Play
        position_option
      end
      if Input.trigger?(Input::B)
        pbPlayCursorSE
        # Exit
        @exit = true 
      end
    end
    # Dispose 
    pbEndScene
  end
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
  def create_sprite(spritename,filename)
    @sprites["#{spritename}"] = Sprite.new(@viewport)
    @sprites["#{spritename}"].bitmap = Bitmap.new("Graphics/Pictures/HGSSPauseMenu/#{filename}")
  end

  def create_sprite_2(spritename)
    @sprites["#{spritename}"] = Sprite.new(@viewport)
    @sprites["#{spritename}"].bitmap = Bitmap.new(Graphics.width, Graphics.height)
  end
  
  def create_xy_arr
    @xyarr = []
    (0...20).each{|i| @xyarr.push([0,0])}
    (0...@xyarr.size).each{ |i|
    if (i%3)==0
      @xyarr[i][0] = (i==0)? 27 : 27+122*((i%4-4).abs)
      @xyarr[i][1] = 60
    elsif (i%3)==1
      @xyarr[i][0] = ((i%4)==2)? 27+122*((i%4+1).abs) : 27+122*((i%4-1).abs)
      @xyarr[i][1] = 60+100
    elsif (i%3)==2
      @xyarr[i][0] = ((i%4)==3)? 27+122*((i%4).abs) : 27+122*((i%4-2).abs)
      @xyarr[i][1] = 60+100*2
    end }
  end
  
  def set_visible(spritename,vsb=false)
    @sprites["#{spritename}"].visible = vsb
  end
#-------------------------------------------------------------------------------
  def draw_text(bitmap,name,x,y,ball=false)
    # Color
    basecolor = Color.new(255,255,255)
    shadowcolor = Color.new(0,0,0)
    # Sprite
    bitmap = @sprites["#{bitmap}"].bitmap
    bitmap.clear
    text = []
    # Text
    text.push([_INTL("#{name}"),x,y,3,basecolor,shadowcolor])
    bitmap.font.size = 23
    bitmap.font.name = "Arial"
    pbDrawTextPositions(bitmap,text)
  end
  
  def clear_text(bitmap)
    bitmap = @sprites["#{bitmap}"].bitmap
    bitmap.clear
  end
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
  def push_option
    # Option
    @option = []
    # Retire, pokedex, pokemon, bag          (0,1,2,3)
    # pokegear, pokenav, name, save, option  (4,5,6,7,8)
    # control, debug, quit, ball             (9,10,11,12)
    # Name sprite, bitmap, number, title
    # Retire
    a = ["retire","retireicon",0,"RETIRE"]
    # Pokedex
    b = ["pokedex","pokedexicon",1,"POKEDEX"]
    # Pokemon
    c = ["pokemon","pokemonicon",2,"POKEMON"]
    # Bag
    d = ["bag","bagicon",3,"BAG"]
    # Pokegear
    e = ["pokegear","pokegearicon",4,"POKEGEAR"]
    # Pokenav
    f = ["pokenav","pokenavicon",5,"POKENAV"]
    # Trainer card
    g = ["name","trainercardicon",6,"NAME"]
    # Save
    h = ["save","savegameicon",7,"SAVE"]
    # Option
    i = ["option","optionsicon",8,"OPTION"]
    # Control
    j = ["control","controlsicon",9,"CONTROL"]
    # Debug
    k = ["debug","debugicon",10,"DEBUG"]
    # Quit
    l = ["quit","quitgameicon",11,"QUIT"]
    # Ball
    m = ["ball","",12,""] 
    @option.push(a,b,c,d,e,f,g,h,i,j,k,l,m)
    # Delete (check)
    # Retire
    @option.delete(a) if !pbInSafari? && !pbInBugContest? 
    # Pokedex
    @option.delete(b) if !$Trainer.pokedex || $PokemonGlobal.pokedexViable.length <= 0
    # Pokemon
    @option.delete(c) if $Trainer.party.length <= 0
    # Bag
    @option.delete(d) if pbInBugContest?
    # Pokegear
    @option.delete(e) if !$Trainer.pokegear
    # Save
    @option.delete(h) if !$game_system || $game_system.save_disabled || pbInSafari? || pbInBugContest?
    # Debug
    @option.delete(k) if !$DEBUG
    # Quit
    @option.delete(l) if pbInBugContest? || pbInSafari?
    # Ball
    @option.delete(m) if !pbInBugContest? && !pbInSafari? 
  end
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
  def set_option
    (0...@option.size).each{|i| 
    if @option[i][2] != 12 
      create_sprite(@option[i][0],@option[i][1]) 
      create_sprite_2("#{i}")
    end }
    ball = nil
    if pbInSafari?
      ball = getConst(PBItems,:SAFARIBALL)
    # Safari Zone/Bug Contest
    elsif pbInBugContest?
      ball = getConst(PBItems,:SPORTBALL)
    end
    if ball != nil
      filename = sprintf("%s",ball) rescue nil
      filename = sprintf("item%03d",ball) if !pbResolveBitmap("Graphics/Icons/#{filename}")
      @sprites["ball"] = Sprite.new(@viewport)
      @sprites["ball"].bitmap = Bitmap.new("Graphics/Icons/#{filename}")
    end
  end
  
  # Position (images)
  def set_position_img
    (0...@option.size).each{|i|
    if @option[i][2] == 12
      @sprites[@option[i][0]].x = @xyarr[i][0] + 20
      @sprites[@option[i][0]].y = @xyarr[i][1] - 5
      draw_ball_text(@xyarr[i][0]+20,@xyarr[i][1]-5) 
    else
      @sprites[@option[i][0]].x = @xyarr[i][0]
      @sprites[@option[i][0]].y = @xyarr[i][1]
      if @option[i][3].length<=4
        draw_text("#{i}",@option[i][3],@xyarr[i][0]+15,@xyarr[i][1]+62)
      elsif @option[i][3].length==5
        draw_text("#{i}",@option[i][3],@xyarr[i][0]+10,@xyarr[i][1]+62)
      elsif @option[i][3].length==6
        draw_text("#{i}",@option[i][3],@xyarr[i][0],@xyarr[i][1]+62)
      else
        draw_text("#{i}",@option[i][3],@xyarr[i][0]-8,@xyarr[i][1]+62)
      end
    end }
  end
  
  # Position (select)
  def set_position_p
    # Mouse
    if $mouse
      (0...@option.size).each{|i|
      if i != @position && $mouse.inArea?(@xyarr[i][0],@xyarr[i][1],80,52)
        pbPlayCursorSE
        @position = i  
      end}
    end
    if @option[@position][2] == 12
      @sprites["select"].zoom_x = 0.5
      @sprites["select"].zoom_y = 0.75
      @sprites["select"].x = @sprites[@option[@position][0]].x
      @sprites["select"].y = @sprites[@option[@position][0]].y-2
    else
      @sprites["select"].zoom_x = 1
      @sprites["select"].zoom_y = 1
      @sprites["select"].x = @sprites[@option[@position][0]].x-8
      @sprites["select"].y = @sprites[@option[@position][0]].y-8
    end
  end
  
  def draw_ball_text(x,y)
    if pbInSafari?
      if SAFARI_STEPS<=0
        draw_text("b1","Balls: #{pbSafariState.ballcount}",
          x-15,y+55,true)
      else
        ball = pbSafariState.ballcount
        s_f = pbSafariState.steps
        s_p = SAFARI_STEPS
        draw_text("b1","Balls: #{ball}",
          x-15,y+55,true)
        draw_text("b2","Steps: #{s_f}/#{s_p}",
          x-50,y+75,true)
      end
    elsif pbInBugContest?
      if pbBugContestState.lastPokemon
        ball = pbBugContestState.ballcount
        cg = PBSpecies.getName(pbBugContestState.lastPokemon.species)
        lv = pbBugContestState.lastPokemon.level
        draw_text("b1","Balls: #{ball}",
          x-15,y+55,true)
        draw_text("b2","Caught: #{cg}",
          x-30,y+75,true)
        draw_text("b3","Level: #{lv}",
          x-30,y+95,true)
      else
        ball = pbBugContestState.ballcount
        draw_text("b1","Balls: #{ball}",
          x-15,y+55,true)
        draw_text("b2","Caught: None",
          x-30,y+75,true)
      end
    end
  end
  
  # Set visible (menu)
  def hide_menu
    (0...@option.size).each{|i| 
    set_visible(@option[i][0]) 
    @sprites["ball"].visible = false if @option[i][2] == 12 && @sprites["ball"]
    clear_text("#{i}") if @option[i][2] != 12}
    (1..3).each{|i| @sprites["b#{i}"].bitmap.clear}
    set_visible("scene"); set_visible("select")
  end
  
  def show_menu
    (0...@option.size).each{|i| 
    set_visible(@option[i][0],true) 
    @sprites["ball"].visible = true if @option[i][2] == 12 && @sprites["ball"]
    if @option[i][2] == 12
      draw_ball_text(@xyarr[i][0]+20,@xyarr[i][1]-5) 
    else
      if @option[i][3].length<=4
        draw_text(i,@option[i][3],@xyarr[i][0]+15,@xyarr[i][1]+62)
      elsif @option[i][3].length==5
        draw_text(i,@option[i][3],@xyarr[i][0]+10,@xyarr[i][1]+62)
      elsif @option[i][3].length==6
        draw_text(i,@option[i][3],@xyarr[i][0],@xyarr[i][1]+62)
      else
        draw_text(i,@option[i][3],@xyarr[i][0]-8,@xyarr[i][1]+62)
      end
    end }
    set_visible("scene",true); set_visible("select",true)
  end
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
  # Input C
  def position_option
    # Retire event
    if @option[@position][2] == 0
      # Hide
      hide_menu
      # Safari
      if pbInSafari?
        if pbConfirmMessage(_INTL("Would you like to leave the Safari Game right now?"))
          pbSafariState.decision = 1
          pbSafariState.pbGoToStart
          @exit = true
        else
          # Show
          show_menu
        end
      # Bug Contest
      elsif pbInBugContest?
        if pbConfirmMessage(_INTL("Would you like to end the Contest now?"))
          pbBugContestState.pbStartJudging
          @exit = true
        else
          # Show
          show_menu
        end
      end
    # Pokedex
    elsif @option[@position][2] == 1
      if USE_CURRENT_REGION_DEX
        pbFadeOutIn {
          scene = PokemonPokedex_Scene.new
          screen = PokemonPokedexScreen.new(scene)
          screen.pbStartScreen }
      else
        if $PokemonGlobal.pokedexViable.length==1
          $PokemonGlobal.pokedexDex = $PokemonGlobal.pokedexViable[0]
          $PokemonGlobal.pokedexDex = -1 if $PokemonGlobal.pokedexDex==$PokemonGlobal.pokedexUnlocked.length-1
          pbFadeOutIn {
            scene = PokemonPokedex_Scene.new
            screen = PokemonPokedexScreen.new(scene)
            screen.pbStartScreen }
        else
          pbFadeOutIn {
            scene = PokemonPokedexMenu_Scene.new
            screen = PokemonPokedexMenuScreen.new(scene)
            screen.pbStartScreen }
        end
      end
    # Pokemon
    elsif @option[@position][2] == 2
      hiddenmove = nil
      pbFadeOutIn {
        sscene = PokemonParty_Scene.new
        sscreen = PokemonPartyScreen.new(sscene,$Trainer.party)
        hiddenmove = sscreen.pbPokemonScreen
        pbEndScene if hiddenmove
      }
      if hiddenmove
        $game_temp.in_menu = false
        pbUseHiddenMove(hiddenmove[0],hiddenmove[1])
        @exit = true
      end
    # Bag
    elsif @option[@position][2] == 3
      item = 0
      pbFadeOutIn {
        scene = PokemonBag_Scene.new
        screen = PokemonBagScreen.new(scene,$PokemonBag)
        item = screen.pbStartScreen
        pbEndScene if item>0
      }
      if item>0
        $game_temp.in_menu = false
        pbUseKeyItemInField(item)
        @exit = true
      end
    # Pokegear
    elsif @option[@position][2] == 4
      pbFadeOutIn {
        scene = PokemonPokegear_Scene.new
        screen = PokemonPokegearScreen.new(scene)
        screen.pbStartScreen }
    # Pokenav
    elsif @option[@position][2] == 5
      
    # Trainer Card
    elsif @option[@position][2] == 6
      pbFadeOutIn {
        scene = PokemonTrainerCard_Scene.new
        screen = PokemonTrainerCardScreen.new(scene)
        screen.pbStartScreen }
    # Save
    elsif @option[@position][2] == 7
      # Hide
      hide_menu
      scene = PokemonSave_Scene.new
      screen = PokemonSaveScreen.new(scene)
      if screen.pbSaveScreen
        @exit = true
      else
        # Show
        show_menu
      end
    # Option
    elsif @option[@position][2] == 8
      pbFadeOutIn {
        scene = PokemonOption_Scene.new
        screen = PokemonOptionScreen.new(scene)
        screen.pbStartScreen
        pbUpdateSceneMap }
    # Control
    elsif @option[@position][2] == 9
      
    # Debug
    elsif @option[@position][2] == 10
      pbFadeOutIn { pbDebugMenu }
    # Quit
    elsif @option[@position][2] == 11
      # Hide
      hide_menu
      if pbConfirmMessage(_INTL("Are you sure you want to quit the game?"))
        scene = PokemonSave_Scene.new
        screen = PokemonSaveScreen.new(scene)
        screen.pbSaveScreen
        @exit = true
        $scene=nil
      else
        # Show
        show_menu
      end
    end
  end
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
  def update_ingame
    Graphics.update
    Input.update
    pbUpdateSpriteHash(@sprites)
    pbUpdateSceneMap
  end
  
  def pbEndScene
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end
  
end
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
def pbPauseMenu
  p = HGSS_PauseMenu.new
  p.loop_pause_menu
end
#-------------------------------------------------------------------------------
class Scene_Map
  def call_menu
    $game_temp.menu_calling = false
    $game_temp.in_menu = true
    $game_player.straighten
    $game_map.update
    # HGSS Pause Menu
    pbPauseMenu 
    $game_temp.in_menu = false
  end
end
#-------------------------------------------------------------------------------