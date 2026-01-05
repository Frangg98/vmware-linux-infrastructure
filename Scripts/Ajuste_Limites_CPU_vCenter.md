# Ajuste de Límites de CPU en vCenter

Este script permite ajustar de forma automatizada el límite de CPU (MHz)
de máquinas virtuales en un entorno VMware vCenter, tomando como base:

- El número de vCPUs de cada VM
- La frecuencia real de los hosts ESXi

---

## 📌 Escenario

En algunos clusters, los hosts ESXi trabajan a una frecuencia definida
(por ejemplo 2500 MHz). Sin embargo, existen máquinas virtuales que pueden
tener límites de CPU configurados incorrectamente, ya sea:

- Por debajo de lo recomendado
- Por encima de la capacidad real del host

Esto debido a diferentes factores
- Los ESXi fueron reemplazados por hardware con mayor frecuencia
- Cuando se crearon las maquinas virtuales no se limito o bien se realizo de manera incorrecta

Esto puede provocar problemas de performance y planificación de recursos.

---

## ⚙️ Funcionamiento

El script realiza las siguientes acciones:

1. Se conecta al vCenter especificado
2. Lee una lista con las máquinas virtuales desde un archivo de texto (.txt)
3. Obtiene el número de vCPUs de cada VM
4. Calcula el límite de CPU en MHz
5. Aplica el límite calculado a cada máquina virtual
6. Muestra el resultado por consola
7. Se desconecta del vCenter

---

## 📂 Requisitos

- VMware PowerCLI
- Acceso al vCenter y permisos para realizar la config
- Archivo `.txt` con los nombres de las VMs (una por línea)

---

## ⚠️ Consideraciones

- La frecuencia del ESXi debe ajustarse manualmente en el script
según el entorno real.
- El script no modifica reservas ni shares.
- Se recomienda probar primero en un entorno de laboratorio.

---

## 🛡️ Nota

Este script no contiene información sensible y ha sido diseñado
para fines educativos y operativos.
   
