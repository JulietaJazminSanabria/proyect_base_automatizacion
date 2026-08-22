# Grupo 01 — Autenticación y Acceso

**Módulo:** Login / Logout / Recuperación de contraseña
**Rama:** `grupo-01-autenticacion-acceso`

## Integrantes

- Gloria Figueredo ---> gloriaoliva487@gmail.com
- David Cristaldo  ---> davidcrislo89@gmail.com
- Oscar Benítez    ---> oscardocito@gmail.com
- Mariel Aquino    ---> maquino1986@gmail.com
- Mariset Lorente  ---> marisetlorentecastillo@gmail.com

## Análisis y Alcance

### Objetivo del flujo automatizado

Validar el flujo de autenticación y acceso al laboratorio AIQUAA, contemplando
el inicio de sesión, control de acceso a recursos protegidos, recuperación de
contraseña y cierre de sesión, incluyendo escenarios exitosos, negativos y
casos límite.

### Supuestos

- El ambiente de pruebas de AIQUAA se encuentra disponible.
- Existen usuarios y datos de prueba previamente configurados.
- El servicio de autenticación se encuentra operativo durante las pruebas.
- Se utilizan únicamente datos del entorno de pruebas.
- La cohorte "demo" dispone de una sesión seeded cuando el escenario lo requiere.
- Los recursos protegidos del laboratorio requieren una sesión autenticada.
- El servicio de recuperación de contraseña y envío de notificaciones se
  encuentra disponible cuando el escenario lo requiere.

### Riesgos

- Indisponibilidad temporal del ambiente o del servicio de autenticación.
- Credenciales o usuarios de prueba vencidos, bloqueados o deshabilitados.
- Bloqueo temporal de usuarios debido a múltiples intentos fallidos.
- Cambios en las rutas, campos, mensajes o comportamiento de la interfaz.
- Fallas o demoras en servicios externos utilizados para la recuperación
  de contraseña.
- Configuración incorrecta o indisponibilidad de la sesión seeded.
- Diferencias entre los mensajes esperados y los implementados en la interfaz.

### Cobertura incluida

- Login con credenciales válidas.
- Login con credenciales inválidas.
- Validación de campos obligatorios.
- Casos límite relacionados con los datos de autenticación.
- Redirección al login de usuarios no autenticados que intentan acceder
  a recursos protegidos.
- Acceso al recurso protegido después de una autenticación exitosa.
- Recuperación de contraseña con datos registrados.
- Cierre de sesión seguro.

### Cobertura excluida

- Registro y onboarding de nuevos usuarios.
- Autenticación multifactor (MFA/2FA).
- Inicio de sesión mediante proveedores externos.
- Gestión de roles y permisos.
- Funcionalidades de negocio posteriores a la autenticación asignadas
  a otros módulos.
- Pruebas de rendimiento, carga y seguridad.
- Validación detallada del contenido o formato de los correos de recuperación.
- Uso, expiración y cambio efectivo de contraseña mediante el enlace de
  recuperación.

## Entregables

Checklist según [ENTREGABLES.md](../../ENTREGABLES.md):

#- [ ] Análisis y alcance
#- [ ] BDD — `features/` (mínimo 3 escenarios: happy path, negativo, edge case)
- [ ] API — colección Postman/Newman (si aplica al módulo)
- [ ] UI — `tests/e2e/` con Playwright
- [ ] Evidencias en `evidence/`
- [ ] CI/CD verde
- [ ] PR a `main` usando la plantilla del repo
