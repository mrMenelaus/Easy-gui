# убираем шаг
scoreboard players remove itt main_score 1
# от всех маркеров запускаем функцию
execute as @e[type=marker,tag=gui,limit=1,distance=..2] if score @s id = @s id if predicate gui:raycast run function gui:search/raycast/found
execute if score itt main_score matches 1.. positioned ^ ^ ^0.5 run function gui:search/raycast/loop