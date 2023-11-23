data remove storage gui:main temp
data modify storage gui:main temp.folder set from storage gui:main container.folder
data modify storage gui:main temp.ignore_slots set from storage gui:main container.ignore_slots
execute store result storage gui:main temp.getter int 1 run scoreboard players get @s getter
execute store result storage gui:main temp.type int 1 run scoreboard players get @s type
execute store result storage gui:main temp.components int 1 run scoreboard players get @s components
execute store result storage gui:main temp.save int 1 run scoreboard players get @s save
execute store result storage gui:main temp.save+ int 1 run scoreboard players get @s save+
execute store result storage gui:main temp.load int 1 run scoreboard players get @s load
execute store result storage gui:main temp.load+ int 1 run scoreboard players get @s load+
execute store result storage gui:main temp.page int 1 run scoreboard players get @s page
data modify storage gui:main container.history append from storage gui:main temp