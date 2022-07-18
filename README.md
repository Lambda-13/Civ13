# Civilization 13

[![Build Status](https://travis-ci.com/Civ13/Civ13.svg?branch=master)](https://travis-ci.com/Civ13/Civ13)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/civ13/civ13.svg?style=flat)
![GitHub repo size](https://img.shields.io/github/repo-size/civ13/civ13.svg?style=flat)

## WHAT IS THIS?
## ЧТО ЭТО ТАКОЕ?

Civ13 (formerly 1713) is a game based on Space Station 13 code, which features several epochs of human history. (hence the name). It features both RP and Combat maps and gamemodes.

Civ13 (ранее 1713) - игра, основанная на коде Space Station 13, в котором представлены несколько эпох в истории человечества. (отсюда и название). В нем есть как RP, так и боевые карты и игровые режимы.

<kbd>
 <img src="https://i.imgur.com/napac0L.png">
</kbd>


## Civ13 Discord
EN (Original) [![discord](https://discordapp.com/api/guilds/468979034571931648/widget.png)](https://discord.gg/hBEtg4x)

RU (Русский для русских) [![discord](https://discord.com/api/guilds/896037329888764004/widget.png)](https://discord.gg/HQjz7YKRAJ)


## Official Website
https://civ13.com/
(Для русских скоро будет вики в гитхабе)

## Trello
https://trello.com/b/DW0RQAEX
(Для русских опять же возможно всё будет в гитхабе)

## (EN)
## Playing the game
You will need a windows machine or a virtual machine running it from another OS.

1. Download the latest BYOND distribution from http://www.byond.com/download/

2. Register a BYOND account at https://secure.byond.com/Join

3. Launch BYOND from **BYOND/bin/Byond.exe** and login.

4. Navigate to **Space Station 13** and search for the **Civilization 13** server.

5. You will start playing in seconds!


## Setting up a Server
1. You will need a linux machine for the automated install, preferably Ubuntu. Open the command line.
 
2. Download the INSTALL file. You can use ***wget https://raw.githubusercontent.com/Civ13/Civ13/master/INSTALL*** for it. If you don't have wget installed, use ***sudo apt install wget*** first.

3. Use **sudo bash INSTALL** and it should install everything you need.

4. You're all set! Run the **launch.py** file inside the **scripts/** folder. Use ***python3 launch.py***.


## (RU)
## Как начать играть
Вам понадобится машина с Windows или виртуальная машина, на которой она будет запущена ОС.

1. Скачиваете клиент по данной ссылке http://www.byond.com/download/

2. Регистрируетесь тут https://secure.byond.com/Join

3. Запускаете BYOND клиент **BYOND/bin/Byond.exe** и входите.

4. Нажимаете в списке слева **Space Station 13** и ищете в списке справа **Civilization 13** сервер.

5. Играете!


## Хочу настроить свой сервер
1. Для автоматической установки вам понадобится Linux-машина, рекомендую Ubuntu. Откройте командную строку.
 
2. Скачайте установкщик. Используйте комманду ***wget https://raw.githubusercontent.com/Civ13/Civ13/master/INSTALL*** для этого. Если у вас не установлен wget, для начала введите ***sudo apt install wget*** в консоль.

3. Введите **sudo bash INSTALL** и наблюдайте за установкой.

4. Готово! Теперь запускаете **launch.py** в **scripts/** папке. Для запуска введите ***python3 launch.py***.

### ВЕБХУКИ

### ЕЩЁ НЕ В ИГРЕ
Если хотите пересылать происходящее в игре в Дискорд то можете воспользоваться вебхуками, для этого надо переименовать `webhooks_example.json` в `webhooks.json` в папке `config/` и создать [ссылку на вебхук Дискорда](https://support.discordapp.com/hc/en-us/articles/228383668-Intro-to-Webhooks). На момент написания есть индефикаторы:
- webhook_roundend: Раунд окончен. Будет включать название режима и краткое описание выживших и призраков.
- webhook_roundstart: Мастер-контроллер завершил инициализацию, и раунд скоро начнется.
- webhook_ooc: Передаёт ООС сообщения.
- webhook_ahelp: Передаёт сообщения из админ-помощи
- webhook_custom_event: Сообщает о начале события

Каждый индефикатор может дополнительно включать массив ролей, которые следует указывать при вызове вебхука. Роли должны быть предоставлены с использованием идентификатора роли (`<@&555231866735689749>`), который можно получить, написав `\@любаяроль` в чат, чтобы корректно работал пинг.

Для вебхуков дополнительно требуется библиотека HTTP POST, называемая [byhttp](https://github.com/Lohikar/byhttp). Скомпилированная библиотека, `byhttp.dll` для Виндовсюзеров `libbyhttp.so` для Линуксойдов, притом одна из библиотек для вашей системы должна находиться в директории по умолчанию для работы вебхуков. Расположение DLL можно настроить, указав `WINDOWS_HTTP_POST_DLL_LOCATION` `UNIX_HTTP_POST_DLL_LOCATION`, иди `HTTP_POST_DLL_LOCATION` как макросы препроцессора, содержащие нужный путь.