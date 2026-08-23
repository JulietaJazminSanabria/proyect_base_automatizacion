# Grupo 07 — Carrito de Compras / E-commerce
# Modulo: Checkout de un e-commerce
# Escenario: Eliminar producto del carrito
# Casos de prueba: 1 happy path, 1 negativo, 1 edge case

Feature: Eliminar producto del carrito
  Como cliente del e-commerce
  quiero eliminar productos de mi carrito
  para ajustar mi compra antes del checkout

  Scenario: Eliminar un producto existente del carrito (happy path)
    Given el carrito contiene "Auriculares Bluetooth" con cantidad 1
    When elimino el producto "Auriculares Bluetooth" del carrito
    Then el producto ya no se lista en el carrito
    And se muestra el mensaje "Tu carrito esta vacio"

  Scenario: Intentar eliminar un producto inexistente en el carrito (caso negativo)
    Given el carrito contiene solo "Teclado USB"
    When intento eliminar el producto "Mouse Gamer" que no esta en el carrito
    Then el sistema muestra el error "El producto no existe en el carrito"
    And el carrito conserva el producto "Teclado USB"

  Scenario: Doble clic en eliminar sobre un producto ya removido (edge case)
    Given el carrito contiene solo "Cable HDMI"
    When elimino el producto "Cable HDMI" del carrito
    And hago doble clic sobre el boton eliminar del item ya removido
    Then el sistema no muestra errores
    And el carrito permanece vacio con total 0
