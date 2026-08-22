# Grupo 05 — Tarjetas de Crédito/Débito

**Módulo:** Gestión de tarjetas
**Rama:** `grupo-05-tarjetas-credito-debito`

## Integrantes

- Marcos Trinidad ---> (trinidad.py@gmail.com)

## Alcance

- **Objetivo:** validar el flujo de pago con tarjeta de crédito/débito en el checkout
  del laboratorio (`/labs/test-app/checkout`): captura de número de tarjeta, titular,
  fecha de expiración y CVV, y el registro del pedido resultante.
- **Supuestos:**
  - El usuario ya está autenticado (`tester@aiquaa.com` / `Test1234!`) y el carrito
    tiene al menos un producto; el checkout redirige al carrito si está vacío.
  - Los datos de tarjeta usados son de prueba, nunca reales.
- **Riesgos:**
  - El laboratorio inyecta bugs aleatorios por sesión (6 a 8 de 10), entre ellos
    `bug-05-checkout-500` (Apartment/Suite > 50 caracteres devuelve un error genérico),
    lo que puede afectar la estabilidad de los escenarios de checkout.
  - El formulario no expone `data-testid`, por lo que los selectores dependen de los
    labels visibles ("Número de Tarjeta", "CVV", etc.).
- **Cobertura incluida:** validación de datos de tarjeta (número, expiración, CVV),
  creación del pedido y enmascarado de los datos sensibles en el pedido guardado.
- **Cobertura excluida:** integración con pasarelas de pago reales, 3-D Secure,
  reembolsos y alta/baja de tarjetas guardadas (el laboratorio no las implementa).

## Escenarios entregados

6 escenarios en [`features/tarjetas-credito-debito.feature`](features/tarjetas-credito-debito.feature):
1 happy path, 3 negativos y 2 edge cases.

### Incidencias detectadas

El checkout del laboratorio **no valida los datos de la tarjeta**: acepta tarjetas
vencidas (`12/20`) y números que no cumplen el dígito verificador (Luhn), creando el
pedido igual. Los escenarios "Pago con tarjeta vencida" y "Pago con numero de tarjeta
invalido" documentan el comportamiento esperado y por lo tanto fallan contra el
laboratorio actual.

## Entregables

Checklist según [ENTREGABLES.md](../../ENTREGABLES.md):

- [x] Análisis y alcance
- [x] BDD — `features/` (mínimo 3 escenarios: happy path, negativo, edge case)
- [ ] API — colección Postman/Newman (no aplica: el test-app es client-side, sin API)
- [ ] UI — `tests/e2e/` con Playwright
- [ ] Evidencias en `evidence/`
- [ ] CI/CD verde
- [ ] PR a `main` usando la plantilla del repo
