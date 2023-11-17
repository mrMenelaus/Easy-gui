# если входные данные не равны выходным значит игрок открыл gui впервые
execute unless score @s id = out id run function gui:search/help/temp
# приравниваем входные и выходные данные/отключанм строку выше
# (игрок уже открыл gui и ничего сохранять не нужно)
scoreboard players operation @s id = out id
