# §e если входные данные не равны выходным значит игрок открыл gui впервые
execute unless score @s id = out id run function gui:search/help/open
# §e приравниваем входные и выходные данные/отключаем строку выше
scoreboard players operation @s id = out id
