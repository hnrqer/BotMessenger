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

echo "\n\n\n\n\n\n\n\n\n\n">> $FILE1

while true
do
	
	MSG=$($DIALOG --title "BotMessenger" --inputbox "`$GETTEXT \"Messages sent:\";echo "\n";cat $FILE1; echo "\n"; $GETTEXT \"Send message to bot:\"`" 8 35 3>&2 2>&1 1>&3) || end
	echo $MSG>> $FILE1
	#echo "CONTENT OF FILES"
	numberoflines=$(sed -n '$=' $FILE1)
	#echo $numberoflines
	sed -i '1d' $FILE1
	
	./bashbot.sh broadcast `echo $MSG`
done
