# загружаем сохранённый эндерчест игрока если id не равен нулю.
#(иначе мы рискуем загрузить инвентарь когда не надо)
execute unless score @s id matches 0 in overworld positioned 0 -64 0 run function gui:search/help/close
# ресетаем все скоры
scoreboard players set @s id 0
scoreboard players reset @s open.gui