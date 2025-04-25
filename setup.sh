#!/bin/bash

detect_package_manager() {
    declare -A osInfo
    osInfo["/etc/redhat-release"]="yum"
    osInfo["/etc/arch-release"]="pacman"
    osInfo["/etc/gentoo-release"]="emerge"
    osInfo["/etc/SuSE-release"]="zypp"
    osInfo["/etc/debian_version"]="apt-get"
    osInfo["/etc/alpine-release"]="apk"

    # Recorremos los archivos para detectar el gestor de paquetes
    for f in "${!osInfo[@]}"; do
        if [[ -f $f ]]; then
            echo "${osInfo[$f]}"
            return 0
        fi
    done

    echo "Distribucion no soportada para la instalacion de paquetes."
    exit 1
}

check_python() {
    if command -v python3 &>/dev/null; then
        echo "Python 3 ya esta instalado."
    else
        echo "Python 3 no esta instalado. Instalando . . ."
        install_python
    fi
}

install_python() {
    local package_manager
    package_manager=$(detect_package_manager)

    case $package_manager in
        "yum")
            sudo yum install -y python3
            ;;
        "pacman")
            sudo pacman -S python3 --noconfirm
            ;;
        "emerge")
            sudo emerge --ask dev-lang/python
            ;;
        "zypp")
            sudo zypper install -y python3
            ;;
        "apt-get")
            sudo apt-get update
            sudo apt-get install -y python3
            ;;
        "apk")
            sudo apk add python3
            ;;
        *)
            echo "Error: No se pudo determinar el gestor de paquetes."
            exit 1
            ;;
    esac
}

check_curl_and_wget() {
    if command -v curl &>/dev/null; then
        curl -LsSf https://astral.sh/uv/install.sh | sh
    elif command -v wget &>/dev/null; then
        wget -qO- https://astral.sh/uv/install.sh | sh
    else
        echo -e "\nInstalando curl...\n"
        install_curl
    fi
}

install_curl() {
    local package_manager
    package_manager=$(detect_package_manager)

    case $package_manager in
        "yum")
            sudo yum install -y curl
            ;;
        "pacman")
            sudo pacman -S curl --noconfirm
            ;;
        "emerge")
            sudo emerge --ask net-misc/curl
            ;;
        "zypp")
            sudo zypper install -y curl
            ;;
        "apt-get")
            sudo apt-get update
            sudo apt-get install -y curl
            ;;
        "apk")
            sudo apk add curl
            ;;
        *)
            echo "Error: No se pudo determinar el gestor de paquetes."
            exit 1
            ;;
    esac
}

# Llamadas a las funciones
check_python
check_curl_and_wget

check_shell() {
    if [[ "$SHELL" == *"/bash" || "$SHELL" == *"/zsh" || "$SHELL" == *"/sh" ]]; then
        source $HOME/.local/bin/env
    else
        source $HOME/.local/bin/env.fish
    fi
}
check_shell

# Clonar el repositorio
git_url="https://github.com/xkaedez/simulacion.git"
target_homedir="/home/$USER/proyecto_simulacion"
git clone "$git_url" "$target_homedir"

# Crear entorno virtual
uv venv modulos
source modulos/bin/activate

# Instalar dependencias de Python
uv pip install flask oct2py

echo -e "Setup completo. \n
ejecuta cd proyecto_simulacion/ para empezar a trabajar"
