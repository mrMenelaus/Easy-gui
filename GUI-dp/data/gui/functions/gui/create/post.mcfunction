tag @s add gui
scoreboard players add #local id 1
scoreboard players operation @s id = #local id
$scoreboard players set @s boolean $(getter)
$scoreboard players set @s type $(type)
$data modify entity @s data.folder set value $(folder)
$data modify entity @s data.commands set value $(commands)
#$data modify entity @s data.ignore_slots set value $(ignore_slots)