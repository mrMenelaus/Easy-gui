$execute if data storage gui:main {container:{config:{type:2b}}} run return run data modify storage gui:main contexts.$(id).$(folder) set from storage gui:main temp
$execute if data storage gui:main {container:{config:{type:0b}}} run return run data modify storage gui:main contexts.$(id).$(folder)!!!$(page) set from storage gui:main temp
$execute if data storage gui:main {container:{config:{type:1b}}} run data modify storage gui:main contexts.$(id).$(folder)$(page) set from storage gui:main temp