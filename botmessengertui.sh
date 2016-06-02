#!/bin/sh

FILE1=/tmp/botmessenger-$$

./bashbot.sh start

which gdialog 2> /dev/null && DIALOG=gdialog || DIALOG=dialog

GETTEXT="gettext -d botmessenger"

end () {
	#echo "REMOVING FILES"
	rm -f $FILE1
	exit
}

> $FILE1

while true
do
			
	MSG=$(dialog --title "BotMessenger" --inputbox "`$GETTEXT \"Messages sent:\";echo "\n";cat $FILE1; echo "\n"; $GETTEXT \"Send message to bot:\"`" 0 0 3>&2 2>&1 1>&3) || end
	echo $MSG>> $FILE1
	#echo "CONTENT OF FILES"
	numberoflines=$(sed -n '$=' $FILE1)
	#echo $numberoflines
	if [ $numberoflines = 10 ]
	then
		sed -i '1d' $FILE1
	fi
	
	./bashbot.sh broadcast `echo $MSG`
done
