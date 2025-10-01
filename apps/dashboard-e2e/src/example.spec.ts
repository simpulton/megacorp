import { test, expect } from '@playwright/test';

test('has title', async ({ page }) => {
  await page.goto('/');

  // Debug: Log the page content
  const pageContent = await page.content();
  console.log('Page content:', pageContent.substring(0, 500));
  
  // Wait for the page to load and the h1 element to be visible
  await page.waitForSelector('h1', { timeout: 10000 });
  
  // Debug: Log all h1 elements
  const h1Elements = await page.locator('h1').all();
  console.log('Found h1 elements:', h1Elements.length);
  
  // Expect h1 to contain a substring.
  const h1Text = await page.locator('h1').innerText();
  console.log('H1 text:', h1Text);
  expect(h1Text).toContain('Welcome');
});
