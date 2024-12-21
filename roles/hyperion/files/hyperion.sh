#!/bin/bash

watchdog() {
    local pid
    local prev
    local usec
    local user
    prev=$(date '+%F %T')
    user=$(whoami)
    pid=$(systemctl show --property MainPID --value "hyperion@${user}.service")
    sec=$(systemctl show --property WatchdogUSec --value "hyperion@${user}.service" | sed 's/s$//') # assumes format: 5s
    while true; do
        if ! journalctl --since="$prev" -u hyperion@${user}.service -o cat | grep "SIGABRT"; then
            /bin/systemd-notify –pid=$pid WATCHDOG=1;
        else
            # a SIGABRT occurred so immediately trigger a watchdog event to restart the main PID
            /bin/systemd-notify –pid=$pid WATCHDOG=trigger;
        fi
        prev=$(date '+%F %T')
        sleep $(($sec / 2))
    done
}

watchdog &
