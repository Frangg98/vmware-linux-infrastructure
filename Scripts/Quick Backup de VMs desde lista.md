# Quick Backup de VMs desde lista (.txt) – Veeam PowerShell

## Descripción
Este script en PowerShell permite ejecutar un **Quick Backup** en Veeam Backup & Replication para un conjunto específico de máquinas virtuales, las cuales se leen desde un archivo `.txt`.

El script busca cada VM en **todos los vCenter registrados en Veeam**, valida su existencia y ejecuta el Quick Backup utilizando el último punto de restauración disponible.

---

## Objetivo
- Ejecutar Quick Backup de forma masiva y controlada
- Evitar ejecuciones manuales VM por VM
- Centralizar la operación mediante una lista externa

---

## Requisitos
- Veeam Backup & Replication **12 o superior**
- Ejecución desde la **consola de Veeam**
- Al menos un **Full Backup previo** por VM
- La VM debe pertenecer a un job existente

---

## Puntos importantes antes de ejecutar el script

- La VM debe contar con al menos un backup previo.  
  Si no existe, el Quick Backup fallará.

- Los nombres de las VMs deben coincidir exactamente con vCenter.

- El script puede cerrarse en cualquier momento sin afectar otros jobs,
  salvo que el job esté siendo utilizado.

- El script solo funciona desde la consola de Veeam.

---

## Formato del archivo de entrada (.txt)

Una VM por línea:


---

## Uso del script

1. Editar la ruta del archivo `.txt`:
```powershell
$archivoVMs = "C:\Ruta\lista_vms.txt"
Ejecutar el script desde la consola de Veeam.

Validar en pantalla:

VMs encontradas

vCenter donde se localizaron

Inicio del Quick Backup

Resultado esperado

Quick Backup ejecutado correctamente

Reporte de VMs no encontradas

Proceso controlado e interactivo

Compatibilidad

✔ Veeam Backup & Replication 12+
