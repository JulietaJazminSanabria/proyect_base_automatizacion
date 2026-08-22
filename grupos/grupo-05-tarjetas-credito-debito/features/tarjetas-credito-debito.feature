# Grupo 05 — Tarjetas de Crédito/Débito
# Módulo: Gestión de tarjetas
#
# Escenarios BDD del módulo de pago con tarjeta en el checkout del laboratorio.
# Ver ENTREGABLES.md: mínimo 3 escenarios (1 happy path, 1 negativo, 1 edge case).

Feature: Tarjetas de Crédito/Débito

  # Scenario: happy path - Marcos Trinidad
  Scenario: Pago exitoso con tarjeta de credito valida
    Given el usuario tiene una sesion activa en el laboratorio
    And el carrito contiene al menos un producto
    When completa la informacion de pago con una tarjeta valida
    Then el sistema debe crear el pedido
    And debe mostrar el mensaje "¡Pedido realizado con éxito!"

  # Scenario: caso negativo - Marcos Trinidad
  Scenario: Pago rechazado con datos de tarjeta incompletos
    Given el usuario se encuentra en la pantalla de checkout
    When intenta confirmar el pedido sin ingresar los datos de la tarjeta
    Then el sistema debe impedir el envio del formulario
    And debe informar que los campos de tarjeta son obligatorios

  # Scenario: caso negativo - Marcos Trinidad
  Scenario: Pago con tarjeta vencida
    Given el usuario se encuentra en la pantalla de checkout
    When ingresa una tarjeta con fecha de expiracion anterior a la fecha actual
    Then el sistema debe rechazar el pago
    And debe mostrar un mensaje de tarjeta vencida

  # Scenario: caso negativo - Marcos Trinidad
  Scenario: Pago con numero de tarjeta invalido
    Given el usuario se encuentra en la pantalla de checkout
    When ingresa un numero de tarjeta que no cumple la validacion de digito verificador
    Then el sistema debe rechazar el pago
    And no se debe registrar ningun pedido

  # Scenario: edge case - Marcos Trinidad
  Scenario: Pago con tarjeta de debito y CVV de cuatro digitos
    Given el usuario se encuentra en la pantalla de checkout
    When ingresa una tarjeta de debito con un CVV de cuatro digitos
    Then el sistema debe aceptar el codigo de seguridad
    And debe crear el pedido correctamente

  # Scenario: edge case - Marcos Trinidad
  Scenario: Enmascarado de los datos de la tarjeta en el pedido
    Given el usuario confirmo un pedido con una tarjeta valida
    When consulta el pedido en el historial
    Then el numero de tarjeta debe mostrarse enmascarado con los ultimos cuatro digitos
    And el CVV no debe quedar almacenado
