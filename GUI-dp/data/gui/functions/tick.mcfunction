# §e Точка входа / Start point

#§e Если игрок открыл эндерчест, запускается поиск / If player open an enderchest run search
execute as @a[scores={open.gui=1..}] at @s run function gui:search/start
#§e Если маркер найден, запускается эта функция / If marker has found run this function
execute as @e[type=marker,tag=active] at @s run function gui:gui/tick
