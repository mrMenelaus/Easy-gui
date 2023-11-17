scoreboard objectives add open.gui minecraft.custom:minecraft.open_enderchest
scoreboard objectives add main_score dummy
scoreboard objectives add components dummy
scoreboard objectives add context+ dummy 
scoreboard objectives add context dummy 
scoreboard objectives add getter dummy
scoreboard objectives add type dummy
scoreboard objectives add page dummy
scoreboard objectives add id dummy
scoreboard objectives add ID dummy
execute as @a unless score @s ID = @s ID store result score @s ID run scoreboard players add #local ID 1
tellraw @a [{"text":"GUI loaded.\n","color":"green"},{"text":"Made by Менелай.","color": "green","clickEvent": {"action": "open_url","value": "https://github.com/mrMenelaus"},"underlined": true}]
setblock 0 -63 0 minecraft:oak_sign
setblock 0 -64 0 minecraft:purple_shulker_box
data modify storage gui:main folder set value [{Slot:13b,id:"stone",Count:1b,tag:{null:1b,link:["function gui:hooks/links/test"]}}]
data modify storage gui:main test set value [{Slot:13b,id:"emerald",Count:1b,tag:{null:1b,link:["function gui:hooks/back"]}}]
data modify storage gui:main slider set value [{Count:1b,id:"diamond"},{Count:1b,id:"emerald"},{Count:1b,id:"gold_ingot"},{Count:1b,id:"iron_ingot"}]
