data modify storage gui:main temp set from storage gui:main container.history[-1]
data modify storage gui:main container.folder set from storage gui:main temp.folder
data modify storage gui:main container.ignore_slots set from storage gui:main temp.ignore_slots
execute store result score @s getter run data get storage gui:main temp.getter
execute store result score @s use_index run data get storage gui:main temp.use_index
execute store result score @s type run data get storage gui:main temp.type
execute store result score @s components run data get storage gui:main temp.components
execute store result score @s context run data get storage gui:main temp.context
execute store result score @s context+ run data get storage gui:main temp.context+
execute store result score @s index run data get storage gui:main temp.index
data remove storage gui:main container.history[-1]