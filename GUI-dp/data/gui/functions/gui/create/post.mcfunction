execute store result score @s id run scoreboard players add #local id 1
$data merge entity @s {Tags:["gui"],data:{config:$(temp)}}