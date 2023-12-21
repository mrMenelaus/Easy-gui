#§e Если вы используете VSCode, пожалуйста, установите расширение Minecraft Color Highlighter
#§e If you use VSCode, pleace, install Minecraft Color Highlighter extension

# §e устанавливаем скорборды / set scoreboards

scoreboard objectives add open.gui minecraft.custom:minecraft.open_enderchest
scoreboard objectives add main_score dummy
scoreboard objectives add page dummy
scoreboard objectives add id dummy
scoreboard objectives add ID dummy

# §e Системные блоки / system blocks

setblock 0 -63 0 minecraft:oak_sign
setblock 0 -64 0 minecraft:purple_shulker_box

#define storage gui:main "Data container for gui"