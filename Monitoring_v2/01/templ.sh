
#!/bin/bash

# Проверка количества переданных параметров
if [ "$#" -ne 6 ]; then
    echo "Неверное количество параметров. Ожидается 6 параметров."
    exit 1
fi

# Получаем параметры
BASE_DIR="$1"
DEPTH="$2"
FOLDER_CHARS="$3"
FILE_COUNT="$4"
FILE_CHARS="$5"
FILE_SIZE_KB="$6"

# Проверка на корректность параметров
if [[ ! -d "$BASE_DIR" ]]; then
    echo "Указанный путь не существует или не является каталогом."
    exit 1
fi
if [[ ! "$DEPTH" =~ ^[0-9]+$ || "$DEPTH" -lt 1 ]]; then
    echo "Количество вложенных папок должно быть положительным целым числом."
    exit 1
fi
if [[ ${#FOLDER_CHARS} -gt 7 ]]; then
    echo "Список букв английского алфавита для названий папок не должен превышать 7 знаков."
    exit 1
fi
if [[ ! "$FILE_COUNT" =~ ^[0-9]+$ || "$FILE_COUNT" -lt 1 ]]; then
    echo "Количество файлов в каждой папке должно быть положительным целым числом."
    exit 1
fi
if [[ ${#FILE_CHARS} -gt 7 ]]; then
    echo "Список букв английского алфавита для названий файлов не должен превышать 7 знаков."
    exit 1
fi
if [[ ! "$FILE_SIZE_KB" =~ ^[0-9]+$ || "$FILE_SIZE_KB" -gt 100 ]]; then
    echo "Размер файлов должен быть целым числом не более 100 КБ."
    exit 1
fi

# Получение текущей даты в формате DDMMYY
current_date=$(date +%d%m%y)

# Лог-файл
log_file="$BASE_DIR/create_log.txt"

# Функция для создания файлов
create_files() {
        local dir="$1"
    for (( i = 0; i < $FILE_COUNT; i++ )); do
            # Генерируем имя файла из допустимых символов
            file_name=$(cat /dev/urandom | tr -dc "$FILE_CHARS" | fold -w 4 | head -n 1)_$current_date
        file_ext=$(cat /dev/urandom | tr -dc "$FILE_CHARS" | fold -w 3 | head -n 1)
        file_path="$dir/${file_name}.${file_ext}"
        
                # Создаем файл нужного размера
                dd if=/dev/zero of="$file_path" bs=1K count="$FILE_SIZE_KB" &> /dev/null
        
                # Записываем информацию в лог
                echo "Создан файл: $file_path, размер: ${FILE_SIZE_KB}KB, дата: $(date +%Y-%m-%d %H:%M:%S)" >> "$log_file"
            done
        }
        
        # Функция для создания папок
        create_folders() {
                local base="$1"
    local current_depth="$2"
    
        # Проверка свободного места на диске
        local free_space=$(df "$base" | awk 'NR==2 {print $4}')
    if [ "$free_space" -le 1048576 ]; then
            echo "Недостаточно свободного места на диске."
            exit 1
        fi
    
        for (( i = 0; i < "$DEPTH"; i++ )); do
        folder_name=$(cat /dev/urandom | tr -dc "$FOLDER_CHARS" | fold -w 4 | head -n 1)_$current_date
                folder_path="$base/$folder_name"
        
                mkdir "$folder_path"
        echo "Создана папка: $folder_path" >> "$log_file"

        # Рекурсивное создание папок, если нужно
        if [ "$current_depth" -lt "$DEPTH" ]; then
            create_folders "$folder_path" $((current_depth + 1))
        fi

        create_files "$folder_path"
            done
        }
        
        # Запуск создания папок
        create_folders "$BASE_DIR" 1

echo "Создание завершено. Лог записан в $log_file."
