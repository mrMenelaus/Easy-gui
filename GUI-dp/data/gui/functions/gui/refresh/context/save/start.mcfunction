data remove storage gui:main temp
execute if score @s save matches 1 if data storage gui:main container.save[] run data modify storage gui:main temp.save set from storage gui:main container.save
execute if score @s save+ matches 1 if score @s components matches 1 if data storage gui:main container.components[] run data modify storage gui:main temp.components set from storage gui:main container.components
execute unless data storage gui:main temp run return fail
function gui:gui/refresh/context/save/normal with storage gui:main container