# Civilization 13
<!--
[![Build Status](https://travis-ci.com/Civ13/Civ13.svg?branch=master)](https://travis-ci.com/Civ13/Civ13)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/civ13/civ13.svg?style=flat)
![GitHub repo size](https://img.shields.io/github/repo-size/civ13/civ13.svg?style=flat)
-->
## ЧТО ЭТО ТАКОЕ?

Civ13 (ранее 1713) - игра, основанная на коде Space Station 13, в котором представлены несколько эпох в истории человечества. (отсюда и название). В нем есть как RP, так и боевые карты и игровые режимы.

<kbd>
 <img src="https://i.imgur.com/napac0L.png">
</kbd>


## Конфа
[![discord](https://discord.com/api/guilds/896037329888764004/widget.png)](https://vk.cc/cpakPw)


## Сайт
Оригинальной цивы https://civ13.com/
Нашей цивы https://lambda13.ru

## Как начать играть
Вам понадобится машина с Windows или виртуальная машина, на которой она будет запущена ОС.

1. Скачиваете клиент по данной ссылке http://www.byond.com/download/

2. Регистрируетесь тут https://secure.byond.com/Join

3. Запускаете BYOND клиент **BYOND/bin/Byond.exe** и входите.

4. Нажимаете в списке слева **Space Station 13** и ищете в списке справа **Civilization 13** сервер.

5. Играете!

## WEB/CDN ДОСТАВЩИК РЕСУРС ФАЙЛА

Обычно игра скачивает .rsc файл непосредственно через BYOND, что вызывает большие лаги при большом количестве игроков.
Данный костыль должен облегчить нагрузку и убрать подтормаживания игры.

1. Отредактируйте compile_options.dm и установите значение `PRELOAD_RSC` на `0`
1. Добавьте ссылку в config/external_rsc_urls указав .zip файл содержащий .rsc или сам .rsc.
    * Вот пример как должна выглядить ссылка http://tgstation13.download/byond/tgstation.zip. Воспользуйтесь сервисами вроде CDN77 или cloudflare (только в Pade Rules включить кэширование zip файлов) для ускорения доставки ресурс файла, ну или поднимите свой CDN.
	* Можно и не поднимать свой CDN а поднять, например, Apache или любой другой HTTP-сервер. В любом случае это уменьшает нагрузку на сервер.

## Хочу настроить свой сервер
1. Для автоматической установки вам понадобится Linux-машина, рекомендую Ubuntu. Откройте командную строку.
 
2. Скачайте установкщик. Используйте комманду ***wget https://raw.githubusercontent.com/Civ13/Civ13/master/INSTALL*** для этого. Если у вас не установлен wget, для начала введите ***sudo apt install wget*** в консоль.

3. Введите **sudo bash INSTALL** и наблюдайте за установкой.

4. Готово! Теперь запускаете **launch.py** в **scripts/** папке. Для запуска введите ***python3 launch.py***.