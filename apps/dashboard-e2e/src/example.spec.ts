import { test, expect } from '@playwright/test';

test('has title', async ({ page }) => {
  await page.goto('/');

  // Wait for the page to load and the h1 element to be visible
  await page.waitForSelector('h1', { timeout: 10000 });
  
  // Expect h1 to contain a substring.
  const h1Text = await page.locator('h1').innerText();
  expect(h1Text).toContain('Welcome');
});
