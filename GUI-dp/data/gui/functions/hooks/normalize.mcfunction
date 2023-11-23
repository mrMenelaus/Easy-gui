data modify block ~ ~ ~ Items set from storage gui:main container.components
data modify block ~ ~ ~ Items[].tag.null set value 1b
data modify storage gui:main container.components set from block ~ ~ ~ Items
data remove block ~ ~ ~ Items