data remove storage gui:main temp
data merge storage gui:main {temp:{config:{type:2b,getter:0b,ignore_slots:[],use_components:0b,use_save:0b,use_save+:0b,use_load:0b,use_load+:0b},else:{on_open:[],on_change:[],on_close:[],components:[]}}}
$data merge storage gui:main {temp:$(args)} 
execute if data storage gui:main temp.config.folder align xyz positioned ~0.5 ~0.5 ~0.5 summon marker run return run function gui:gui/create/post
tellraw @s {"text":"Error: you forgot a folder.","color":"red"}