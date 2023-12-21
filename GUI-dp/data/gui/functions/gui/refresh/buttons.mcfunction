function gui:gui/refresh/get_gui with storage gui:main container.config
function gui:help/st_op/start
data remove storage gui:main actions
data modify storage gui:main actions set from storage gui:main output[0].tag.commands
execute at @s run function gui:help/st_fn/start
execute if data storage gui:main output[0].tag.link[] run function gui:gui/refresh/change_with_behavior