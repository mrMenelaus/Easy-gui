data remove storage gui:main temp
function gui:gui/refresh/context/load/get with storage gui:main container
execute if score @s load matches 1 run data modify storage gui:main container.save set from storage gui:main temp.save
execute if score @s load+ matches 1 run data modify storage gui:main container.components set from storage gui:main temp.components