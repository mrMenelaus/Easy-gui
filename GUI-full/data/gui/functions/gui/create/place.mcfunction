# параметры
# type
# folder
# getter
# slots *
# components *
# commands *
#function gui:gui/create/place {args:{type:1,folder:"folder",getter:1}}
data remove storage gui:main temp
data merge storage gui:main {temp:{type:2,getter:0,ignore_slots:[],components:0,commands:[],context:0,context+:0}}
$data merge storage gui:main {temp:$(args)} 
execute unless data storage gui:main temp.folder run return run tellraw @s {"text":"Error: you forgot a folder.","color":"red"}

setblock ~ ~ ~ ender_chest
execute align xyz positioned ~0.5 ~0.5 ~0.5 summon marker run function gui:gui/create/post with storage gui:main