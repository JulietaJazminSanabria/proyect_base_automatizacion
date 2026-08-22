# Grupo 10 — Administración de Roles y Permisos
# Módulo: Gestión de usuarios internos (backoffice)
#
# Completar los escenarios BDD de este módulo.
# Ver ENTREGABLES.md: mínimo 3 escenarios (1 happy path, 1 negativo, 1 edge case).

Feature: Administración de Roles y Permisos

  # TODO: Scenario: happy path
  # TODO: Scenario: caso negativo
  # TODO: Scenario: edge case


# Opción 5 (Edge Case - Último Admin):
#  Scenario: Impedir la eliminación del único Administrador activo del sistema
#    Given que solo existe un usuario registrado con el rol "Super Admin" en el sistema
#    When el usuario intenta remover el rol "Super Admin" de esa única cuenta
#    Then el sistema deshabilita la opción de guardar
 #   And muestra la advertencia "No se puede eliminar el único Administrador del sistema"