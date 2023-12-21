setblock ~ ~ ~ ender_chest
execute store result score @s id run scoreboard players add #local id 1
tag @s add gui
data modify entity @s data set from storage gui:main temp