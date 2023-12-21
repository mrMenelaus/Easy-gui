# §e пытаемся скопировать массив текущих предметов в массив предметов прошлого тика
$data modify storage gui:main container set from storage gui:main gui_cash.$(id) 
execute store success score #update main_score run data modify storage gui:main container.EnderItems set from entity @s EnderItems
execute if score #update main_score matches 0 run return fail
# §e если функция продолжила выполнение значит страница изменилась


## обновляем страницу
# §e убиваем все выпавшие предметы
scoreboard players set #kill main_score 1
# §e убираем все предметы которые мог забрать игрок, если удалось, то обрабатываем кнопки
execute store success score #shift main_score run data get entity @s Inventory[{tag:{null:1b}}]
execute store success score #button main_score run clear @s #minecraft:all_items{null:1b}
# §e используем сохранённые значения для выбора страницы
execute if data storage gui:main {container:{config:{getter:1b}}} store result storage gui:main container.config.page int 1 run scoreboard players get @s page
# §e обновляем страницу
execute in overworld positioned 0 -64 0 run function gui:gui/refresh/main
# §e сохраняем изменения
data modify storage gui:main container.EnderItems set from entity @s EnderItems
$data modify storage gui:main gui_cash.$(id) set from storage gui:main container