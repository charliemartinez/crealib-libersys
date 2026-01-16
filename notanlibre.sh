#!/bin/bash

# ======================================================================
# Archivo:       libre
# Ruta:          /usr/local/bin/
# Autor:         Charlie Martínez® <cmartinez@quirinux.org>
# Licencia:      https://www.gnu.org/licenses/gpl-2.0.txt
# Propósito:     Seleccionar componentes privativos a desinstalar
# Distribución:  Quirinux 2.x
# ======================================================================

#
# Copyright (c) 2019-2025 Charlie Martínez, derechos reservados.
# Licencia: https://www.gnu.org/licenses/gpl-2.0.txt
# Usos autorizados y no autorizados de la marca Quirinux:
# Ver https://www.quirinux.org/aviso-legal
#

# ----------------------------------------------------------------------
# Rutas
# ----------------------------------------------------------------------

FOLDER_NONFREE="/opt/libersys"
FILE_LIST="$FOLDER_NONFREE/list"
FOLDER_DEBS="$FOLDER_NONFREE/debs"
FOLDER_UNINSTALLED="$FOLDER_NONFREE/desinstalados"
SELECCION=""

# ----------------------------------------------------------------------
# Idiomas
# ----------------------------------------------------------------------

_set_lang() {
case "${LANG%%_*}" in
es)
TXT_ROOT="Este script debe ejecutarse con permisos de root."
TXT_USE_SUDO='Puedes intentarlo con "sudo", "sudo su" o "su root".'
TXT_NEED_DIALOG="El programa 'dialog' es necesario para ejecutar este script."
TXT_INSTALL_DIALOG="¿Deseas instalarlo?"
TXT_NEED_VRMS="El programa 'vrms' es necesario para ejecutar este script."
TXT_TITLE="Crealib Libersys v1.0 - Comando \"libre\""
TXT_INTRO="Este programa sirve para detectar y desinstalar componentes privativos.\nSiempre podrás volver a instalarlos con el comando \"notanlibre\"."
TXT_NO_SELECT="No se seleccionaron componentes."
TXT_ALL="DESINSTALAR TODOS"
TXT_SELECT="Selecciona componentes a desinstalar (BARRA ESPACIADORA)"
TXT_CONFIRM_REMOVE="Se van a desinstalar los siguientes elementos:"
TXT_WIFI_WARN="Algunos componentes como la conexión WiFi podrían dejar de funcionar.\n¿Continuar de todas formas?"
TXT_SUCCESS="La desinstalación fue exitosa. ¡Ahora tu sistema es más libre que antes!"
TXT_GOODBYE="Gracias por utilizar Crealib Libersys - Comando \"notanlibre\""
;;
en)
TXT_ROOT="This script must be run as root."
TXT_USE_SUDO='You can try using "sudo", "sudo su" or "su root".'
TXT_NEED_DIALOG="The 'dialog' program is required to run this script."
TXT_INSTALL_DIALOG="Do you want to install it?"
TXT_NEED_VRMS="The 'vrms' program is required to run this script."
TXT_TITLE="Crealib Libersys v1.0 - \"libre\" command"
TXT_INTRO="This program detects and removes proprietary components.\nYou can reinstall them later using the \"notanlibre\" command."
TXT_NO_SELECT="No components were selected."
TXT_ALL="REMOVE ALL"
TXT_SELECT="Select components to remove (SPACEBAR)"
TXT_CONFIRM_REMOVE="The following items will be removed:"
TXT_WIFI_WARN="Some components such as WiFi may stop working.\nContinue anyway?"
TXT_SUCCESS="Uninstallation completed successfully. Your system is now freer than before!"
TXT_GOODBYE="Thank you for using Crealib Libersys"
;;
de)
TXT_ROOT="Dieses Skript muss als Root ausgeführt werden."
TXT_USE_SUDO="Versuchen Sie es mit sudo oder su."
TXT_NEED_DIALOG="Das Programm 'dialog' wird benötigt."
TXT_INSTALL_DIALOG="Möchten Sie es installieren?"
TXT_NEED_VRMS="Das Programm 'vrms' wird benötigt."
TXT_TITLE="Crealib Libersys v1.0 – Befehl \"libre\""
TXT_INTRO="Dieses Programm erkennt und entfernt proprietäre Komponenten."
TXT_NO_SELECT="Keine Komponenten ausgewählt."
TXT_ALL="ALLES ENTFERNEN"
TXT_SELECT="Zu entfernende Komponenten auswählen"
TXT_CONFIRM_REMOVE="Folgende Elemente werden entfernt:"
TXT_WIFI_WARN="Einige Komponenten wie WLAN könnten nicht mehr funktionieren.\nFortfahren?"
TXT_SUCCESS="Deinstallation erfolgreich. Ihr System ist jetzt freier."
TXT_GOODBYE="Danke für die Nutzung von Crealib Libersys"
;;
it)
TXT_ROOT="Questo script deve essere eseguito come root."
TXT_USE_SUDO="Prova con sudo o su."
TXT_NEED_DIALOG="Il programma 'dialog' è necessario."
TXT_INSTALL_DIALOG="Vuoi installarlo?"
TXT_NEED_VRMS="Il programma 'vrms' è necessario."
TXT_TITLE="Crealib Libersys v1.0 - Comando \"libre\""
TXT_INTRO="Questo programma rileva e rimuove componenti proprietari."
TXT_NO_SELECT="Nessun componente selezionato."
TXT_ALL="DISINSTALLA TUTTO"
TXT_SELECT="Seleziona i componenti da rimuovere"
TXT_CONFIRM_REMOVE="I seguenti elementi verranno rimossi:"
TXT_WIFI_WARN="Alcuni componenti come il WiFi potrebbero smettere di funzionare.\nContinuare?"
TXT_SUCCESS="Disinstallazione completata con successo."
TXT_GOODBYE="Grazie per aver usato Crealib Libersys"
;;
fr)
TXT_ROOT="Ce script doit être exécuté en tant que root."
TXT_USE_SUDO="Essayez avec sudo ou su."
TXT_NEED_DIALOG="Le programme 'dialog' est requis."
TXT_INSTALL_DIALOG="Voulez-vous l’installer ?"
TXT_NEED_VRMS="Le programme 'vrms' est requis."
TXT_TITLE="Crealib Libersys v1.0 - Commande \"libre\""
TXT_INTRO="Ce programme détecte et supprime les composants propriétaires."
TXT_NO_SELECT="Aucun composant sélectionné."
TXT_ALL="TOUT DÉSINSTALLER"
TXT_SELECT="Sélectionnez les composants à supprimer"
TXT_CONFIRM_REMOVE="Les éléments suivants seront supprimés :"
TXT_WIFI_WARN="Certains composants comme le WiFi peuvent cesser de fonctionner.\nContinuer ?"
TXT_SUCCESS="Désinstallation réussie."
TXT_GOODBYE="Merci d’utiliser Crealib Libersys"
;;
ru)
TXT_ROOT="Этот скрипт должен быть запущен от имени root."
TXT_USE_SUDO="Используйте sudo или su."
TXT_NEED_DIALOG="Требуется программа 'dialog'."
TXT_INSTALL_DIALOG="Установить?"
TXT_NEED_VRMS="Требуется программа 'vrms'."
TXT_TITLE="Crealib Libersys v1.0 - Команда \"libre\""
TXT_INTRO="Эта программа удаляет проприетарные компоненты."
TXT_NO_SELECT="Компоненты не выбраны."
TXT_ALL="УДАЛИТЬ ВСЕ"
TXT_SELECT="Выберите компоненты для удаления"
TXT_CONFIRM_REMOVE="Будут удалены следующие элементы:"
TXT_WIFI_WARN="Некоторые компоненты могут перестать работать.\nПродолжить?"
TXT_SUCCESS="Удаление завершено успешно."
TXT_GOODBYE="Спасибо за использование Crealib Libersys"
;;
hu)
TXT_ROOT="Ezt a szkriptet rootként kell futtatni."
TXT_USE_SUDO="Használja a sudo vagy su parancsot."
TXT_NEED_DIALOG="A 'dialog' program szükséges."
TXT_INSTALL_DIALOG="Telepíti?"
TXT_NEED_VRMS="A 'vrms' program szükséges."
TXT_TITLE="Crealib Libersys v1.0 - \"libre\" parancs"
TXT_INTRO="Ez a program eltávolítja a zárt összetevőket."
TXT_NO_SELECT="Nincs kiválasztva elem."
TXT_ALL="MIND ELTÁVOLÍT"
TXT_SELECT="Eltávolítandó elemek kiválasztása"
TXT_CONFIRM_REMOVE="A következő elemek eltávolításra kerülnek:"
TXT_WIFI_WARN="Egyes komponensek nem működhetnek tovább.\nFolytatja?"
TXT_SUCCESS="Eltávolítás sikeres."
TXT_GOODBYE="Köszönjük, hogy a Crealib Libersys-t használta"
;;
gl)
TXT_ROOT="Este script debe executarse como root."
TXT_USE_SUDO="Probe con sudo ou su."
TXT_NEED_DIALOG="O programa 'dialog' é necesario."
TXT_INSTALL_DIALOG="Desexa instalalo?"
TXT_NEED_VRMS="O programa 'vrms' é necesario."
TXT_TITLE="Crealib Libersys v1.0 - Comando \"libre\""
TXT_INTRO="Este programa detecta e elimina compoñentes privativos."
TXT_NO_SELECT="Non se seleccionaron compoñentes."
TXT_ALL="DESINSTALAR TODO"
TXT_SELECT="Seleccione compoñentes a eliminar"
TXT_CONFIRM_REMOVE="Eliminaranse os seguintes elementos:"
TXT_WIFI_WARN="Algúns compoñentes poden deixar de funcionar.\nContinuar?"
TXT_SUCCESS="Desinstalación completada."
TXT_GOODBYE="Grazas por usar Crealib Libersys"
;;
pt)
TXT_ROOT="Este script deve ser executado como root."
TXT_USE_SUDO="Use sudo ou su."
TXT_NEED_DIALOG="O programa 'dialog' é necessário."
TXT_INSTALL_DIALOG="Deseja instalá-lo?"
TXT_NEED_VRMS="O programa 'vrms' é necessário."
TXT_TITLE="Crealib Libersys v1.0 - Comando \"libre\""
TXT_INTRO="Este programa detecta e remove componentes proprietários."
TXT_NO_SELECT="Nenhum componente selecionado."
TXT_ALL="DESINSTALAR TUDO"
TXT_SELECT="Selecione componentes para remover"
TXT_CONFIRM_REMOVE="Os seguintes elementos serão removidos:"
TXT_WIFI_WARN="Alguns componentes podem parar de funcionar.\nContinuar?"
TXT_SUCCESS="Desinstalação concluída com sucesso."
TXT_GOODBYE="Obrigado por usar Crealib Libersys"
;;
*) _set_lang en ;;
esac
}

