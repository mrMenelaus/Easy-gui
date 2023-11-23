# возвращаем -1
scoreboard players set itt main_score -1
# копируем все нужные параметры
scoreboard players operation out id = @s id
# активируем интерфейс
tag @s add active