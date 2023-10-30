data remove storage gui:main save
data modify storage gui:main return set from entity @s EnderItems
data remove storage gui:main return[{tag:{null:1b}}]
execute if data storage gui:main return[] run function gui:gui/return/main