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

  # TODO: Scenario: edge case