# ----------------------------------------------------------------------
# Funciones
# ----------------------------------------------------------------------

_despedida() {
    clear
    echo "$TXT_GOODBYE"
    echo "-------------------------------------------------------"
    echo "Licencia GPLv2 | Autor: Charlie Martínez"
    echo "Contacto: cmartinez@quirinux.org"
    echo ""
    exit 1
}

_menu_lista() {
    while :; do
        local opciones=("$TXT_ALL" "" off)
        for comp in "${componentes[@]}"; do
            opciones+=("$comp" "" off)
        done

        SELECCION=$(dialog \
            --backtitle "$TXT_TITLE" \
            --separate-output --checklist "$TXT_SELECT" 20 60 10 "${opciones[@]}" \
            2>&1 >/dev/tty)

        [ $? -eq 1 ] && return 1

        [ -z "$SELECCION" ] && dialog --msgbox "$TXT_NO_SELECT" 10 40 && continue

        [[ "$SELECCION" == *"$TXT_ALL"* ]] && SELECCION="${componentes[*]}"

        dialog --yesno "$TXT_CONFIRM_REMOVE\n\n$SELECCION" 20 60 && return 0
    done
}

# ----------------------------------------------------------------------
# Inicio
# ----------------------------------------------------------------------

_set_lang

[ "$EUID" -ne 0 ] && echo "$TXT_ROOT" && echo "$TXT_USE_SUDO" && exit 1

