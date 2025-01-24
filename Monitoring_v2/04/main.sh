
#!/bin/bash

# случайный IP-адрес
generate_ip() {
    echo "$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
}

# случайный HTTP-код ответа
generate_status_code() {
    local codes=(200 201 400 401 403 404 500 501 502 503)
    echo "${codes[RANDOM % ${#codes[@]}]}"
}

# случайный HTTP-метод
generate_method() {
    local methods=("GET" "POST" "PUT" "PATCH" "DELETE")
    echo "${methods[RANDOM % ${#methods[@]}]}"
}

# генерация файла лога
generate_log_file() {
    local file_name="$1"
        local num_entries="$2"
    
    for ((i = 0; i < num_entries; i++)); do
        # генерация даты для лога
        LOG_DATE=$(date +"[%d/%b/%Y]")
        
                # генерация URL-адреса
                url="/$(tr -dc 'a-zA-Z0-9/' < /dev/urandom | head -c $((RANDOM % 20 + 5)))"
                
                # генерация агента
                agents=("Mozilla/5.0" "Chrome/89.0" "Opera/74.0" "Safari/14.0" "IE/11.0" "Edge/89.0" "Crawler Bot" "Library Tool")
                agent="${agents[RANDOM % ${#agents[@]}]}"
                
                # генерация IP, метода и кода ответа
                ip=$(generate_ip)
        method=$(generate_method)
                status_code=$(generate_status_code)
        met_url="$method $url"
        # форматирование строки в стиле combined

        log_entry="$ip - $LOG_DATE "$met_url" $status_code - \"$agent\""
        
        # запись в файл
        echo "$log_entry" >> "$file_name"
    done
}

# сам скрипт
for i in {1..5}; do
    log_file="nginx_log_$i.log"
        num_entries=$((RANDOM % 901 + 100)) # рандомное кол-во записей от 100 до 1000
    generate_log_file "$log_file" "$num_entries"
done

echo "Логи успешно сгенерированы."
