#!/bin/bash
# Event handler for VPN failure
# Will pause torrents on failure, and resume on OK test

case "$1" in
OK)
        transmission-remote IP:9091 --auth uname:pass -t all --start
        ;;
WARNING)
        ;;
UNKNOWN)
        ;;
CRITICAL)
        case "$2" in
        SOFT)
                case "$3" in
                3)
                        ;;
                        esac
                ;;

        HARD)
                transmission-remote IP:9091 --auth uname:pass -t all --stop
                ;;
        esac
        ;;
esac
exit 0
