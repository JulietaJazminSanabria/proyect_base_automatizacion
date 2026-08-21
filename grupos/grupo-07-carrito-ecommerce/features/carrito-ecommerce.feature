# Grupo 07 — Carrito de Compras / E-commerce
# Módulo: Checkout de un e-commerce
#
# Completar los escenarios BDD de este módulo.
# Ver ENTREGABLES.md: mínimo 3 escenarios (1 happy path, 1 negativo, 1 edge case).

Feature: Carrito de Compras / E-commerce

#1er happy path
  Scenario: Completar una compra con productos disponibles
    Given que el cliente tiene productos disponibles en el carrito
    And ha ingresado datos validos de envio y pago
    When confirma la compra
    Then el pedido se registra correctamente
    And se muestra la confirmacion de la compra

# 1er caso negativo
Scenario: No permitir finalizar la compra con datos de pago incompletos
  Given que el cliente tiene productos disponibles en el carrito
  And ha ingresado los datos de envío
  And los datos de pago están incompletos
  When intenta confirmar la compra
  Then el sistema debe impedir finalizar la compra
  And debe indicar que los datos de pago están incompletos

# 1er edge case
Scenario: Confirmar la compra de la última unidad disponible
Given que el cliente tiene en el carrito la última unidad disponible de un producto
And ha ingresado datos válidos de envío y pago
When confirma la compra
Then el pedido se registra correctamente
And el producto queda sin stock disponible
