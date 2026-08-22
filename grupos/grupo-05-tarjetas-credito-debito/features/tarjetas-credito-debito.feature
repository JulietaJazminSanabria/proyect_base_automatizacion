# Grupo 05 — Tarjetas de Crédito/Débito
# Módulo: Gestión de tarjetas
#
# Escenarios BDD del módulo de gestión de tarjetas de crédito/débito.
# Ver ENTREGABLES.md: mínimo 3 escenarios (1 happy path, 1 negativo, 1 edge case).

Feature: Gestión de tarjetas de crédito/débito
  Como cliente del banco
  Quiero realizar gestiones de mis tarjetas de crédito/débito
  Para mantenerme al día con los últimos ajustes de mi tarjeta

  Scenario: Ver datos tarjeta
    Given el cliente está autenticado en la app con biometría válida
    And posee una tarjeta de crédito/débito
    When el cliente solicita visualizar los datos de la tarjeta
    Then se muestra el numero de tarjeta, vencimiento y datos adicionales

  Scenario: Cambio exitoso de PIN
    When el cliente cambia el PIN actual por un nuevo PIN
    Then el sistema confirma el cambio con el mensaje "PIN actualizado"
    And el nuevo PIN es requerido en la siguiente transacción

  Scenario: Bloqueo temporal por tarjeta perdida
    When el cliente reporta la tarjeta como "PERDIDA"
    Then la tarjeta queda con estado "BLOQUEO_TEMPORAL"
    And el bloqueo se aplica en todos los canales
    And las autorizaciones posteriores son rechazadas
    And se genera una notificación correspondiente al cliente

  Scenario: Desbloqueo exitoso de tarjeta bloqueada
    Given la tarjeta tiene estado "BLOQUEADA" por motivo del "CLIENTE"
    When el cliente solicita el desbloqueo
    And autentica con biometría válida
    Then la tarjeta queda con estado "ACTIVA"
    And el sistema confirma el desbloqueo por el medio de notificacion optado por el cliente

  Scenario: Aumento exitoso de límite diario de compras
    When el cliente modifica el límite "compras_comercio" a un monto diario superior
    And confirma con OTP válido
    Then el nuevo límite diario queda confirmado
    And el cambio es efectivo inmediatamente para nuevas autorizaciones

  Scenario: Pago exitoso desde cuenta propia
    When el cliente paga un monto generado a la tarjeta desde su cuenta vista
    Then el pago se registra con estado "APROBADA"
    And se genera el comprobante con número único

  # Scenario: caso negativo - Marcos Trinidad
  Scenario: Aumento de límite diario rechazado por OTP inválido
    Given la tarjeta tiene estado "ACTIVA"
    When el cliente modifica el límite "compras_comercio" a un monto diario superior
    And confirma con un OTP inválido
    Then el sistema rechaza el cambio con el mensaje "Código OTP inválido"
    And el límite diario se mantiene sin cambios
    And se registra el intento fallido en la bitácora de la tarjeta
