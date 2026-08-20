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


  # TODO: Scenario: caso negativo

  Scenario: Registro rechazado por número de cédula inválido
    Given El usuario ingresa un número de cédula con formato incorrecto
    When El usuario intenta enviar el formulario de registro
    Then El sistema muestra un mensaje de error indicando que la cédula es inválida

  # TODO: Scenario: edge case
  Scenario: Intento de registro con cédula ya existente en el sistema
    Given Existe una cuenta previamente registrada con la misma cédula
    When El usuario intenta completar el registro con esa cédula
    Then El sistema muestra un mensaje indicando que el usuario ya se encuentra registrado
