data modify storage gui:main container.config set from storage gui:main container.history[-1]
execute store result score @s page run data get storage gui:main container.config.page
data remove storage gui:main container.history[-1]