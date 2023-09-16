![ ](./pictures/framework.png)
# Documentation/Документация 

# English
### Gui placement in the world
To create a gui, use this command:
```mcfunction
function gui:gui/create/place {"folder":"","getter":"","type":"","commands":[]}
```

Parameters(determine which page to open and then can be changed by commands):

* folder (string) — determines which folder (an array similar to inventory) will be opened (consider the point when using compounds)
* type (int) — defines how the folder that the interface will open looks like:
    * 0 — opens inventory from the array by the number *folder[(id)]*
    * 1 — opens inventory from the compound by the number *folder(id)* consider the point!
    * 2 — does not use id and opens folder *folder*
* getter (int) — determines which id to use.
    * 0 — uses the page as a key (will open page 0 and moving is possible by scoreboard players set @s page x)
    * 1 — uses id as a key(scoreboard players get @s ID x)
* commands (array of strings) — commands to be executed when opening the gui
## How data is stored
All gui data is stored in the gui:main storage.

Player data is stored in the nbt storage gui:main container and is accessible from any code execution location (see below)

## Code execution locations and scripts
The code can be executed in just two places:
when opening the interface and clicking on the item. All items must be marked with the null:1b tag. Also, each item (optionally) stores its own array of commands that need to be executed when clicked.
# Русский
### Размещение интерфейса в мире
Чтобы создать интерфейс, используйте данную команду:
```mcfunction
function gui:gui/create/place {"folder":"","getter":"","type":"","commands":[]}
```
Параметры(определяют какую страницу открыть и дальше могут быть изменены командами):
* folder (string) — определяет какая папка(массив сходный с инвентарём) будет открыта(учитывайте точку при использовании компаундов)
* type (int) — определяет как выглядит папка, которую откроет интерфейс:
    * 0 — открывает инвентарь из массива по номеру folder[(id)]
    * 1 — открывает инвентарь из компаунда по номеру folder(id) учитывайте точку!
    * 2 — не использует id и открывает папку folder
* getter (int) — определяет какой id использовать.
    * 0 — использует страницу как ключ(откроет страницу ноль и перемещение возможно через scoreboard players set @s page x)
    * 1 — использует id как ключ(scoreboard players get @s ID x)
* commands (array of strings) — команды, которые будут выполнены при открытии интерфейса

## Как хранятся данные
Все данные интерфейсов хранятся в сторейдже gui:main.

Данные игрока хранятся в nbt сторейджа gui:main container и доступны из любого места выполнения кода(смотрите ниже)

## Места исполнения кода и скрипты
Код может исполняться всего в двух местах:
при открытии интерфейса и при нажатии на предмет. Все предметы должны быть помечены тегом null:1b. Также каждый предмет(опционально) хранит свой массив команд commands которые нужно исполнить при нажатии.

## The datapack is under development, errors are possible!

## Датапак находится в разработке, возможны ошибки!  
