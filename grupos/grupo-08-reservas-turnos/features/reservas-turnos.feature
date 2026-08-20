# Grupo 08 — Reservas / Turnos
# Módulo: Sistema de reserva de citas
#
# Completar los escenarios BDD de este módulo.
# Ver ENTREGABLES.md: mínimo 3 escenarios (1 happy path, 1 negativo, 1 edge case).

Feature: Reservas / Turnos

  # TODO: Scenario: happy path
  # TODO: Scenario: caso negativo
Scenario: Reserva con fecha y hora pasada
	Given el usuario se encuentra en la pantalla de reserva e ingresa una fecha y  hora anterior al actual 
	When intenta confirmar la reserva 
	Then el sistema debe rechazar la reserva y mostrar mensaje de que la fecha no está disponible.
Scenario: Intentar reservar sin completar todos los datos requeridos
	Given el usuario se encuentra en la pantalla de reserva e ingresa los datos dejando al menos un campo obligatorio vacío
	When intenta confirmar la reserva
	Then el sistema debe rechazar la reserva y mostrar un mensaje indicando que el campo obligatorio debe ser completado
Scenario: Intentar reservar sin completar todos los datos requeridos
	Given el usuario se encuentra en la pantalla de reserva e ingresa los datos dejando al menos un campo obligatorio vacío
	When intenta confirmar la reserva
	Then el sistema debe rechazar la reserva y mostrar un mensaje indicando que el campo obligatorio debe ser completado


  # TODO: Scenario: edge case
