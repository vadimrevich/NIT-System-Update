# Создание инсталлятора

## Создание EXE инсталляторов для конкретных платформ

Вначале нужно создать инсталляторы для конкретных платформ. Исходные файлы для платформ находятся в каталоге .\bin\Winxxx

- Установите программу InnoSetup
- Двойным щелчком откройте файл .\bin\Winxxx\Winxxx.iss, где xxx - версия платформы
- Измените в нём опцию OutputDir на любой валидный каталог
- Сгенерируйте файл установщика
- Скопируйте файл установщика в каталог .\NIT.SYSUPDATE
- Повторите указанные пункты для остальных платформ

## Создание MSI инсталлятора

- Установите и настройте программы WIX Toolset и WixEdit
- Скопируйте файл rms.host6.3ru_mod2.msi в .\NIT.SYSUPDATE
- Откройте файл NIT-System-Update.wxs в программе WixEdit
- Сгенерируйте MSI файл
- Закачайте полученный инсталлятор на выделенный сервер
- Можете распространять данное программное обеспечение

## Инструкции к программам

Инструкции по использованию и программированию в программах InnoSetup, Inno Script Studio, WIX Toolset и WixEdit (все на английском языке) смотри в Интернете. Все программы бесплатные, присутствуют в менеджере пакетов Chocolatey.

## Create platform-specific installation EXE

First, create platform-specific installers. The source files for the platforms are placed in the directory.\bin\Winxxx

- Install the InnoSetup program
- Double click open the.\bin\Winxxx\Winxxx.iss file where xxx is the version of the platform
- Change the OutputDir option to any valid directory
- Generate installer file
- Copy the installer file to the directory.\NIT.SYSUPDATE
- Repeat these steps for other platforms

## Creation of MSI of an installer

- Install and configure WIX Toolset and WixEdit
- Copy the rms.host6.3ru_mod2.msi file to.\NIT.SYSUPDATE
- Open the NIT-System-Update.wxs file in WixEdit
- Generate MSI file
- Upload the made installer on a dedicated server
- You can distribute this software

## Program Instructions

For instructions on how to use and programing InnoSetup, Inno Script Studio, WIX Toolset, and WixEdit, see the Internet. All programs are free, present in the Chocolatey Package Manager.
