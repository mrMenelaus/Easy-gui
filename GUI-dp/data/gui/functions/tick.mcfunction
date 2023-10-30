### выполнение кода начинается отсюда
# если игрок открыл эндерчест запускается эта функция
execute as @a[scores={open.gui=1..}] at @s run function gui:search/start
# если маркер найден, выполняется эта функция
execute as @e[type=marker,tag=active] at @s run function gui:gui/tick
