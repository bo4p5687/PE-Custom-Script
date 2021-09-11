#===============================================================================
# Intro Script (Sun/Moon) by bo4p5687
# based in Marin's script (Easy Intro Script) and KleinStudio's script (Xtransceiver script)
#
# How to use: call script pbIntroSunMoon 
#===============================================================================
#
# To this script works, put it above main.
#
#===============================================================================

# If you use my gender selection - Sun/Moon. Set GENDER_SELECTION_7 = true and GENDER_SELECTION_ESS = false
# If you don't use, don't change default
GENDER_SELECTION_7 = false
GENDER_SELECTION_ESS = true

# Whether the Professor should offer basic help to the Player or not.
# If set to true, the professor will offer help for "Controls" and "Adventure".
PROFESSOR_SPEECH_OFFER_HELP = true

# The path to the background that will be shown in the "Adventure" help option.
PROFESSOR_SPEECH_HELP_BACKGROUND = "Pictures/helpadventurebg"

# The gender choices along with their sprites.
# What genders you can choose from. The first slot of the array is how the gender 
#  should be called upon ("a" or "an"). 
# The second slot is the actual gender itself (For the actual choosing of the gender, this will be capitalized). 
# The third slot is the location to the graphic for the gender in Graphics/path.

GENDERS = [
   ["a", "boy", "Pictures/introBoy"],
   ["a", "girl", "Pictures/introGirl"]
]

# What the Professor says at the very start of the intro. 
# You can insert a "Wait" by adding ":WAIT_(frames)" to the array.
PROF_SPEECH_START=[
   "\\bHello! Sorry to keep you waiting!",
   :WAIT_20,
   "\\bWelcome to the world of Pokémon!",
   "\\bMy name is Oak.",
   "\\bPeople call me the Pokémon Professor.",
   :WAIT_16
]

# The text that will be displayed over the background above.
# The text that will be shown in the middle of the screen, on top of the background above. 
# You can also use the :WAIT_(frames) here.
PROFESSOR_SPEECH_ADVENTURE = [
   "You are about to enter a world where you will embark on a grand adventure of your very own.",
   "Speak to people and check things wherever you go, be it in towns, roads or caves.",
   "Gather information and hints from every possible source.",
   "New paths will open to you when you help people in need, overcome challenges, and solve mysteries.",
   "At times, you will be challenged by others to a battle.",
   "At other times, wild creatures may stand in your way. By overcoming such hurdles, you will gain great power.",
   "However, your adventure is not solely about becoming powerful.",
   "On your travels, we hope that you will meet countless people and, through them, achieve personal growth.",
   "This is the most important objective of this adventure."
]

# What the Professor says at the end of his speech.
PROFESSOR_SPEECH_END = [
   "\\bThis world is widely inhabited by creatures we call Pokémon.",
   "\\bPeople and Pokémon live together by supporting each other.",
   "\\bAt times, we play with Pokémon, and at other times, we battle with them.",
   "\\bYou see...",
   # Show Pokemon
   :POKEMON,
   :WAIT_4,
   "\\bThis is a Pokemon, Marill.",
   "\\bBut despite our closeness, we don't know everything about Pokémon yet.",
   "\\bThere are still many mysteries to solve.",
   "\\bThat's why I study Pokémon every day.",
   "\\bMarill, Can you wait until I'm done talkin'to play.",   
   :DISAPPEAR,
   :WAIT_10,
   "\\bAll right, I gotta ask you some questions about yourself so I can introduce you to everybody!",   
   "\\bSo which photo should I use for your Trainer Card?",   
   :ASK_GENDER,
   :WAIT_20,
   "\\b\\PN, are you ready?",
   "\\bYour very own Pokémon story is about to unfold.",
   "\\bYou'll face fun times and tough challenges.",
   "\\bA world of dreams and adventures with Pokémon awaits! Let's go!",
   :WAIT_30,
   "\\bEnjoy the Starter Kit. Give credit when using it." # = Essentials!
]

