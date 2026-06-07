# Proyect Base Automatizacion

Base comun para el proyecto grupal que deben entregar los equipos.

Este repositorio existe separado de AIQUAA para que:

- no se mezcle con el producto principal
- cada equipo pueda clonarlo como punto de partida
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
|-- package.json
|-- playwright.config.ts
|-- .env.example
|-- features/
|   |-- auth.feature
|   `-- checkout.feature
|-- postman/
|   |-- AIQUAA-Lab-Template.postman_collection.json
|   `-- local.postman_environment.json
|-- playwright/
|   `-- README.md
|-- tests/
|   |-- e2e/
|   |   `-- smoke.spec.ts
|   `-- bdd/
|       `-- README.md
|-- ci/
|   `-- github-actions-template.yml
|-- docs/
|   `-- FLUJO_SEMANAL.md
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

## Perfiles sugeridos de sesion

- `default`
- `demo`
- `team-a`
- `team-b`

## Modo de uso por equipo

1. Clonar este repo base.
2. Crear una rama por grupo y por semana.
3. Conectarlo con el sitio web de AIQUAA como sistema bajo prueba.
4. Correr el seed del laboratorio.
5. Completar los archivos plantilla.
6. Agregar sus propias pruebas y evidencias.
7. Entregar un PR por semana.

## Variables de entorno

Copiar `.env.example` a `.env` y ajustar:

- `BASE_URL`
- `API_BASE_URL`
- `GROUP_NAME`
- `SESSION_PROFILE`

## Scripts utiles

- `pnpm test:e2e`
- `pnpm test:api`
- `pnpm test:bdd`
- `pnpm smoke`
