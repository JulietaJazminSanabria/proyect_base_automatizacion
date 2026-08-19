# Grupo 01 — Autenticación y Acceso
# Módulo: Login / Logout / Recuperación de contraseña
#
# Completar los escenarios BDD de este módulo.
# Ver ENTREGABLES.md: mínimo 3 escenarios (1 happy path, 1 negativo, 1 edge case).

Feature: Autenticación y Acceso

  # TODO: Agregar escenarios adicionales del equipo (happy path, caso negativo o edge case)

  # Scenario: caso negativo - Mariset C. Lorente Castillo
  Scenario: Login rechazado con credenciales invalidas
  Given existe una sesion seeded para la cohorte "demo"
  When el usuario intenta iniciar sesion con credenciales invalidas
  Then se debe ver un mensaje de error de autenticacion

  # Scenario: edge case - Mariset C. Lorente Castillo
  Scenario: Login con correo valido ingresado con espacios
  Given el usuario se encuentra en la pantalla de inicio de sesion
  When ingresa un correo valido con espacios adicionales
  Then se debe ver el mensaje "Correo inválido" y no se debe permitir iniciar sesion
