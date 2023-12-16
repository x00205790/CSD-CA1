const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  // Navigate to your webpage
  await page.goto('http://cdillon-bpcalc-staging.northeurope.azurecontainer.io/');

  // Fill in the systolic and diastolic values
  await page.type('#BP_Systolic', '140');
  await page.type('#BP_Diastolic', '85');

  // Click the submit button
  await page.click('input[type="submit"]');

  // Wait for the result to be displayed
  await page.waitForSelector('.form-group');

  // Get the displayed result
  const result = await page.$eval('.form-group', (el) => el.innerText);

  // Check if the result is as expected
  if (result === 'Pre-High Blood Pressure') {
    console.log('Test Passed: Pre-High Blood Pressure displayed');
  } else {
    console.log('Test Failed: Unexpected result -', result);
  }

  // Close the browser
  await browser.close();
})();
