data modify storage gui:main button set from storage gui:main container.EnderItems
data modify storage gui:main container.temp_folder set from storage gui:main container.folder
data modify storage gui:main container.save_folder set from storage gui:main container.folder
$execute if score @s type matches 0 run function gui:help/st_op/start {"storage":"gui:main","array1":"$(folder)[$(number)]","array2":"button"}
$execute if score @s type matches 1 run function gui:help/st_op/start {"storage":"gui:main","array1":"$(folder)$(number)","array2":"button"}
$execute if score @s type matches 2 run function gui:help/st_op/start {"storage":"gui:main","array1":"$(folder)","array2":"button"}
data remove storage gui:main actions
data modify storage gui:main actions set from storage gui:main output[0].tag.commands
execute at @s run function gui:help/st_fn/start {"storage":"gui:main","array":"actions"}
execute store success score #true main_score run data modify storage gui:main container.temp_folder set from storage gui:main container.folder
execute if score #true main_score matches 1 run function gui:gui/refresh/change
execute if score @s type matches ..1 run function gui:gui/get_page