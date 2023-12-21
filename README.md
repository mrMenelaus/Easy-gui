![ ](./pictures/framework.png)
# English
Easy GUI is a very powerful framework with solid optimization that allows you to create complex interfaces in a matter of seconds.
# Content
1. [Interface placement in the world](#interface-placement-in-the-world)
2. [Parameters](#parameters)
3. [Creating pages](#creating-pages)
4. [Button creation](#button-creation)
    1. [commands tag](#commands-tag)
    2. [link tag](#link-tag)
5. [A little bit about the work of the framework](#a-little-bit-about-the-work-of-the-framework)
## Interface placement in the world
To place the interface, run this function:
```mcfunction
function gui:gui/create/place {args:{config:{},else:{}}}
```
The placement command has access to tags on_open, on_change, on_close string array type — commands that will be executed when opening, when any page changes, and when closing, respectively. Also there is components tag to insert items added after opening.
## Parameters
All page parameters from args instead of on_open are copied to the player when opened. The interface placement function has default parameter values. The only required parameter is folder.
### Config parameters
|   Parameters   |             Data type              | Value by default |
| :------------: | :--------------------------------: | :--------------: |
|     folder     |               string               |     required     |
|      type      |      byte number from 0 to 2       |        2b        |
|     getter     |              boolean               |      false       |
|  ignore_slots  | array of byte numbers from 0 to 26 |        []        |
| use_components |              boolean               |      false       |
|    use_save    |              boolean               |      false       |
|   use_save+    |              boolean               |      false       |
|    use_load    |              boolean               |      false       |
|   use_load+    |              boolean               |      false       |
### Else parameters
| Parameters |         Data type         | Value by default |
| :--------: | :-----------------------: | :--------------: |
| components |      array of items       |        []        |
|  on_open   | array of strings-commands |        []        |
| on_change  | array of strings-commands |        []        |
|  on_close  | array of strings-commands |        []        |
### Parameter values
#### Path Parameters
To open a page, the framework concatenates the path to it using the following parameters:
* folder — sets the path string to the interface in the storage.
* type — defines how the path to the page will look like:
    * 0b - folder[$(page)]
    * 1b - folder$(page)
    * 2b - folder
* getter — optimizes paths.
    * false - player's score page will not be used(type=2b).
    * true - player's score page will be used(type=0b,1b).
#### Page parameters
* ignore_slots — slots where the player can place items.
* use_components — determines whether an array of components will be added to the item on the page.
* use_save — determines the saving of the put items.
    * 0 - return the items to the player.
    * 1 - save on the page.
* use_save+ — defines saving of components.
    * 0 - delete components.
    * 1 - save components.
* use_load — determines the loading of the placed items.
    0 - do not upload.
    1 - upload.
* use_load+ — determines the loading of components.
    0 - do not upload.
    1 - upload.

The page parameter are copied to the player's scoreboards of the same name. Other parameters are copied to the player's `container` storage. Later you can edit parameters using `data modify storage gui:main container.config.{folder,type,getter,ignore_slots,use_components,use_save,use_save+,use_load,use_load+} set value {value}`, `data modify storage storage gui:main container.{on_change,on_close,components} set value {value}`
## Creating pages
A page in the framework is just an array of special items (see below), the same as, for example, a barrel, located in the gui:main storage. **All items and components on the page must be marked with the null:1b tag!**
## Button creation
There are link and commands tags for creating buttons.
### Link tag
This tag causes the behavior of changing path parameters, that is, if you put your commands here, when you click on the button, the framework will try to save and load the context, you can also use saving the page or returning to the previous one using the commands:
```mcfunction
function gui:hooks/save_history

function gui:hooks/back
```
### Commands tag
This tag is needed to execute any commands that are not related to changing page parameters.
## A little bit about the work of the framework
During the operation of the framework, each player receives an score `ID`, with which his storage is linked to him. All player data is stored in the `gui' storage:main gui_cash.ID`

When the player opens the ender chest, the `gui:search/start` function is executed, in which we try to find a marker with the `gui` tag in one of two ways: a raycast or an entity search using distance. With the help of some id logic, we can track that the player has opened or closed the gui. When opening the interface, the `gui:search/help/temp` function is executed, in which we use macros to copy the player's `gui' story:main gui_cash.ID ` in `gui:main container`, we copy all the parameters from the marker to it, also run commands from it, and then, the `gui:main container` is saved back to the `gui:main gui_cash.ID`. Also, when we open it for the first time, we add all saved contexts, if the parameters require it, load the page using the `gui:gui/refresh/mask` function.

Next, each tick marker will receive the active tag, and run the `gui:gui/tick` function, in which execution using the id goes to the players, and with the help of macros we get the `gui:main container` with all the player's data, which is available everywhere else, and is saved to the player at the end of all processes.

So, we are trying to copy the contents of the ender chest into the storage `gui:main container.EnderItems`. If we succeeded, the `gui:gui/refresh/main` function is executed.

In it, we tell the framework to kill all items marked with the `null:1b` tag.

Here we write to the variable `#shift main_score` whether there was an item with the tag `null:1b` in the player's inventory, clear all items marked with the tag `null:1b` from the player, writing to the score `#buttons main_score`.

Copying the items of the ender chest to the storage `gui:main return` and delete all items also marked with the `null:1b` tag, if necessary, we pass the remaining items through a function that will remove all slots allowed by the `ignore_slots` tag from the `return` array, and create another `gui:main container.save`. If there is something left in the `return` array, we return the items to the player through the shalker at coordinates `0 -64 0'.

If the player's score `#buttons main_score` is 1, we process the buttons. To do this, we calculate all the items on the page: copy all the items from the path, load the components if necessary. From it, we subtract the array of items from the player's ender chest. If the remaining item has `link` or `commands` tags, we process them using a loop with macros. The `link` tag before this runs the `gui:gui/refresh/change_with_behavior` function, which handles saving the context.

After the buttons, an array of page change commands `on_change` is executed.

And finally, the `gui:gui/refresh/mask` function is executed. In it, we get items from the right path, add arrays of components and put items.

When the player exits the ender chest, we no longer find the marker and the `gui:search/help/temp` function is launched, in which contexts are saved or items are returned, and the `on_close` command array is also launched.

A generalized scheme of all processes:

search → open → compare → return → buttons → load → close

# Russian
Easy GUI — очень мощный фреймворк с солидной оптимизацией, позволяющий создавать сложные интерфейсы за считанные секунды.
# Содержание
1. [Размещение интерфейса в мире](#размещение-интерфейса-в-мире)
2. [Параметры](#параметры)
3. [Создание страниц](#создание-страниц)
4. [Создание кнопок](#создание-кнопок)
    1. [Тег commands](#тег-commands)
    2. [Тег link](#тег-link)
5. [Немного о работе фреймворка](#немного-о-работе-фреймворка)
<<<<<<< HEAD
=======
6. [Примеры использования](#примеры-использования)
>>>>>>> d93d2fc3c861c4732a55dd895275cb002d58d65a
## Размещение интерфейса в мире
Чтобы разместить интерфейс, запустите эту функцию:
```mcfunction
function gui:gui/create/place {args:{config:{},else:{}}}
```
Команде размещения доступны теги else типа массив строк on_open, on_change, on_close — команды, которые выполнятся при открытии, при любом изменению страницы и при закрытии соответственно. Также тег components для добавления первичных компонентов.
## Параметры
Все параметры будут скопированы в игрока при открытии. Функция размещения интерфейса имеет значения параметров по умолчанию. Единственный необходимый параметр — folder.
### Таблица параметров
#### Config параметры
|   Параметр   |          Тип данных          | Значение по умолчанию |
| :----------: | :--------------------------: | :-------------------: |
|    folder    |            строка            | обязательный параметр |
|     type     |     byte число от 0 до 2     |           2           |
|    getter    |            булев             |         false         |
| ignore_slots | массив byte чисел от 0 до 26 |          []           |
|  components  |            булев             |         false         |
|     save     |            булев             |         false         |
|    save+     |            булев             |         false         |
|     load     |            булев             |         false         |
|    load+     |            булев             |         false         |
### Значения параметров
#### Параметры пути
Чтобы открыть страницу, фреймворк собирает путь до неё, используя следующие параметры:
* folder — задаёт строку пути до интерфейса в сторейдже.
* type — определяет как будет выглядеть путь до страницы:
    * 0b - folder[$(page)]
    * 1b - folder$(page)
    * 2b - folder
* getter — оптимизирует пути.
    * false - score игрока page не будет использоваться(type=2).
    * true - score игрока page будет использоваться(type=0,1).
#### Параметры страницы
* ignore_slots — слоты, в которые игрок может поместить предметы.
* use_components — определяет будет ли массив компонентов прибавлен к предмета на странице.
* use_save — определяет сохранение положенных предметов.
    * false - вернуть положенные предметы игроку.
    * true - сохранить на странице.
* use_save+ — определяет сохранение компонентов.
    * false - удалить компоненты.
    * true - сохранить компоненты.
* use_load — определяет загрузку положенных предметов.
    false - не загружать.
    true - загрузить.
* use_load+ — определяет загрузку компонентов.
    false - не загружать.
    true - загрузить.

Параметры type, getter, components, save, save+, load, load+ копируются в одноимённые скорборды игрока, а параметры folder, ignore_slots, on_change, on_close в сторейдж игрока `container`.
## Создание страниц
Страница в  фреймворке это просто массив специальных предметов(смотрите ниже), такой же как, например, у бочки, расположенный в сторейдже gui:main. **Все предметы и компоненты на странице должны быть помечены тегом null:1b!**
## Создание кнопок
Для создания кнопок существуют теги link и commands.
### Тег link
Данный тег вызывает поведение смены параметров пути, то есть, если поместить ваши команды сюда, при нажатии на кнопку фреймворк будет пытаться сохранить и загружить контекст, также вы можете использовать сохранение страницы или возвращение к предыдущей с помощью команд:
```mcfunction
function gui:hooks/save_history

function gui:hooks/back
```
### Тег commands
Данный тег нужен для выполнения любых комманд не связанных с изменением параметров страницы.
## Немного о работе фреймворка
В процессе работы фреймворка каждый игрок получает счёт `ID`, с помощью которого к нему привязывается свой сторейдж. Все данные игроков хранятся в сторейдже `gui:main gui_cash.ID`

Когда игрок открывает эндер сундук, запускается функция `gui:search/start`, в которой мы пытаемся найти маркер с тегом `gui` одним из двух способов: рейкаст или поиск сущности с помощью distance. С помощью некоторой id логики, мы можем отследить, что игрок открыл или закрыл gui. При открытии интерфейса запускается функция `gui:search/help/temp`, в которой с помощью макросов мы копируем сторейдж игрока `gui:main gui_cash.ID` в `gui:main container`, в него переносим все параметры из маркера,также запускаем команды из него, и затем, сторейдж `gui:main container` сохраняется обратно в `gui:main gui_cash.ID`. Также при первом открытии мы добавляем все сохранённые контексты если этого требуют параметры, загружаем страницу, используя функцию `gui:gui/refresh/mask`.

Далее каждый тик маркер будет получать тег active, и запускать функцию `gui:gui/tick`, в ней исполнение с помощью id переходит к игрокам, и с помощью макросов мы снова получаем сторейдж `gui:main container` со всеми данными игрока, который доступен везде далее, и сохраняется в игрока по окончанию всех процессов.

Итак, мы пытаемся скопировать содержимое эндер сундука в сторейдж `gui:main container.EnderItems`. Если нам это удалось запускается функция `gui:gui/refresh/main`. 

В ней мы говорим фреймворку убить все предметы, помеченные тегом `null:1b`.

Здесь мы записываем в переменную `#shift main_score` был ли предмет с тегом `null:1b` в инвентаре игрока,очищаем у игрока все предметы помеченные тегом `null:1b`, записывая в score `#buttons main_score`.

Копируем предметы эндер сундука в сторейдж `gui:main return` и удаляем все предметы, также помеченные тегом `null:1b`, оставшиеся предметы при надобности пропускаем через функцию, которая удалит все разрешённые тегом `ignore_slots` слоты из массива `return`, и создаст другой массив `gui:main container.save`. Если что-то осталось в массиве `return`, возвращаем предметы игроку через шалкер на координатах `0 -64 0`. 

Если счёт игрока `#buttons main_score` равен 1 и больше, обрабатываем кнопки. Для этого, вычисляем все предметы на странице: копируем все предметы из пути, загружаем компоненты если нужно. Из него вычитаем массив предметов эндер сундука игрока. Если оставшийся предмет имеет теги `link` или `commands` обрабатываем их с помощью цикла с макросами. Тег `link` перед этим запускает функцию `gui:gui/refresh/change_with_behavior`, в которой обрабатывается сохранение контекста.

После кнопок исполняется массив команд смены страницы `on_change`.

И наконец исполняется функция `gui:gui/refresh/mask`. В ней мы получаем предметы из нужного пути, добавляем массивы компонентов и положенных предметов.

Когда игрок выходит из эндер сундука мы больше не находим маркер и запускается функция `gui:search/help/temp`, в которой сохраняются контексты или возвращаются предметы, также запускается массив команд `on_close`.

Обобщённая схема всех процессов:

поиск → открытие → сравнение → возвращение → кнопки → загрузка → закрытие

