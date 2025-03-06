import { Given, When } from "@cucumber/cucumber";
import { pageFixture } from "./hooks/browserContextFixture";

When('I switch to the new browser tab', async () => {
    await pageFixture.context.waitForEvent("page"); //reintialise the page > new tab > page

    //Retrieve all current open pages (tabs)
    const allPage = await pageFixture.context.pages();

    //Assign the most recent tab to pageFixture.page
    pageFixture.page = allPage[allPage.length - 1];

    //Bring the newly assigned tab to the front (make it active)
    await pageFixture.page.bringToFront();

    //Ensure the newly assigned tab is also fully maximised
    await pageFixture.page.setViewportSize({ width: 1519, height: 791 });
})

Given('I wait for {int} seconds', async (seconds: number) => {
    await pageFixture.page.waitForTimeout(seconds * 1000);
})