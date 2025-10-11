#!/usr/sbin/bash
# Экспортируем переменные
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export DBUS_SESSION_BUS_ADDRESS=unix:path=$XDG_RUNTIME_DIR/bus

# Создаем директорию если не существует
mkdir -p $XDG_RUNTIME_DIR
chmod 0700 $XDG_RUNTIME_DIR

# Запускаем D-Bus
dbus-daemon --session --address=unix:path=$XDG_RUNTIME_DIR/bus --nofork --print-address &
