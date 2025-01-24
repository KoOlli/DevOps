#!/bin/bash
if [ $# == 4 ]; then
if [ $1 = "1" ]; then
	var1='7'
elif [ $1 = "2" ]; then
	var1='1'
elif [ $1 = "3" ]; then
	var1='2'
elif [ $1 = "4" ]; then
	var1='4'
elif [ $1 = "5" ]; then
	var1='5'
elif [ $1 = "6" ]; then
	var1='0'
else
echo "П1: Неверно заданы параметры"
fi
if [ $2 = "1" ]; then
	var2='7'
elif [ $2 = "2" ]; then
	var2='1'
elif [ $2 = "3" ]; then
	var2='2'
elif [ $2 = "4" ]; then
	var2='4'
elif [ $2 = "5" ]; then
	var2='5'
elif [ $2 = "6" ]; then
	var2='0'
else
echo "П2: Неверно заданы параметры"
fi
if [ $3 = "1" ]; then
	var3='7'
elif [ $3 = "2" ]; then
	var3='1'
elif [ $3 = "3" ]; then
	var3='2'
elif [ $3 = "4" ]; then
	var3='4'
elif [ $3 = "5" ]; then
	var3='5'
elif [ $3 = "6" ]; then
	var3='0'
else
echo "П3: Неверно заданы параметры"
fi
if [ $4 = "1" ]; then
	var4='7'
elif [ $4 = "2" ]; then
	var4='1'
elif [ $4 = "3" ]; then
	var4='2'
elif [ $4 = "4" ]; then
	var4='4'
elif [ $4 = "5" ]; then
	var4='5'
elif [ $4 = "6" ]; then
	var4='0'
else
echo "П4: Неверно заданы параметры"
fi
if [ $1 = $2 ] && [ $3 = $4 ]; then
echo "Значения идентичны для обоих столбцов. Пожалуйста, выберете другие значения от 1 до 6"
elif [ $1 = $2 ]; then
echo "Первое и второе значения идентичны. Пожалуйста, выберете другие значения от 1 до 6"
elif [ $3 = $4 ]; then
echo "Третье и четвертое значения идентичны. Пожалуйста, выберете другие значения от 1 до 6"
else
bash status | awk '{print echo "\033[4'$var1';3'$var2'm" $1, "\033[0m" $2, $1="", $2="", "\033[4'$var3';3'$var4'm" $0, "\033[0m"}'
echo -e "\e[0m"
fi
else
echo "Узаканы не все параметры. Пожалуйста, укажите 4 параметра со значениями от 1 до 6"
fi
