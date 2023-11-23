## GOOD
# пытаемся скопировать массив текущих предметов в массив предметов прошлого тика
$data modify storage gui:main container set from storage gui:main gui_cash.$(id) 
execute store result score #update main_score run data modify storage gui:main container.EnderItems set from entity @s EnderItems
execute unless score #update main_score matches 1 run return 1
# если функция продолжила выполнение значит страница изменилась


## обновляем страницу
# убиваем все выпавшие предметы
scoreboard players set #kill main_score 1
# убираем все предметы которые мог забрать игрок, если удалось, то обрабатываем кнопки
execute store result score #shift main_score run data get entity @s Inventory[{tag:{null:1b}}]
execute store result score #button main_score run clear @s #minecraft:all_items{null:1b}
# используем сохранённые значения для выбора страницы
execute if score @s getter matches 1 store result storage gui:main container.number int 1 run scoreboard players get @s page
# обновляем страницу
execute in overworld positioned 0 -64 0 run function gui:gui/refresh/main
# сохраняем изменения
data modify storage gui:main container.EnderItems set from entity @s EnderItems
$data modify storage gui:main gui_cash.$(id) set from storage gui:main container