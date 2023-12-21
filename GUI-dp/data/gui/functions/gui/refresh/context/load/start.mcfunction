data remove storage gui:main temp
function gui:gui/refresh/context/load/get with storage gui:main container.config
execute if data storage gui:main {container:{config:{use_load:1b}}} run data modify storage gui:main container.save set from storage gui:main temp.save
execute if data storage gui:main {container:{config:{use_load+:1b}}} run data modify storage gui:main container.components set from storage gui:main temp.components