# получаем из игрока входные данные / get input
scoreboard players operation in id = @s id
# raycast or distance check

## raycast
# ставим количество шагов / set steps count
#scoreboard players set itt main_score 12
# запускаем рейкаст / start raycast
#execute anchored eyes run function gui:search/raycast/loop

## distance check
scoreboard players set itt main_score 0
execute as @e[type=marker,tag=gui,limit=1,distance=..8] if predicate gui:raycast run function gui:search/raycast/found


# если рейкаст вернул -1 значит мы попали в маркер
execute if score itt main_score matches -1 run function gui:search/actions/open
# если рейкаст вернул 0 значит маркер не найден
execute if score itt main_score matches 0 run function gui:search/actions/close
