# Trazabilidad inicial BDD → API — Grupo 10 (Roles y Permisos)

Feature: `grupos/grupo-10-roles-permisos/features/roles-permisos.feature`
Colección: `postman/Grupo10_Roles_Permisos.postman_collection.json`
API bajo prueba: AIQUAA Sandbox (`/api/v1`), autenticación por header `x-api-key`

## Variables de la colección

| Variable | Uso |
|---|---|
| baseUrl | URL base del sandbox |
| apiKey | API key del alumno (no se versiona) |
| rolNombre | Rol a asignar (`soporte`) |
| rolInexistenteId | Id inválido para el caso negativo (999999) |
| usuarioId, roleEditorId | Se capturan automáticamente de las respuestas |
| emailUnico, documentoUnico | Se generan en el pre-request para evitar duplicados (409) |

## Mapeo de escenarios

| ID | Escenario BDD | Endpoint(s) | Datos de entrada | Resultado esperado | Resultado obtenido |
|----|---------------|-------------|------------------|--------------------|--------------------|
| ESC-01 | Administrador crea un usuario interno y le asigna un rol exitosamente | GET /api/v1/roles; POST /api/v1/usuarios; POST /api/v1/usuarios/{id}/roles; GET /api/v1/usuarios/{id}/roles | email y documento únicos, rol `soporte` | 200; 201; 201; 200 con el rol listado; tiempo < 3000 ms | Cumple (4/4 requests, todos los tests PASS) |
| ESC-05 | Intento de asignar un rol inexistente | POST /api/v1/usuarios/{id}/roles | roleId = 999999 | 400 (o 404) con `error.message` | Cumple (3/3 tests PASS) |
| ESC-06 | Usuario interno queda sin ningún rol asignado | DELETE /api/v1/usuarios/{id}/roles/{roleId} | único rol del usuario | 400/409: el sistema no permite dejar al usuario sin rol | **No cumple**: la API responde 204 y deja al usuario sin rol |

## Hallazgos

1. **ESC-06 (edge case):** el BDD exige que el sistema impida quitar el único rol de un usuario, pero la API (`DELETE /usuarios/{id}/roles/{roleId}`) solo documenta 204 y 404; no existe validación de "al menos un rol". Se registra como hallazgo para el equipo.
2. **Nombres de rol:** el BDD menciona el rol "Editor", pero la API solo define `admin`, `soporte`, `auditor` y `operador`. Se usó `soporte` como equivalente para la prueba. Conviene alinear los escenarios BDD con los roles reales.

## Escenarios no mapeados a API

- Operador sin permisos para crear usuarios, y acción sobre el límite permitido: se validan por UI; la API autentica con API key, no según el rol del usuario.
- Cajero con desembolso de USD 49.999: no existe un endpoint de desembolsos en este módulo.

## Evidencia

Capturas en `grupos/grupo-10-roles-permisos/evidence/` (corrida de Postman: 17/18 tests; el que falla corresponde al hallazgo de ESC-06).