$data modify storage gui:main container set from storage gui:main gui_cash.$(id)
data modify storage gui:main container.EnderItems set from entity @s EnderItems
data modify storage gui:main container.folder set from storage gui:main marker.folder
#data remove storage gui:main container.ignore_slots
#data modify storage gui:main container.ignore_slots set from storage gui:main marker.ignore_slots