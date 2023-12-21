function gui:hooks/save_history
data modify storage gui:main container.config.ignore_slots set value []
data modify storage gui:main container.components set value [{Slot:0b,id:"arrow",Count:1b,tag:{null:1b,link:["function gui:hooks/back"]}}]
data modify storage gui:main container.config.folder set value "test2"
