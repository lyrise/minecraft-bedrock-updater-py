import asyncio
import re

import requests
from playwright.async_api import async_playwright


async def run():
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=False)
        page = await browser.new_page()

        await page.goto("https://www.minecraft.net/ja-jp/download/server/bedrock")

        url = await page.get_attribute(
            'a.downloadlink[data-platform="serverBedrockLinux"]', "href"
        )
        print("URL:", url)

        await browser.close()

        match = re.search(r"bedrock-server-(\d+\.\d+\.\d+\.\d+)", url)
        version = match.group(1)
        print("version:", version)

        res = requests.get(url)
        with open("bedrock.zip", "wb") as file:
            file.write(res.content)


asyncio.run(run())