command -v dialog &>/dev/null || { echo "$TXT_NEED_DIALOG"; read -p "$TXT_INSTALL_DIALOG (y/n): " r; [[ $r =~ ^[Yy]$ ]] && apt-get install -y dialog || _despedida; }
command -v vrms &>/dev/null || dialog --yesno "$TXT_NEED_VRMS\n$TXT_INSTALL_DIALOG" 10 50 && apt-get install -y vrms || _despedida

dialog --msgbox "$TXT_INTRO" 10 50

mkdir -p "$FOLDER_NONFREE" "$FOLDER_DEBS" "$FOLDER_UNINSTALLED"

vrms | sed -n '/Non-free packages installed on/,/Contrib packages/ {/Non-free\|Contrib packages/!p}' | awk '{print $1}' >"$FILE_LIST"
componentes=($(cat "$FILE_LIST"))

_menu_lista || _despedida

dialog --yesno "$TXT_WIFI_WARN" 10 50 || _despedida

for pkg in $SELECCION; do
    apt-get remove --purge -y "$pkg"
    mv "$FOLDER_DEBS"/"${pkg}"_*.deb "$FOLDER_UNINSTALLED" 2>/dev/null
done

apt autoremove -y
apt-get clean

dialog --msgbox "$TXT_SUCCESS" 10 50
clear
