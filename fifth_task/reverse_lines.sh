#!/bin/bash

FILE="test.txt"

cat <<EOL > $FILE
**Обработка текстового файла:**
Создайте текстовый файл с несколькими строками текста. Напишите скрипт, который будет читать файл и выдавать каждую строку в обратном порядке.
EOL

while IFS= read -r line
do
  echo "$line" | rev
done < "$FILE"
