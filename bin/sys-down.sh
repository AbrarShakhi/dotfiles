#!/bin/bash

show_help() {
    echo "Usage: $0 [help|shutdown|restart|suspend]"
    echo "  help     Show this help message."
    echo "  shutdown Shutdown the system."
    echo "  restart  Restart the system."
    echo "  suspend  Suspend the system."
    echo "If no argument is provided, the script waits for a keypress:"
    echo "  u: Shutdown"
    echo "  r: Restart"
    echo "  s: Suspend"
    echo "  Any other key: Exit"
}

shutdown_cmd() {
    sudo systemctl poweroff
}

restart_cmd() {
    sudo systemctl reboot
}

suspend_cmd() {
    sudo systemctl suspend
}

case "$1" in
    help)
        show_help
        exit 0
        ;;
    shutdown)
        shutdown_cmd
        exit 0
        ;;
    restart)
        restart_cmd
        exit 0
        ;;
    suspend)
        suspend_cmd
        exit 0
        ;;
    "")
        echo "Press u (shutdown), r (restart), s (suspend), or any other key to exit."
        read -n 1 -r key
        echo
        case "$key" in
            u)
                shutdown_cmd
                ;;
            r)
                restart_cmd
                ;;
            s)
                suspend_cmd
                ;;
            *)
                echo "Exiting."
                ;;
        esac
        ;;
    *)
        echo "Unknown argument: $1"
        show_help
        exit 1
        ;;
esac
