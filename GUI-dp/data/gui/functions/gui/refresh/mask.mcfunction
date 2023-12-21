function gui:gui/refresh/get_gui with storage gui:main container.config
execute if data storage gui:main container.save[] run data modify block ~ ~ ~ Items append from storage gui:main container.save[]
data remove storage gui:main container.save
execute if data storage gui:main {container:{config:{use_components:1b}}} run data modify block ~ ~ ~ Items append from storage gui:main container.components[]
loot replace entity @s enderchest.0 mine ~ ~ ~ air{drop:1b}
data remove block ~ ~ ~ Items