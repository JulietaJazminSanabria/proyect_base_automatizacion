# Proyect Base Automatizacion

Base comun para el proyecto grupal que deben entregar los equipos del diplomado QA.

Este repositorio existe separado de AIQUAA para que:

- no se mezcle con el producto principal
- cada equipo pueda forkearlo como punto de partida
- el entregable grupal tenga estructura comun
- BDD, API, UI y CI/CD partan de una misma base

## Objetivo

Cada equipo debe usar esta base para construir y entregar una automatizacion completa sobre el laboratorio de AIQUAA, cubriendo al menos:

- analisis funcional breve
- escenarios BDD
- coleccion Postman/Newman
- automatizacion UI con Playwright
- evidencias
- pipeline CI minimo

## Estructura

```text
proyect_base_automatizacion/
|-- README.md
|-- ENTREGABLES.md
|-- BACKLOG.md
|-- features/
|   |-- auth.feature
|   `-- checkout.feature
|-- postman/
|   |-- AIQUAA-Lab-Template.postman_collection.json
|   `-- local.postman_environment.json
|-- playwright/
|   `-- README.md
|-- ci/
|   `-- github-actions-template.yml
|-- evidence/
|   `-- README.md
`-- templates/
    |-- bug-report-template.md
    `-- test-plan-template.md
```

## Alcance sugerido del entregable

### Modulo 1

- acceso y recuperacion

### Modulo 2

- onboarding / alta

### Modulo 3

- operacion y seguimiento

## Endpoints recomendados

### Auth real

- `POST /api/v1/auth/login`
- `POST /api/v1/auth/request-reset`
- `POST /api/v1/auth/reset`
- `POST /api/v1/auth/register`
- `GET /api/v1/auth/verify-email?token=...`

### Laboratorio

- `POST /api/v1/labs/admin/seed/:candidateId`
- `POST /api/v1/labs/admin/reset`
- `GET /api/v1/labs/test-app/products`
- `POST /api/v1/labs/test-app/cart/items`
- `POST /api/v1/labs/test-app/checkout`
- `GET /api/v1/labs/test-app/orders`
- `GET /api/v1/labs/evidence/:sessionId`

## Cohortes sugeridas

- `default`
- `demo`
- `team-a`
- `team-b`

## Modo de uso por equipo

1. Hacer fork de este repo base.
2. Conectarlo con el laboratorio AIQUAA.
3. Correr el seed del laboratorio.
4. Completar los archivos plantilla.
5. Agregar sus propias pruebas y evidencias.
6. Presentar el proyecto grupal con esta estructura como base.
