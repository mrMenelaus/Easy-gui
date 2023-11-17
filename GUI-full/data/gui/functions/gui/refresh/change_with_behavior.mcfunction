execute if function gui:gui/refresh/context/check run function gui:gui/refresh/context/save/start
execute if score @s context matches 0 if data storage gui:main container.save[] run function gui:gui/refresh/ignore_return
data remove storage gui:main container.save
data remove storage gui:main container.components
data modify storage gui:main actions set from storage gui:main output[0].tag.link
function gui:help/st_fn/commands/start
data modify storage gui:main container.number set value ""
execute if score @s getter matches 1 store result storage gui:main container.number int 1 run scoreboard players get @s page
execute if function gui:gui/refresh/context/check run function gui:gui/refresh/context/load/start