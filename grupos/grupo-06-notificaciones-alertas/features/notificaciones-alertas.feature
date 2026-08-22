# Grupo 06 — Notificaciones y Alertas
# Módulo: Sistema de notificaciones (push/email/SMS)
#
# Completar los escenarios BDD de este módulo.
# Ver ENTREGABLES.md: mínimo 3 escenarios (1 happy path, 1 negativo, 1 edge case).

Feature: Notificaciones y Alertas

  Como usuario del sistema
  Quiero recibir alertas sobre mis operaciones
  Para mantenerme informado de manera oportuna y segura

  @happy_path
  Scenario: Enviar una notificación push después de una transferencia exitosa
    Given el usuario tiene habilitadas las notificaciones push
    And el usuario tiene un dispositivo registrado con un token vigente
    When se confirma una transferencia exitosa de 500000 Gs con el identificador "TRX-001"
    Then el sistema debe enviar una notificación push al dispositivo registrado
    And la notificación debe incluir el monto y el identificador de la transferencia

  @negative
  Scenario: No enviar una notificación push cuando el canal está desactivado
    Given el usuario tiene deshabilitadas las notificaciones push
    When se confirma una transferencia exitosa de 500000 Gs con el identificador "TRX-002"
    Then el sistema no debe enviar una notificación push al usuario
    And debe registrar que el canal fue omitido por preferencia del usuario

  @edge_case
  Scenario: Evitar notificaciones duplicadas ante el reprocesamiento de un evento
    Given el usuario tiene habilitadas las notificaciones push
    And existe una transferencia exitosa con el identificador "TRX-003"
    When el sistema procesa dos veces el evento de la transferencia "TRX-003"
    Then el usuario debe recibir una sola notificación push
    And debe existir un único registro de entrega asociado al identificador "TRX-003"