# Miscellaneous text messages
PROFESSOR_SPEECH_NEED_HELP = "\\bIf you need help, I am certainly capable of giving it."
ASK_NAME_MESSAGE = "\\bNow what did you say your name was?"
CONFIRM_PLAYER_MESSAGE = "\\bSo this is you, \\PN?"

class AnimationIntro
    
  def initialize
    
    @viewport=Viewport.new(0,0,Graphics.width,Graphics.height)
    @viewport.z=99999
    @sprites={}
    
    @sprites["bg"] = Sprite.new(@viewport)
    @sprites["bg"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/Background")
    @sprites["bg"].x = 0
    @sprites["bg"].y = 0
    
    # Scene behind Prof
    @sprites["screen2"] = Sprite.new(@viewport)
    @sprites["screen2"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/SceneBehind")
    @sprites["screen2"].x = 5
    @sprites["screen2"].y = 5
    @sprites["screen2"].visible = false

    # Animation of Prof
    @sprites["prof"] = Sprite.new(@viewport)
    @sprites["prof"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/Prof")
    @sprites["prof"].x = 5
    @sprites["prof"].y = 5
    @sprites["prof"].visible = false
    
    @sprites["prof2"] = Sprite.new(@viewport)
    @sprites["prof2"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/Prof_2")
    @sprites["prof2"].x = 5
    @sprites["prof2"].y = 5
    @sprites["prof2"].visible = false
    
    @sprites["eyes"] = Sprite.new(@viewport)
    @sprites["eyes"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/Eyes")
    @sprites["eyes"].x = 5
    @sprites["eyes"].y = 5
    @sprites["eyes"].src_rect.width = @sprites["eyes"].bitmap.width/3
    @sprites["eyes"].src_rect.height = @sprites["eyes"].bitmap.height
    @sprites["eyes"].visible = false

    @sprites["mouth"] = Sprite.new(@viewport)
    @sprites["mouth"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/Mouth")
    @sprites["mouth"].x = 5
    @sprites["mouth"].y = 5
    @sprites["mouth"].src_rect.width = @sprites["mouth"].bitmap.width/3
    @sprites["mouth"].src_rect.height = @sprites["mouth"].bitmap.height
    @sprites["mouth"].visible = false
    
    @sprites["hand"] = Sprite.new(@viewport)
    @sprites["hand"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/Hand")
    @sprites["hand"].x = 0
    @sprites["hand"].y = 0
    @sprites["hand"].visible = false
    
    # Sprite ball
    @sprites["ball"] = Sprite.new(@viewport)
    @sprites["ball"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/Ball")
    @sprites["ball"].x = 115
    @sprites["ball"].y = 248
    @sprites["ball"].src_rect.width = @sprites["ball"].bitmap.width/4
    @sprites["ball"].src_rect.height = @sprites["ball"].bitmap.height
    @sprites["ball"].visible = false

    # Sprite Pokemon
    @sprites["poke"] = Sprite.new(@viewport)
    @sprites["poke"].bitmap = Bitmap.new("Graphics/Pictures/introMarill")
    @sprites["poke"].x = 148
    @sprites["poke"].y = 184
    @sprites["poke"].zoom_x = 2
    @sprites["poke"].zoom_y = 2  
    @sprites["poke"].visible = false

    @sprites["whitescreen"] = Sprite.new(@viewport)
    @sprites["whitescreen"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/White")
    @sprites["whitescreen"].x = 0
    @sprites["whitescreen"].y = 0
    @sprites["whitescreen"].opacity = 0
    
    @sprites["bg2"] = Sprite.new(@viewport)
    @sprites["bg2"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/Background_2")
    @sprites["bg2"].x = 0
    @sprites["bg2"].y = 0
    @sprites["bg2"].visible = false

    # Sprite screen
    for i in 0...8
      @sprites["scrn#{i}"] = Sprite.new(@viewport)
      @sprites["scrn#{i}"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/Screen")
      @sprites["scrn#{i}"].zoom_x = 0
      @sprites["scrn#{i}"].zoom_y = 0
    end
    @sprites["screen"] = Sprite.new(@viewport)
    @sprites["screen"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/Screen")
    @sprites["screen"].visible = false

    # Tool Camera 
    @sprites["camtool"] = Sprite.new(@viewport)
    @sprites["camtool"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/Camera")
    @sprites["camtool"].x = 475
    @sprites["camtool"].y = 5
    @sprites["camtool"].zoom_x = 1
    @sprites["camtool"].zoom_y = 1
    @sprites["camtool1"] = Sprite.new(@viewport)
    @sprites["camtool1"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/Camera")
    @sprites["camtool1"].x = 474
    @sprites["camtool1"].y = 4
    @sprites["camtool1"].zoom_x = 1.05
    @sprites["camtool1"].zoom_y = 1.05
    @sprites["camtool1"].visible = false
    @sprites["camtool2"] = Sprite.new(@viewport)
    @sprites["camtool2"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/Camera")
    @sprites["camtool2"].x = 473
    @sprites["camtool2"].y = 3
    @sprites["camtool2"].zoom_x = 1.1
    @sprites["camtool2"].zoom_y = 1.1
    @sprites["camtool2"].visible = false

    # Tool setting; maybe you can add other tool    
    @sprites["settingtool"] = Sprite.new(@viewport)
    @sprites["settingtool"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/Setting")
    @sprites["settingtool"].x = 475
    @sprites["settingtool"].y = 44
    @sprites["settingtool"].zoom_x = 1
    @sprites["settingtool"].zoom_y = 1
    
    @sprites["bg3"] = Sprite.new(@viewport)
    @sprites["bg3"].bitmap = Bitmap.new("Graphics/Pictures/AnimationIntro/Background")
    @sprites["bg3"].x = 0
    @sprites["bg3"].y = 0
    @sprites["bg3"].opacity = 0

    @sprites["heplbackgr"] = Sprite.new(@viewport)
    @sprites["heplbackgr"].bitmap = Bitmap.new("Graphics/#{PROFESSOR_SPEECH_HELP_BACKGROUND}")
    @sprites["heplbackgr"].opacity = 0

    @camCount = 0 
    @setCam = false
    
    @eyespeed = 6
    @mouthpeed = 4
    @howTalk = 0

    @eyesCount = 0
    @eyesCurrent = 0
    @toNextEye = 100 + rand(90)
    
    @mouthCount = 0
    @mouthCurrent = 0
    
    @speech = PROF_SPEECH_START
    @speechtwo = PROFESSOR_SPEECH_END

  end
  
  def pbStartIntro
    Graphics.update
    Input.update
    self.update
    pbBGMFade(2.0) # Begin music
    pbBGMPlay("begin") #Music
    # Check gender - gender selection of pokemon essential
    raise _INTL("Cannot have less than two genders as option") if GENDERS.size < 2
    pbToneChangeAll(Tone.new(-255,-255,-255,0),20)
    pbWait(10)
    notificationMess
    waitacceptMess
    appearScreen
    appearProf
    updateTwo
    pbBGMFade(2.0) # End music
  end
  
  # Begin show prof
  def appearProf
    @sprites["screen"].visible = false
    @sprites["bg2"].visible = true
    @sprites["screen2"].visible = true
    @sprites["whitescreen"].opacity = 220
    @sprites["screen2"].angle = 2
    @sprites["prof2"].visible = true
    @sprites["prof2"].angle = 2
    @sprites["prof"].angle = 2
    pbWait(30)
    @sprites["prof2"].visible = false
    @sprites["prof"].visible = true
    pbWait(10)
    10.times do
      @sprites["whitescreen"].opacity -= 10
      pbWait(2)
    end
    @sprites["hand"].visible = true
    40.times do
      @sprites["screen2"].angle -= 0.05
      @sprites["prof"].angle -= 0.05
      @sprites["prof2"].angle -= 0.05
      @sprites["whitescreen"].opacity -= 3
      pbWait(2)
    end
    pbWait(3)
    @sprites["prof"].visible = false
    @sprites["hand"].visible = false
    @sprites["prof2"].visible = true
    pbWait(5)
  end
  
  # Show screen
  def appearScreen
    number = [1, 2, 3, 4, 5, 6, 7, 8]
    ratio = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8]
    xscreen = [1, 1, 6, 17, 23, 29, 35, 40]
    yscreen = [4, 4, 3, 3, 3, 3, 2, 1]
    for i in 0...8
      @sprites["scrn#{i}"].x = 478 - 53*number[i] + xscreen[i]
      @sprites["scrn#{i}"].y = yscreen[i]
      @sprites["scrn#{i}"].zoom_x = ratio[i]
      @sprites["scrn#{i}"].zoom_y = ratio[i]
      pbWait(2)
      @sprites["scrn#{i}"].visible = false
    end
    @sprites["screen"].visible = true
  end
  
  # Notification
  def notificationMess
    2.times do
      pbSEPlay("Battle ball drop")
      1.times do
        @sprites["camtool"].visible = true
        @sprites["camtool1"].visible = false
        @sprites["camtool2"].visible = false
      end      
      pbWait(5)
      1.times do
        @sprites["camtool"].visible = false
        @sprites["camtool1"].visible = true
        @sprites["camtool2"].visible = false
      end
      pbWait(5)
      1.times do
        @sprites["camtool"].visible = false
        @sprites["camtool1"].visible = false
        @sprites["camtool2"].visible = true
      end
      pbWait(5)
      1.times do
        @sprites["camtool"].visible = true
        @sprites["camtool1"].visible = false
        @sprites["camtool2"].visible = false
      end      
      pbWait(32)
    end
    @setCam=true
  end
    
  def setTalk(talk)
    @howTalk += talk
  end
  
  # Animation of face (eyes, mouth)
  def updateFace
    @sprites["eyes"].visible = true
    @toNextEye -= 1 if @toNextEye != 0
    if @toNextEye == 0
      @eyesCount += 1
      if @eyesCount == @eyespeed
        @eyesCurrent = 1 
      elsif @eyesCount == @eyespeed*2
        @eyesCurrent = 2
      elsif @eyesCount == @eyespeed*3
        @eyesCurrent = 1 
      elsif @eyesCount == @eyespeed*4
        @eyesCurrent = 0
        @eyesCount = 0
        @toNextEye = 100+rand(90)
      end
      @sprites["eyes"].src_rect.x = @eyesCurrent*@sprites["eyes"].src_rect.width
    end
    @sprites["mouth"].visible = true
    if @howTalk == 0 
      @mouthCurrent = 0
      @mouthCount = 0
    end
    @sprites["mouth"].src_rect.x = @mouthCurrent*@sprites["mouth"].src_rect.width
    return if !@sprites["mouth"] || @howTalk == 0 
    @howTalk -= 1
    @mouthCount += 1
    if @mouthCount == @mouthpeed
      @mouthCurrent = 1 
    elsif @mouthCount == @mouthpeed*2
      @mouthCurrent = 2
    elsif @mouthCount == @mouthpeed*3
      @mouthCurrent = 1 
    elsif @mouthCount == @mouthpeed*4
      @mouthCurrent = 0
      @mouthCount = 0
    end
  end
  
  # Replay notification
  def updateCam
    @camCount += 1
    if Input.trigger?(Input::C)
      @setCam=false
      @sprites["camtool"].visible = true
      @sprites["camtool1"].visible = false
      @sprites["camtool2"].visible = false
    end
    if @camCount == 20 && @setCam=true
      pbSEPlay("Battle ball drop")
      1.times do
        @sprites["camtool"].visible = true
        @sprites["camtool1"].visible = false
        @sprites["camtool2"].visible = false
      end      
      pbWait(5)
      1.times do
        @sprites["camtool"].visible = false
        @sprites["camtool1"].visible = true
        @sprites["camtool2"].visible = false
      end
      pbWait(5)
      1.times do
        @sprites["camtool"].visible = false
        @sprites["camtool1"].visible = false
        @sprites["camtool2"].visible = true
      end
      pbWait(5)
      1.times do
        @sprites["camtool"].visible = true
        @sprites["camtool1"].visible = false
        @sprites["camtool2"].visible = false
      end      
      pbWait(5)
    elsif @camCount == 40 && @setCam=true
      @camCount = 0 
    end
  end
    
  def waitacceptMess
    pbMessage(_INTL("You have a message.")) { updateCam }  
  end
  
  def showSpeech(text)
    pbMessage(_INTL(text)) { updateFace }
  end
    
  def showChoice(text,choice)
    pbMessage(_INTL(text),choice) { updateFace }
  end
    
  def update
    Graphics.update
    Input.update
    updateCam
    pbUpdateSpriteHash(@sprites)
  end
  
  def updateTwo
    Graphics.update
    Input.update
    updateFace
    pbUpdateSpriteHash(@sprites)
    for i in 0...@speech.length
      if @speech[i].to_s.include?("WAIT")
        @sprites["eyes"].src_rect.x = 0
        @sprites["mouth"].src_rect.x = 0
        pbWait(@speech[i].to_s.split('_')[1].to_i)
      else
        setTalk((@speech[i].length*1.5).to_i)
        showSpeech(@speech[i])
      end
    end
    @sprites["eyes"].src_rect.x = 0
    @sprites["mouth"].src_rect.x = 0
    loop do
      break if !PROFESSOR_SPEECH_OFFER_HELP
      @howTalk = 81 # length of PROFESSOR_SPEECH_NEED_HELP
      comd = [_INTL("Controls"),_INTL("Adventure"),_INTL("No Info Needed")]
      choice = showChoice((PROFESSOR_SPEECH_NEED_HELP),comd)
      if choice == 0
        pbControlHelp
      elsif choice == 1
        @howTalk = 49 # length 
        showSpeech(("\\bWell then, without further ado..."))
        16.times {
           Graphics.update
           @sprites["bg3"].opacity += 16
           @sprites["heplbackgr"].opacity += 16
        }
        $game_system.message_position = 1
        $game_system.message_frame = 1
        for msg in PROFESSOR_SPEECH_ADVENTURE
          if msg.to_s.include?("WAIT")
            pbWait(msg.to_s.split('_')[1].to_i)
          else
            pbMessage(_INTL("<ac>#{msg}</ac>"))
          end
        end
        $game_system.message_position = 2
        $game_system.message_frame = 0
        16.times {
           Graphics.update
           @sprites["bg3"].opacity -= 16
           @sprites["heplbackgr"].opacity -= 16
        }
      else
        break
      end
    end
    pbWait(1)
    for k in 0...@speechtwo.length
      if @speechtwo[k].to_s.include?("WAIT")
        Graphics.update
        @sprites["eyes"].src_rect.x = 0
        @sprites["mouth"].src_rect.x = 0
        pbWait(@speechtwo[k].to_s.split('_')[1].to_i)
      elsif @speechtwo[k].to_s.include?("POKEMON")
        Graphics.update
        @sprites["prof2"].visible = false
        @sprites["prof"].visible = true
        pbWait(1)
        pbSEPlay("Battle throw")
        @sprites["ball"].visible = true
        @sprites["ball"].src_rect.x = @sprites["ball"].src_rect.width
        pbWait(1)
        28.times do
          @sprites["ball"].y -= 5
          # Ball animation
          pbWait(2)
          if @sprites["ball"].y <= 210 && @sprites["ball"].y >= 178
            @sprites["ball"].src_rect.x = 2*@sprites["ball"].src_rect.width
          elsif @sprites["ball"].y <= 173 && @sprites["ball"].y >= 148
            @sprites["ball"].src_rect.x = 3*@sprites["ball"].src_rect.width
          elsif @sprites["ball"].y <= 143 && @sprites["ball"].y >= 108
            @sprites["ball"].src_rect.x = 4*@sprites["ball"].src_rect.width
          end
        end
        pbWait(1)
        51.times do
          @sprites["whitescreen"].opacity += 5
          pbWait(1)
        end
        @sprites["poke"].visible = true 
        @sprites["ball"].visible = false if @sprites["whitescreen"].opacity == 255
        51.times do
          @sprites["whitescreen"].opacity -= 5
          pbWait(1)
        end
        10.times do
          @sprites["poke"].angle += 0.2
          pbWait(2)
        end
        pbSEPlay("Cries/183Cry")
        10.times do
          @sprites["poke"].angle -= 0.2
          pbWait(2)
        end
        @sprites["prof"].visible = false
        @sprites["prof2"].visible = true
      elsif @speechtwo[k].to_s.include?("DISAPPEAR")
        10.times do
          @sprites["poke"].angle += 0.2
          pbWait(2)
        end
        pbSEPlay("Cries/183Cry")
        10.times do
          @sprites["poke"].angle -= 0.2
          pbWait(2)
        end
        10.times do
          @sprites["poke"].angle -= 0.3
          pbWait(2)
        end
        2.times do 
          38.times do
            @sprites["poke"].x += 2
            @sprites["poke"].y += 1
            pbWait(2)
          end
          pbWait(1)
        end
      elsif @speechtwo[k].to_s.include?("ASK_GENDER")
        # Gender Selection
        if GENDER_SELECTION_ESS
          genderSelectEss
        elsif GENDER_SELECTION_7
          pbCallGenderSelect
          @sprites["bg3"].opacity = 255
          loop do
            pbWait(4)
            pbMessage(_INTL(ASK_NAME_MESSAGE))
            16.times { Graphics.update; @sprites["bg3"].opacity += 16 }
            pbTrainerName
            break if Kernel.pbConfirmMessage(_INTL(CONFIRM_PLAYER_MESSAGE))
          end
          51.times do
            @sprites["bg3"].opacity -= 5
            pbWait(1)
          end
        end
      else
        setTalk((@speechtwo[k].length*1.5).to_i)
        showSpeech(@speechtwo[k])
      end
    end
  end
  
  def pbEndScene
    pbDisposeSpriteHash(@sprites)
    @viewport.dispose
  end

end

def genderSelectEss
  viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
  viewport.z = 99999
  sprites = {}

  sprites[:CHAR] = Sprite.new(@viewport)
  char = sprites[:CHAR]
  genders = []
  for gender in GENDERS
    genders.push(_INTL(gender[1].capitalize))
  end
  k = "\\bAre you "
  if GENDERS.size > 2
    for i in 0...GENDERS.size
      if i != GENDERS.size - 1
        k += "#{GENDERS[i][0]} #{GENDERS[i][1]}, "
      else
        k += "or #{GENDERS[i][0]} #{GENDERS[i][1]}?"
      end
    end
  else
    k += "#{GENDERS[0][0]} #{GENDERS[0][1]} or #{GENDERS[1][0]} #{GENDERS[1][1]}?"
  end
  5.times do 
    Graphics.update
    @sprites["bg3"].opacity += 51
    pbWait(1)
  end
  loop do
    pbWait(4)
    gender = pbMessage(_INTL(k), genders)
    pbChangePlayer(gender)
    char.bitmap = Bitmap.new("Graphics/#{GENDERS[gender][2]}")
    char.ox = char.bitmap.width / 2
    char.oy = char.bitmap.height
    char.x = Graphics.width / 2
    char.y = Graphics.height / 2 + 64
    char.opacity = 0
    16.times { Graphics.update; char.opacity += 16; @sprites["bg3"].opacity += 16 }
    pbMessage(_INTL(ASK_NAME_MESSAGE))
    pbTrainerName
    if Kernel.pbConfirmMessage(_INTL(CONFIRM_PLAYER_MESSAGE))
      break
    else
      32.times { Graphics.update; char.opacity -= 8}
    end
  end
  32.times { Graphics.update; char.opacity -= 8; pbWait(1) }
  pbWait(1)
  32.times { Graphics.update; @sprites["bg3"].opacity -= 8; pbWait(1) }
end

def pbControlHelp
  vp=Viewport.new(0,0,Graphics.width,Graphics.height)
  vp.z=99999; sp={}
  sp[:bg]=Sprite.new(vp)
  sp[:bg].bitmap=Bitmap.new("Graphics/Pictures/helpbg")
  sp[:bg].opacity=0
  sp[:bmp]=BitmapSprite.new(Graphics.width, Graphics.height, vp)
  sp[:bmp].opacity=0
  bmp=sp[:bmp].bitmap
  pbSetSystemFont(bmp)
  b=Color.new(255,255,255)
  s=Color.new(166,166,166)
  drawTextEx(bmp,112,32,400,2,"Moves the main character. Also used to scroll through list entries.",b,s)
  sp[:dir]=Sprite.new(vp)
  sp[:dir].bitmap=Bitmap.new("Graphics/Pictures/helpArrowKeys")
  sp[:dir].x = 18;sp[:dir].y=42;sp[:dir].opacity=0
  drawTextEx(bmp,112,110,400,2,"Used to confirm a choice, check things, and talk to people.",b,s)
  sp[:c]=Sprite.new(vp)
  sp[:c].bitmap=Bitmap.new("Graphics/Pictures/helpCkey")
  sp[:c].x=34;sp[:c].y=120;sp[:c].opacity=0
  drawTextEx(bmp,112,188,400,2,"Used to exit, cancel a choice or mode, and open the pause menu.",b,s)
  sp[:x]=Sprite.new(vp)
  sp[:x].bitmap=Bitmap.new("Graphics/Pictures/helpXkey")
  sp[:x].x=34;sp[:x].y=198;sp[:x].opacity=0
  drawTextEx(bmp,112,266,400,2,"Hold down while walking to run.",b,s)
  sp[:z]=Sprite.new(vp)
  sp[:z].bitmap=Bitmap.new("Graphics/Pictures/helpZkey")
  sp[:z].x=34;sp[:z].y=262;sp[:z].opacity=0
  drawTextEx(bmp,112,320,400,2,"Press to use a registered Key Item.",b,s)
  # If you use v.17, add sprite F5, this is in v.16 
#  sp[:f5]=Sprite.new(vp)
#  sp[:f5].bitmap=Bitmap.new("Graphics/Pictures/helpF5key")
#  sp[:f5].x=34;sp[:f5].y=316;sp[:f5].opacity=0
  16.times{Graphics.update;sp.each{|k,v|v.opacity+=16}}
  loop {
    Input.update
    Graphics.update
    if Input.trigger?(Input::C) || Input.trigger?(Input::B)
      16.times{Graphics.update;sp.each{|k,v|v.opacity-=16}}
      pbDisposeSpriteHash(sp)
      vp.dispose
      break
    end
  }
end  
  
class IntroStart
  
  def initialize(scene)
    @scene=scene
  end
  
  def pbStartScreen
    @scene.pbStartIntro
    @scene.pbEndScene
  end
  
end
  
def pbIntroSunMoon
  scene=AnimationIntro.new
  screen=IntroStart.new(scene)
  screen.pbStartScreen
end