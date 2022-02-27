# Chapter 1 The Eyeball config.note



# Default likes look like:
- :D|name=value
  - ##### Unless you change them here, these are the defaults used when nothing else changes them.
    - myDefaultActualSize=0.029
    - myDefaultPosition=<0.009,0.0016,0>
    - myDefaultRatio=21.088607
    - myDefaultRotation=<0,0,0>
    - myDefaultSize=<0,0,0>
    - myDefaultTexture="fce92c78-ae92-9da7-e744-f42f2a8db93c"
    - myDefaultTextureStartNum=0
    - myDefaultTextureOffset=<0,0,0>
    - myDefaultTextureRepeats=<1,1,0>
    - myDefaultTextureRotation=0.0
    - myDefaultTime=15
    - myDefaultTextureList=[]


# Texture lines look like:
- :B|rotation
  - Use BOM eyes in this slot.
  - Rotation defaults to 270.0 and is not required
  - Remember that the system rotates eyeballs -90/270 degrees, these eyeballs follow that for BOM by default.
- :G|textureUUID|gridNumber|columns|rows|startNum|endNum|rotation
  - A shared grid texture, segment #0 is northwest corner, moves east then north.
  - All but rotation are required, rotation will default to 0.0.
  - Unless you set different start and end points for the loop all textures will be used, any you leave blank on your grid will be blank on the eyeballs.
    - ##### THIS IS NOT STANDARD SYSTEM BEHAVIOR
      - The system and all single textures default to 270.0 rotation like the system always has.
  - This is the best way to add multiple textures if you are creating the textures yourself, you can load many textures to the eyeball/s and only take up one slot in the texture cache.
  - This adds the whole texture looped from startNum to endNum.
  - Remember SecondLife starts counting at zero, a texture with 4x4 segments will be numbered 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
- :I|inventoryTextureName|rotation
  - This texture must exist in the eyeball's inventory by this name.
  - Rotation defaults to 270.0 is left out.
- :U|textureUUID|rotation
  - Normal texture UUID and rotation which defaults to 270.0 if omitted.
  - Any texture will be used, obviously an eyeball texture is best.
