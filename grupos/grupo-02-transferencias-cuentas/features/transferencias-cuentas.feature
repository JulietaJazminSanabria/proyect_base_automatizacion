# Grupo 02 — Transferencias entre Cuentas
# Módulo: Transferencias internas (mismo banco)
#
# Completar los escenarios BDD de este módulo.
# Ver ENTREGABLES.md: mínimo 3 escenarios (1 happy path, 1 negativo, 1 edge case).

Feature: Transferencias entre Cuentas

  # TODO: Scenario: happy path
  # TODO: Scenario: caso negativo
  # TODO: Scenario: edge case
  @happy_path
  Scenario: Realizar una transferencia interna exitosa
  Given la cuenta destino pertenece al mismo banco
  And la cuenta destino se encuentra activa
  When el cliente realiza una transferencia de 5000000 Gs desde la cuenta origen hacia la cuenta destino
  Then la transferencia se realiza exitosamente
  And el saldo de la cuenta origen se reduce en 5000000 Gs
  And el saldo de la cuenta destino aumenta en 5000000 Gs
  And se genera un comprobante de la transferencias
  
  Feature: Transferencia entre cuentas

  Como usuario del sistema bancario
  Quiero transferir dinero entre mis cuentas
  Para administrar el saldo disponible

  Scenario: Transferir exactamente el saldo disponible de la cuenta origen
    Given que el usuario tiene una cuenta origen con un saldo disponible de $1000
    And tiene una cuenta destino habilitada para recibir transferencias
    And el usuario se encuentra autenticado en el sistema
    When el usuario realiza una transferencia de 1000 Gs desde la cuenta origen hacia la cuenta destino
    Then la transferencia debe ser procesada exitosamente
    And el saldo de la cuenta origen debe quedar en 0 Gs
    And el saldo de la cuenta destino debe incrementarse en 1000 Gs
    And el sistema debe mostrar un mensaje de transferencia exitosa