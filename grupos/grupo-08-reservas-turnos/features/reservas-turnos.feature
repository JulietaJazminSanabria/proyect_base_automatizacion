# Grupo 08 — Reservas / Turnos
# Módulo: Sistema de reserva de citas
#
# Completar los escenarios BDD de este módulo.
# Ver ENTREGABLES.md: mínimo 3 escenarios (1 happy path, 1 negativo, 1 edge case).

Feature: Reservas / Turnos

  # CP001 - Paciente - Reservar un turno disponible correctamente
    *Give: El usuario encuentra turno disponible
    *When: El usuario selecciona especialidad, fecha y horario disponible.
    *Then: El sistema debe registrar la reserva correctamente.

  # CP002 - Paciente - Intentar reservar un horario ocupado
    *Give: El usuario se encuentra autenticado en el sistema.
    *When: El usaurio selecciona fecha y horario ya reservado.
    *Then: El sistema no debe permitir realizar la reserva.



  # TODO: Scenario: happy path
  # TODO: Scenario: caso negativo
  # TODO: Scenario: edge case
