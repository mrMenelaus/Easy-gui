# §e Получаем из игрока входные данные / Get input
scoreboard players operation in id = @s id
# §e raycast or distance check

## §e raycast
# §e ставим количество шагов / set steps count
scoreboard players set itt main_score 12
# запускаем рейкаст / start raycast
execute anchored eyes run function gui:search/raycast/loop

## §e distance check
#scoreboard players set itt main_score 0
#execute as @e[type=marker,tag=gui,limit=1,distance=..8] if score @s id = @s id if predicate gui:raycast run function gui:search/raycast/found


# §e Если рейкаст вернул -1 значит мы попали в маркер
execute if score itt main_score matches -1 run function gui:search/actions/open
# §e Если рейкаст вернул 0 значит маркер не найден
execute if score itt main_score matches 0 run function gui:search/actions/close
