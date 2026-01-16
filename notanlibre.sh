#!/bin/bash

# ======================================================================
# Archivo:       notanlibre
# Ruta:          /usr/local/bin/
# Autor:         Charlie Martínez® <cmartinez@quirinux.org>
# Licencia:      https://www.gnu.org/licenses/gpl-2.0.txt
# Propósito:     Seleccionar componentes a reinstalar sin internet
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
TXT_TITLE="Crealib Libersys v1.0 - Comando \"notanlibre\""
TXT_INTRO="Este programa sirve para reinstalar componentes privativos que hayan sido desinstalados con el comando \"libre\"."
TXT_NONE_FOUND="No se detectaron componentes privativos que hayan sido eliminados mediante el uso del comando \"libre\"."
TXT_SELECT="Selecciona componentes a reinstalar (BARRA ESPACIADORA)"
TXT_NO_SELECT="No se seleccionaron componentes."
TXT_CONFIRM="Se van a reinstalar los siguientes elementos:"
TXT_SUCCESS="La reinstalación fue exitosa.\nA veces los componentes privativos son necesarios.\nLamentamos que ahora tu sistema sea un poco menos libre que antes :-("
TXT_GOODBYE="Gracias por utilizar Crealib Libersys - Comando \"notanlibre\""
;;
en)
TXT_ROOT="This script must be run as root."
TXT_USE_SUDO='You can try using "sudo", "sudo su" or "su root".'
TXT_NEED_DIALOG="The 'dialog' program is required to run this script."
TXT_INSTALL_DIALOG="Do you want to install it?"
TXT_TITLE="Crealib Libersys v1.0 - \"notanlibre\" command"
TXT_INTRO="This program reinstalls proprietary components removed with the \"libre\" command."
TXT_NONE_FOUND="No removed proprietary components were detected."
TXT_SELECT="Select components to reinstall (SPACEBAR)"
TXT_NO_SELECT="No components were selected."
TXT_CONFIRM="The following items will be reinstalled:"
TXT_SUCCESS="Reinstallation completed successfully.\nSometimes proprietary components are necessary."
TXT_GOODBYE="Thank you for using Crealib Libersys - \"notanlibre\" command"
;;
de)
TXT_ROOT="Dieses Skript muss als Root ausgeführt werden."
TXT_USE_SUDO="Versuchen Sie es mit sudo oder su."
TXT_NEED_DIALOG="Das Programm 'dialog' wird benötigt."
TXT_INSTALL_DIALOG="Möchten Sie es installieren?"
TXT_TITLE="Crealib Libersys v1.0 – Befehl \"notanlibre\""
TXT_INTRO="Dieses Programm installiert entfernte proprietäre Komponenten neu."
TXT_NONE_FOUND="Es wurden keine entfernten proprietären Komponenten gefunden."
TXT_SELECT="Zu installierende Komponenten auswählen"
TXT_NO_SELECT="Keine Komponenten ausgewählt."
TXT_CONFIRM="Die folgenden Elemente werden neu installiert:"
TXT_SUCCESS="Neuinstallation erfolgreich.\nEinige proprietäre Komponenten sind notwendig."
TXT_GOODBYE="Danke für die Nutzung von Crealib Libersys"
;;
it)
TXT_ROOT="Questo script deve essere eseguito come root."
TXT_USE_SUDO="Prova con sudo o su."
TXT_NEED_DIALOG="Il programma 'dialog' è necessario."
TXT_INSTALL_DIALOG="Vuoi installarlo?"
TXT_TITLE="Crealib Libersys v1.0 - Comando \"notanlibre\""
TXT_INTRO="Questo programma reinstalla componenti proprietari rimossi."
TXT_NONE_FOUND="Nessun componente proprietario rimosso rilevato."
TXT_SELECT="Seleziona i componenti da reinstallare"
TXT_NO_SELECT="Nessun componente selezionato."
TXT_CONFIRM="I seguenti elementi verranno reinstallati:"
TXT_SUCCESS="Reinstallazione completata con successo."
TXT_GOODBYE="Grazie per aver usato Crealib Libersys"
;;
fr)
TXT_ROOT="Ce script doit être exécuté en tant que root."
TXT_USE_SUDO="Essayez avec sudo ou su."
TXT_NEED_DIALOG="Le programme 'dialog' est requis."
TXT_INSTALL_DIALOG="Voulez-vous l’installer ?"
TXT_TITLE="Crealib Libersys v1.0 - Commande \"notanlibre\""
TXT_INTRO="Ce programme réinstalle les composants propriétaires supprimés."
TXT_NONE_FOUND="Aucun composant propriétaire supprimé détecté."
TXT_SELECT="Sélectionnez les composants à réinstaller"
TXT_NO_SELECT="Aucun composant sélectionné."
TXT_CONFIRM="Les éléments suivants seront réinstallés :"
TXT_SUCCESS="Réinstallation réussie."
TXT_GOODBYE="Merci d’utiliser Crealib Libersys"
;;
ru)
TXT_ROOT="Этот скрипт должен быть запущен от имени root."
TXT_USE_SUDO="Используйте sudo или su."
TXT_NEED_DIALOG="Требуется программа 'dialog'."
TXT_INSTALL_DIALOG="Установить?"
TXT_TITLE="Crealib Libersys v1.0 - Команда \"notanlibre\""
TXT_INTRO="Эта программа переустанавливает проприетарные компоненты."
TXT_NONE_FOUND="Удалённые проприетарные компоненты не найдены."
TXT_SELECT="Выберите компоненты для переустановки"
TXT_NO_SELECT="Компоненты не выбраны."
TXT_CONFIRM="Будут переустановлены следующие элементы:"
TXT_SUCCESS="Переустановка успешно завершена."
TXT_GOODBYE="Спасибо за использование Crealib Libersys"
;;
hu)
TXT_ROOT="Ezt a szkriptet rootként kell futtatni."
TXT_USE_SUDO="Használja a sudo vagy su parancsot."
TXT_NEED_DIALOG="A 'dialog' program szükséges."
TXT_INSTALL_DIALOG="Telepíti?"
TXT_TITLE="Crealib Libersys v1.0 - \"notanlibre\" parancs"
TXT_INTRO="Ez a program újratelepíti az eltávolított zárt összetevőket."
TXT_NONE_FOUND="Nem találhatók eltávolított zárt összetevők."
TXT_SELECT="Újratelepítendő elemek kiválasztása"
TXT_NO_SELECT="Nincs kiválasztva elem."
TXT_CONFIRM="A következő elemek újratelepítésre kerülnek:"
TXT_SUCCESS="Újratelepítés sikeres."
TXT_GOODBYE="Köszönjük, hogy a Crealib Libersys-t használta"
;;
gl)
TXT_ROOT="Este script debe executarse como root."
TXT_USE_SUDO="Probe con sudo ou su."
TXT_NEED_DIALOG="O programa 'dialog' é necesario."
TXT_INSTALL_DIALOG="Desexa instalalo?"
TXT_TITLE="Crealib Libersys v1.0 - Comando \"notanlibre\""
TXT_INTRO="Este programa reinstala compoñentes privativos eliminados."
TXT_NONE_FOUND="Non se detectaron compoñentes eliminados."
TXT_SELECT="Seleccione compoñentes a reinstalar"
TXT_NO_SELECT="Non se seleccionaron compoñentes."
TXT_CONFIRM="Reinstalaranse os seguintes elementos:"
TXT_SUCCESS="Reinstalación completada."
TXT_GOODBYE="Grazas por usar Crealib Libersys"
;;
pt)
TXT_ROOT="Este script deve ser executado como root."
TXT_USE_SUDO="Use sudo ou su."
TXT_NEED_DIALOG="O programa 'dialog' é necessário."
TXT_INSTALL_DIALOG="Deseja instalá-lo?"
TXT_TITLE="Crealib Libersys v1.0 - Comando \"notanlibre\""
TXT_INTRO="Este programa reinstala componentes proprietários removidos."
TXT_NONE_FOUND="Nenhum componente removido foi encontrado."
TXT_SELECT="Selecione componentes para reinstalar"
TXT_NO_SELECT="Nenhum componente selecionado."
TXT_CONFIRM="Os seguintes elementos serão reinstalados:"
TXT_SUCCESS="Reinstalação concluída com sucesso."
TXT_GOODBYE="Obrigado por usar Crealib Libersys"
;;
*) _set_lang en ;;
esac
}

