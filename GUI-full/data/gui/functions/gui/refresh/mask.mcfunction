function gui:gui/refresh/get_gui with storage gui:main container
execute if data storage gui:main container.save[] run data modify block ~ ~ ~ Items append from storage gui:main container.save[]
data remove storage gui:main container.save
execute if score @s components matches 1 run data modify block ~ ~ ~ Items append from storage gui:main container.components[]
loot replace entity @s enderchest.0 mine ~ ~ ~ air{drop:1b}
data remove block ~ ~ ~ Items