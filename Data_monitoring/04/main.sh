#!/bin/bash
. ./conf
reg='[1-6]'
if ! [[ $column1_background =~ $reg ]] || ! [[ $column1_font_color =~ $reg ]] || ! [[ $column2_background =~ $reg ]] || ! [[ $column2_font_color =~ $reg ]]; then
    if [ "x$column1_background" = "x" ] || [ "x$column1_font_color" = "x" ] || [ "x$column2_background" = "x" ] || [ "x$column2_font_color" = "x" ]; then
        if [ "x$column1_background" = "x" ]; then
            number1='default'
            var1='6'
            color1='azure'
        else
            if [ $column1_background = "1" ]; then
                number1='1' 
                var1='7'
                color1='white'
            elif [ $column1_background = "2" ]; then
                number1='2'
                var1='1'
                color1='red'
            elif [ $column1_background = "3" ]; then
                number1='3'
                var1='2'
                color1='green'
            elif [ $column1_background = "4" ]; then
                number1='4'
                var1='4'
                color1='blue'
            elif [ $column1_background = "5" ]; then
                number1='5'
                var1='5'
                color1='purple'
            elif [ $column1_background = "6" ]; then
                number1='6'
                var1='0'
                color1='black'
            fi
        fi
        if [ "x$column1_font_color" = "x" ]; then
            number2='default'
            var2='0'
            color2='black'
        else
            if [ $column1_font_color = "1" ]; then
                number2='1'
                var2='7'
                color2='white'
            elif [ $column1_font_color = "2" ]; then
                number2='2'
                var2='1'
                color2='red'
            elif [ $column1_font_color = "3" ]; then
                number2='3'
                var2='2'
                color2='green'
            elif [ $column1_font_color = "4" ]; then
                number2='4'
                var2='4'
                color2='blue'
            elif [ $column1_font_color = "5" ]; then
                number2='5'
                var2='5'
                color2='purple'
            elif [ $column1_font_color = "6" ]; then
                number2='6'
                var2='0'
                color2='black'
            fi
        fi
        if [ "x$column2_background" = "x" ]; then
            number3='default'
            var3='3'
            color3='yellow'
        else
            if [ $column2_background = "1" ]; then
                number3='1'
                var3='7'
                color3='white'
            elif [ $column2_background = "2" ]; then
                number3='2'
                var3='1'
                color3='red'
            elif [ $column2_background = "3" ]; then
                number3='3'
                var3='2'
                color3='green'
            elif [ $column2_background = "4" ]; then
                number3='4'
                var3='4'
                color3='blue'
            elif [ $column2_background = "5" ]; then
                number3='5'
                var3='5'
                color3='purple'
            elif [ $column2_background = "6" ]; then
                number3='6'
                var3='0'
                color3='black'
            fi
        fi
        if [ "x$column2_font_color" = "x" ]; then
            number4='default'
            var4='4'
            color4='blue'
        else
            if [ $column2_font_color = "1" ]; then
                number4='1'
                var4='7'
                color4='white'
            elif [ $column2_font_color = "2" ]; then
                number4='2'
                var4='1'
                color4='red'
            elif [ $column2_font_color = "3" ]; then
                number4='3'
                var4='2'
                color4='green'
            elif [ $column2_font_color = "4" ]; then
                number4='4'
                var4='4'
                color4='blue'
            elif [ $column2_font_color = "5" ]; then
                number4='5'
                var4='5'
                color4='purple'
            elif [ $column2_font_color = "6" ]; then
                number4='6'
                var4='0'
                color4='black'
            fi
        fi
    else
        echo "Неверно заданы параметры. Пожалуйста, выберете такие значения (от 1 до 6), чтобы они парно не повторялись"
    fi
else
    . ./color_all
fi
if [ $var1 = $var2 ] && [ $var3 = $var4 ]; then
    echo "Значения парно идентичны в двух столбцах. Пожалуйста, выберете такие значения (от 1 до 6), чтобы они парно не повторялись"
elif [ $var1 = $var2 ]; then
    echo "Первое и второе значения идентичны. Пожалуйста, выберете такие значения (от 1 до 6), чтобы они парно не повторялись"
elif [ $var3 = $var4 ]; then
    echo "Третье и четвертое значения идентичны. Пожалуйста, выберете такие значения (от 1 до 6), чтобы они парно не повторялись"
else
    bash status | awk '{print echo "\033[4'$var1';3'$var2'm" $1, "\033[0m" $2, $1="", $2="", "\033[4'$var3';3'$var4'm" $0, "\033[0m"}'
    echo -e "\e[0m"
    echo "Column 1 background = $number1 ($color1)
Column 1 font color = $number2 ($color2)
Column 2 background = $number3 ($color3)
Column 2 font color = $number4 ($color4)"
fi
