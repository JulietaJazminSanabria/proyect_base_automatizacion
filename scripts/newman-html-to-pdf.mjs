import { chromium } from "@playwright/test";
import path from "node:path";
import { pathToFileURL } from "node:url";

const [inputPath, outputPath] = process.argv.slice(2);

if (!inputPath || !outputPath) {
  console.error(
    "Uso: node scripts/newman-html-to-pdf.mjs <reporte.html> <reporte.pdf>",
  );
  process.exit(1);
}

const browser = await chromium.launch();
try {
  const page = await browser.newPage();
  await page.goto(pathToFileURL(path.resolve(inputPath)).href, {
    waitUntil: "networkidle",
  });
  await page.pdf({
    path: path.resolve(outputPath),
    format: "A4",
    printBackground: true,
    margin: { top: "10mm", bottom: "10mm", left: "10mm", right: "10mm" },
  });
} finally {
  await browser.close();
}

console.log(`PDF generado: ${outputPath}`);
