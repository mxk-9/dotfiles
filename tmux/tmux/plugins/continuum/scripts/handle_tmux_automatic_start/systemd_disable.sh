#!/nix/store/516kai7nl5dxr792c0nzq0jp8m4zvxpi-bash-5.2p32/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/../variables.sh"

main() {
	systemctl --user disable ${systemd_service_name}
}
main
