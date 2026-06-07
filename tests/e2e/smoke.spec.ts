import { test, expect } from '@playwright/test';

test.describe('AIQUAA lab smoke', () => {
  test('loads labs home', async ({ page }) => {
    await page.goto('/labs');
    await expect(page).toHaveURL(/\/labs/);
  });

  test('opens test app login', async ({ page }) => {
    await page.goto('/labs/test-app/login');
    await expect(page.locator('[data-testid="lab-login-email"]')).toBeVisible();
    await expect(page.locator('[data-testid="lab-login-submit"]')).toBeVisible();
  });
});
