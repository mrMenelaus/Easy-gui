# иттераций столько - сколько слотов
data modify storage gui:main container.save set from storage gui:main return
execute store result score #itt main_score if data storage gui:main container.config.ignore_slots[]
# массив - слоты
data modify storage gui:main array set from storage gui:main container.config.ignore_slots
# начинаем перебор
data modify storage gui:main temp set from storage gui:main array[-1]
data remove storage gui:main container.save
function gui:help/inputs/loop with storage gui:main