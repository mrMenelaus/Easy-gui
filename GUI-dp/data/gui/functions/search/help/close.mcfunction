function gui:help/return_ender/load
execute store result storage gui:main id int 1 run scoreboard players get @s ID 
function gui:search/help/set_container with storage gui:main
data modify storage gui:main return set from storage gui:main container.EnderItems
data remove storage gui:main return[{tag:{null:1b}}]
execute if data storage gui:main container.ignore_slots[] run function gui:help/inputs/start 
execute if data storage gui:main return[] run function gui:gui/refresh/return
execute if score @s getter matches 1 store result storage gui:main container.number int 1 run scoreboard players get @s page
execute if function gui:gui/refresh/context/check_save run function gui:gui/refresh/context/save/start
execute if score @s save matches 0 if data storage gui:main container.save[] run function gui:gui/refresh/ignore_return
function gui:gui/refresh/context/remove
execute if data storage gui:main container.on_close[] run function gui:search/help/on_close
function gui:search/help/save_folder with storage gui:main