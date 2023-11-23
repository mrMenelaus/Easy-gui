$execute if score @s type matches 2 run return run data modify block ~ ~ ~ Items set from storage gui:main $(folder)
$execute if score @s type matches 0 run return run data modify block ~ ~ ~ Items set from storage gui:main $(folder)[$(number)]
$execute if score @s type matches 1 run return run data modify block ~ ~ ~ Items set from storage gui:main $(folder)$(number)