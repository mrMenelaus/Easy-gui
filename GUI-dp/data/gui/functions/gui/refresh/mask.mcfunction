$execute if score @s type matches 0 run data modify block ~ ~ ~ Items set from storage gui:main $(folder)[$(number)]
$execute if score @s type matches 1 run data modify block ~ ~ ~ Items set from storage gui:main $(folder)$(number)
$execute if score @s type matches 2 run data modify block ~ ~ ~ Items set from storage gui:main $(folder)
# Soon
#execute if score #ignore boolean matches 1 run data modify block ~ ~ ~ Items append from storage gui:main save[]
#scoreboard players set #ignore boolean 0
loot replace entity @s enderchest.0 mine ~ ~ ~ air{drop:1b}
data remove block ~ ~ ~ Items