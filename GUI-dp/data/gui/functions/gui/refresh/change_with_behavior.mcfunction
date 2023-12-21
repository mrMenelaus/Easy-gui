execute if function gui:gui/refresh/context/check_save run function gui:gui/refresh/context/save/start
execute if data storage gui:main {container:{config:{use_context:0b}}} if data storage gui:main container.save[] run function gui:gui/refresh/ignore_return
data remove storage gui:main container.save
#data remove storage gui:main container.components
data modify storage gui:main actions set from storage gui:main output[0].tag.link
function gui:help/st_fn/start
data modify storage gui:main container.config.page set value ""
execute if data storage gui:main {container:{config:{getter:1b}}} store result storage gui:main container.config.page int 1 run scoreboard players get @s page
execute if function gui:gui/refresh/context/check_load run function gui:gui/refresh/context/load/start