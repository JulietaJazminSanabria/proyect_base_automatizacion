# Grupo 02 — Transferencias entre Cuentas
# Módulo: Transferencias internas (mismo banco)

# Completar los escenarios BDD de este módulo.
# Ver ENTREGABLES.md: mínimo 3 escenarios (1 happy path, 1 negativo, 1 edge case).

Feature: Transferencias entre Cuentas
  Como usuario del banco
  Quiero transferir dinero entre mis cuentas
  Para mover dinero de forma segura dentro del mismo banco

  # TODO: Scenario: happy path

  # TODO: Scenario: caso negativo
  Scenario: Transferencia rechazada por saldo insuficiente
    Given el usuario posee una cuenta origen con saldo insuficiente
    And posee una cuenta destino habilitada
    When intenta realizar una transferencia por un monto mayor al saldo disponible
    Then la transferencia debe ser rechazada
    And debe visualizar un mensaje indicando saldo insuficiente
  
   # TODO: Scenario: edge case
