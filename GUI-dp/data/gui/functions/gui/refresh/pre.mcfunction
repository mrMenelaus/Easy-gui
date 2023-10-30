# сохраняем id игрока для работы с ним
execute store result storage gui:main id int 1 run scoreboard players get @s ID
function gui:gui/refresh/start with storage gui:main