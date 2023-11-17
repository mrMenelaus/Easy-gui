# Soon
execute unless block ~ ~ ~ barrel run return 0
data modify block ~ ~ ~ Items[].tag.null set value 1b
#$data modify storage gui:main $(folder) set from block ~ ~ ~ Items
data modify storage gui:main temp set from block ~ ~ ~ Items
data modify block 0 -63 0 front_text.messages[0] set value '{"nbt":"temp","storage":"gui:main"}'
data modify storage gui:main temp set from block 0 -63 0 front_text.messages[0]
function gui:help/generator/temp with storage gui:main