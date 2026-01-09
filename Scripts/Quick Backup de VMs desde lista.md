# Quick Backup de VMs desde lista (.txt) – Veeam PowerShell

## Descripción
Este script en PowerShell permite ejecutar un **Quick Backup** en Veeam Backup & Replication para un conjunto específico de máquinas virtuales, las cuales se toman desde un archivo `.txt`.

El script busca cada VM en **todos los vCenter registrados en Veeam**, valida su existencia y ejecuta el Quick Backup utilizando el último punto de restauración disponible.

---

## Objetivo
- Ejecutar Quick Backup de forma masiva y controlada
- Evitar ejecuciones manuales VM por VM
- Centralizar la operación mediante una lista externa
- Encontrar equipos sin fullbackup o job

---

## Requisitos
- Veeam Backup & Replication **12 o superior**
- Ejecución como administrador del .ps1
- Al menos un **Full Backup previo** por VM
- La VM debe pertenecer a un job existente
- 

---

## Puntos importantes antes de ejecutar el script

- La VM debe contar con al menos un backup previo.  
  Si no existe, el Quick Backup fallará.

- Los nombres de las VMs puede estar en mayusculas o minusculas pero debe de ser exactamente el mismo nombre sin espacios extra o letras demas.

- El script puede cerrarse en cualquier momento sin afectar otros jobs

- Si se ejecuta el script y se esta usando el job de alguna de las vms, estas no se ejecutaran y aparecera un error en pantalla mencionando que seran excluidas

- El script solo debe de tener alcance a la consola de Veeam no puede ser ejecutado desde un pivote

---

## Formato del archivo de entrada (.txt)

Una VM por línea sin espacios:
```
vm1
VM2
vm3
VM4
....
```


## Uso de Script

1. editar la ruta del archivo ```powershell
$archivoVMs = "C:\Ruta\lista_vms.txt" ```

2. Ejecutar el script en formato .ps1 como administrador o bien abrir powershell y ejecutarlo

3. Validar en pantalla:
   
- VMs encontradas
- vCenter donde se localizaron
- Inicio del Quick Backup

---

## Resultado esperado

- Quick Backup ejecutado correctamente
- Reporte de VMs no encontradas
- Proceso controlado e interactivo

---

