# Grupo 04 — Registro de Usuario / Onboarding
# Módulo: Alta de nuevo cliente (KYC básico)
#
# Completar los escenarios BDD de este módulo.
# Ver ENTREGABLES.md: mínimo 3 escenarios (1 happy path, 1 negativo, 1 edge case).

Feature: Registro de Usuario / Onboarding
Como usuario quiero registrarme con mis datos personales 
para poder acceder a la plataforma

  # TODO: Scenario: happy path

Scenario : Registro exitoso de nuevo cliente con datos válidos
  Given El usuario completa el formulario de registro con nombre, cedula y correo válidos
  When El usuario confirma el envío de formulario de registro
  Then El sistema crea la cuenta del usuario y muestra un mensaje de Bienvenida

Scenario: Registro completado correctamente con verificación de correo
    Given El usuario se encuentra en el formulario de registro
    When El usuario ingresa un correo válido y confirma el código de verificación recibido
    Then El sistema valida el correo y completa el registro del usuario

  # TODO: Scenario: caso negativo

  Scenario: Registro rechazado por número de cédula inválido
    Given El usuario ingresa un número de cédula con formato incorrecto
    When El usuario intenta enviar el formulario de registro
    Then El sistema muestra un mensaje de error indicando que la cédula es inválida

  Scenario: Registro rechazado por correo electrónico inválido
    Given El usuario se encuentra en el formulario de registro
    When El usuario ingresa un correo con un formato inválido
    Then El sistema muestra un mensaje indicando que el correo electrónico no es válido
	
Scenario: Registro rechazado por campos obligatorios incompletos
    Given El usuario se encuentra en el formulario de registro
    When El usuario intenta enviar el formulario sin completar uno o más campos obligatorios
    Then El sistema no permite continuar con el registro y muestra un mensaje indicando los campos que deben ser completados
	
Scenario: Registro rechazado por no cumplir con la edad mínima requerida
    Given El usuario ingresa sus datos personales correctamente
    When El sistema valida que el usuario no cumple con la edad mínima requerida
    Then El sistema rechaza el registro y muestra un mensaje indicando que no cumple con los requisitos de edad

  # TODO: Scenario: edge case
  Scenario: Intento de registro con cédula ya existente en el sistema
    Given Existe una cuenta previamente registrada con la misma cédula
    When El usuario intenta completar el registro con esa cédula
    Then El sistema muestra un mensaje indicando que el usuario ya se encuentra registrado

  Scenario: Código de verificación expirado durante el registro
    Given El usuario recibió un código de verificación para completar su registro
    When El usuario intenta utilizar el código después de su tiempo de vigencia
    Then El sistema indica que el código ha expirado y solicita generar uno nuevo
	
Scenario: Registro durante indisponibilidad temporal del servicio de validación
    Given El usuario completa el formulario de registro con datos válidos
    And El servicio de validación de identidad se encuentra temporalmente no disponible
    When El usuario confirma el registro
    Then El sistema informa que la validación no está disponible temporalmente y permite reintentar el proceso posteriormente