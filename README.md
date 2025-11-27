# Crealib Libersys

**Autor / Author:** Charlie Martínez – Quirinux GNU/Linux®  
**Licencia / License:** GPLv2.0 <br>
**Compatible OS:** Debian, Devuan y derivadas

![liberar-debian](https://github.com/user-attachments/assets/80ec22f0-7a82-47f9-a914-2e655763bc42)

---
![Contributors](https://img.shields.io/github/contributors/charliemartinez/crealib-libersys) ![Stars](https://img.shields.io/github/stars/charliemartinez/crealib-libersys) ![Forks](https://img.shields.io/github/forks/charliemartinez/crealib-libersys) ![Issues](https://img.shields.io/github/issues/charliemartinez/crealib-libersys) ![Last Commit](https://img.shields.io/github/last-commit/charliemartinez/crealib-libersys) ![Activity](https://img.shields.io/github/commit-activity/m/charliemartinez/crealib-libersys) ![Repo Size](https://img.shields.io/github/repo-size/charliemartinez/crealib-libersys) ![Lenguaje](https://img.shields.io/badge/Lenguaje-Bash-blue)


---

## 🧭 Descripción general / Overview

**ES:**  
`Crealib Libersys` libera de componentes privativos a sistemas basados en **Debian, Devuan y distribuciones derivadas**. Utiliza el programa `vrms` para detectar software no libre instalado y permite eliminarlo fácilmente, manteniendo la posibilidad de restaurar los paquetes sin conexión a internet.

**EN:**  
`Crealib Libersys` removes non-free components from **Debian, Devuan, and derivative distributions**. It uses `vrms` to detect installed non-free software and allows easy removal, while keeping the ability to restore packages offline.

---

## ✔️ Características / Features

**ES:**
- Detección automática de paquetes privativos  
- Eliminación segura de software no libre  
- Restauración offline de los paquetes eliminados  
- Uso de `vrms` como motor de análisis  
- No modifica el kernel del sistema  
- Optimizado para sistemas basados en Debian  
- Programado en Bash Scripting  

**EN:**
- Automatic detection of proprietary packages  
- Safe removal of non-free software  
- Offline restoration of removed packages  
- Uses `vrms` as analysis engine  
- Does not modify the system kernel  
- Optimized for Debian-based systems  
- Programmed in Bash scripting  

---

## ▶️ Ejecución / How to Run

### ES / EN – Instalación

    wget https://repo.quirinux.org/pool/main/c/crealib-libersys/crealib-libersys_1.0.3_all.deb
    sudo apt install ./crealib-libersys_1.0.3_all.deb

---

### ES / EN – Uso

Ejecutar análisis y limpieza:

    libre

Restaurar los programas eliminados sin conexión a internet:

    notanlibre

---

## ⚠️ Nota Importante / Important Note

**ES:**  
Libersys libera los paquetes instalados, **pero mantiene el kernel actual del sistema**. Para una limpieza completa, se recomienda instalar un núcleo libre GNU:  
http://linux-libre.fsfla.org/pub/linux-libre/releases/6.4-gnu/

**EN:**  
Libersys removes proprietary packages, **but it keeps the current system kernel**. For a full cleanup, installing a GNU Linux-libre kernel is recommended at the link above.

---

## 🤝 Agradecimientos / Acknowledgments

**ES:**  
A **Riky Linux**, por las valiosas sugerencias realizadas en su canal *Gnuxero*:  
https://fediverse.tv/w/dfkDrxL2DU5rSTGhiRCJDP

**EN:**  
Thanks to **Riky Linux** for the valuable suggestions shared on the *Gnuxero* channel.

---

## 📘 Información ampliada / More Information

https://programadorcondiscalculia.com/programa-para-liberar-debian/

---

## ⚖️ Aviso legal / Legal Notice

**ES:**  
Este proyecto forma parte del ecosistema **Quirinux**, pero es compatible con cualquier distribución moderna de GNU/Linux. Distribuido bajo los términos de la licencia **GPLv2**.

**EN:**  
This project is part of the **Quirinux** ecosystem but remains compatible with any modern GNU/Linux distribution. Released under the terms of the **GPLv2 license**.

**Autor / Author:** Charlie Martínez  
📧 <cmartinez@quirinux.org>

**Más información / More information:**  
https://www.quirinux.org/aviso-legal