# ----------------------------------------------------------------------
#   Funciones
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
    local opciones=()
    for deb in "$FOLDER_UNINSTALLED"/*.deb; do
        [ -e "$deb" ] && opciones+=("$(basename "$deb")" "" off)
    done

    [ ${#opciones[@]} -eq 0 ] && dialog --msgbox "$TXT_NONE_FOUND" 10 50 && return 1

    SELECCION=$(dialog \
        --backtitle "$TXT_TITLE" \
        --separate-output --checklist "$TXT_SELECT" 20 60 10 "${opciones[@]}" \
        2>&1 >/dev/tty)

    [ $? -eq 1 ] && return 1
    [ -z "$SELECCION" ] && dialog --msgbox "$TXT_NO_SELECT" 10 40 && return 1
    return 0
}

# ----------------------------------------------------------------------
# Inicio
# ----------------------------------------------------------------------

_set_lang

[ "$EUID" -ne 0 ] && echo "$TXT_ROOT" && echo "$TXT_USE_SUDO" && exit 1

command -v dialog &>/dev/null || {
    echo "$TXT_NEED_DIALOG"
    read -p "$TXT_INSTALL_DIALOG (y/n): " r
    [[ $r =~ ^[Yy]$ ]] && apt-get install -y dialog || _despedida
}

dialog --msgbox "$TXT_INTRO" 10 50

[ ! -d "$FOLDER_UNINSTALLED" ] && dialog --msgbox "$TXT_NONE_FOUND" 10 50 && _despedida
[ -z "$(ls -A "$FOLDER_UNINSTALLED")" ] && dialog --msgbox "$TXT_NONE_FOUND" 10 50 && _despedida

_menu_lista || _despedida

dialog --yesno "$TXT_CONFIRM\n\n$SELECCION" 10 60 || _despedida

for deb in $SELECCION; do
    apt install "$FOLDER_UNINSTALLED/$deb" -y
    rm -f "$FOLDER_UNINSTALLED/$deb"
done

dialog --msgbox "$TXT_SUCCESS" 12 50
clear
