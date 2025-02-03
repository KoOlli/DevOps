#!/bin/bash

# случайный IP-адрес
generate_ip() {
    echo "$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
}


# Массив с кодами ответов
# -----------------------------------------------------------------------------------------------------------------
# 200 OK: Запрос выполнен успешно.
# 201 Created: Запрос выполнен, и был создан новый ресурс.
# 400 Bad Request: Запрос не может быть обработан из-за синтаксической ошибки.
# 401 Unauthorized: Запрос требует аутентификации пользователя.
# 403 Forbidden: Сервер понял запрос, но отказывается его выполнять.
# 404 Not Found: Запрашиваемый ресурс не найден на сервере.
# 500 Internal Server Error: Внутренняя ошибка сервера.
# 501 Not Implemented: Сервер не поддерживает функциональность, необходимую для выполнения запроса.
# 502 Bad Gateway: Сервер, действующий как шлюз или прокси, получил недействительный ответ от upstream-сервера.
# 503 Service Unavailable: Сервер временно недоступен (например, из-за перегрузки или технического обслуживания).
# -----------------------------------------------------------------------------------------------------------------
response_codes=(200 201 400 401 403 404 500 501 502 503)

# Массив с методами
methods=(GET POST PUT PATCH DELETE)

# Массив с URL
urls=(
    "/index.html"
    "/about.html"
    "/contact.html"
    "/products.html"
    "/services.html"
    "/login"
    "/logout"
    "/api/v1/resource"
)

# Массив с реферерами
referers=(
    "https://www.f5.com/about.html"
    "https://www.f5.com/start.html"
    "https://www.f5.com/contact.html"
    "https://www.f5.com/products.html"
    "https://www.f5.com/services.html"
)

# Массив с агентами
user_agents=(
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36"
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Version/14.0.1 Safari/537.36"
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Firefox/86.0"
    "Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; AS; rv:11.0) like Gecko"
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36"
)

# Генерация логов
for i in {1..5}; do
    log_file="nginx_log_$i.log"

    # Генерация случайного числа записей
    num_records=$((RANDOM % 901 + 100))

    # Генерация случайной даты для лога (в пределах последних 30 дней)
    random_days=$((RANDOM % 30))
    log_date=$(date -d "$random_days days ago" +"%d/%b/%Y")

    # Начальное время
    current_time_seconds=0

    # Генерация временных меток по возрастанию
    for ((j = 0; j < num_records; j++)); do
        # Генерация случайных данных
        ip=$(generate_ip)
        response_code=${response_codes[$RANDOM % ${#response_codes[@]}]}
        method=${methods[$RANDOM % ${#methods[@]}]}
        url=${urls[$RANDOM % ${#urls[@]}]}
        referer=${referers[$RANDOM % ${#referers[@]}]}
        user_agent=${user_agents[$RANDOM % ${#user_agents[@]}]}

        # Генерация случайного количества секунд для следующей записи
        random_seconds=$((RANDOM % 600))
        current_time_seconds=$((current_time_seconds + random_seconds))

        # Формирование временного штампа
        formatted_time=$(date -d "1970-01-01 +$current_time_seconds seconds" +"%H:%M:%S")
        timestamp="[$log_date:$formatted_time +0000]"

        # Запись в файл
        echo "$ip - - $timestamp \"$method $url HTTP/1.1\" $response_code $((RANDOM % 5000)) \"$referer\" \"$user_agent\"" >> "$log_file"
    done
done


echo "Логи успешно сгенерированы!"
