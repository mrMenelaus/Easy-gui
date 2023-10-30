scoreboard objectives add open.gui minecraft.custom:minecraft.open_enderchest
scoreboard objectives add boolean dummy 
scoreboard objectives add page dummy 
scoreboard objectives add main_score dummy
scoreboard objectives add id dummy
scoreboard objectives add ID dummy
scoreboard objectives add type dummy
scoreboard objectives add history dummy
setblock 0 -63 0 minecraft:oak_sign
setblock 0 -64 0 minecraft:purple_shulker_box
execute as @a unless score @s ID = @s ID store result score @s ID run scoreboard players add #local ID 1
data modify storage gui:main example set value [{Count:1b,Slot:11b,id:"minecraft:iron_ingot",tag:{commands:["function gui:gui/help/give with storage gui:main output[0]"],null:1b}},{Count:1b,Slot:13b,id:"minecraft:iron_axe",tag:{Damage:0,commands:["kill @s"],null:1b}},{Count:1b,Slot:15b,id:"minecraft:iron_chestplate",tag:{Damage:0,commands:["item replace entity @s armor.chest with minecraft:iron_chestplate","item replace entity @s armor.legs with minecraft:iron_leggits"],null:1b}},{Count:1b,Slot:26b,id:"minecraft:barrier",tag:{CustomModelData:2,display:{Name:'{"text":"Made by Менелай","color":"aqua","italic":false}'},null:1b}}]