#!/bin/bash

PHP_BINARY="php"

while getopts "p:" OPTION 2> /dev/null; do
	case ${OPTION} in
		p)
			PHP_BINARY="$OPTARG"
			;;
	esac
done

cp -r tests/plugins plugins
"$PHP_BINARY" ./plugins/PocketMine-DevTools/src/DevTools/ConsoleScript.php --make ./plugins/PocketMine-DevTools --relative ./plugins/PocketMine-DevTools --out ./plugins/DevTools.phar
rm -rf ./plugins/PocketMine-DevTools

echo -e "version\nmakeserver\nstop\n" | "$PHP_BINARY" src/pocketmine/PocketMine.php --no-wizard --disable-ansi --disable-readline --debug.level=2
if ls plugins/DevTools/Rocky_1.0dev.phar >/dev/null 2>&1; then
    echo Server phar created successfully.
else
    echo No phar created!
    exit 1
fi
