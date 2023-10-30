# возвращаем -1
scoreboard players set itt main_score -1
# копируем все нужные параметры
scoreboard players operation out id = @s id
scoreboard players operation out boolean = @s boolean
scoreboard players operation out type = @s type
data modify storage gui:main marker set from entity @s data

# активируем интерфейс
tag @s add active