# Grupo 07 — Carrito de Compras / E-commerce
# Módulo: Checkout de un e-commerce
#
# Completar los escenarios BDD de este módulo.
# Ver ENTREGABLES.md: mínimo 3 escenarios (1 happy path, 1 negativo, 1 edge case).

Feature: Carrito de Compras / E-commerce

  Scenario: Calcular el total del carrito con multiples productos
    Given el usuario tiene los siguientes productos en el carrito:
      | producto   | cantidad | precio  |
      | Zapatillas | 1        | 250000  |
      | Medias     | 2        | 15000   |
      | Remera     | 1        | 80000   |
    When el sistema calcula el total del carrito
    Then el total debe ser 360000

  # TODO: Scenario: caso negativo
  # TODO: Scenario: edge case
