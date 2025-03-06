import { Given, When, Then } from "@cucumber/cucumber";
import { pageFixture } from "./hooks/browserContextFixture";
import { expect } from '@playwright/test';

let alertText: string;

Given('I navigate to the WebdriverUniversity login page', async () => {
    await pageFixture.page.goto("https://www.webdriveruniversity.com/Login-Portal/index.html")
});

When('I type a username {word}', async (username: string) => {
    //Go to website, and use inspect to check the code of Username textbox, in code it's placeholder="Username"
    await pageFixture.page.getByPlaceholder("Username").fill(username);
});

When('I type a password {word}', async (password: string) => {
    await pageFixture.page.getByPlaceholder("Password").fill(password);

});

When('I click on the login button', async () => {
    // Alert pop-up like validation successfull or validation failed
    await pageFixture.page.on("dialog", async (alert) => {
        alertText = alert.message();
        // console.log(alertText);
        await alert.accept();
    })

    //login-button
    const loginButton = await pageFixture.page.locator("#login-button");
    await loginButton.hover();
    await loginButton.click({force: true });
    // await pageFixture.page.waitForTimeout(2000);    
});

Then('I should be presented with an alert box which contains text {string}', async (expectedAlertText: string) => {
    expect(alertText).toBe(expectedAlertText);
});