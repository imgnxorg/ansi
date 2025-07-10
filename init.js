"use strict";

console.log("Initializing ANSI color swatches...");

// Function to convert RGB to HSL
function rgbToHsl(r, g, b) {
  // Normalize RGB values to the range of 0 to 1
  r /= 255;
  g /= 255;
  b /= 255;

  const max = Math.max(r, g, b);
  const min = Math.min(r, g, b);
  const delta = max - min;

  let h = 0;
  let s = 0;
  const l = (max + min) / 2;

  if (delta !== 0) {
    s = l > 0.5 ? delta / (2 - max - min) : delta / (max + min);

    if (max === r) {
      h = (g - b) / delta + (g < b ? 6 : 0);
    } else if (max === g) {
      h = (b - r) / delta + 2;
    } else {
      h = (r - g) / delta + 4;
    }
    h /= 6;
  }

  // Convert hue to degrees
  h = Math.round(h * 360);
  s = Math.round(s * 100);
  l = Math.round(l * 100);

  return `HSL(${h}, ${s}%, ${l}%)`;
}

// ANSI color codes (RGB values)
const colorCodes = [
  { r: 255, g: 0, b: 0 }, // Red
  { r: 0, g: 255, b: 0 }, // Green
  { r: 0, g: 0, b: 255 }, // Blue
  { r: 255, g: 255, b: 0 }, // Yellow
  { r: 0, g: 255, b: 255 }, // Cyan
  { r: 255, g: 0, b: 255 }, // Magenta
];

// Function to print the color swatches to the DOM
function printColorSwatches() {
  const container = document.getElementById("colorSwatches");

  colorCodes.forEach(({ r, g, b }) => {
    const hsl = rgbToHsl(r, g, b);
    const colorHex = `rgb(${r}, ${g}, ${b})`;

    // Create a swatch div element
    const swatchDiv = document.createElement("div");
    swatchDiv.classList.add("swatch");
    swatchDiv.style.backgroundColor = `rgb(${r}, ${g}, ${b})`;

    // Add text content to the swatch
    swatchDiv.textContent = `${colorHex} -> ${hsl}`;

    // Append the swatch div to the container
    container.appendChild(swatchDiv);
  });
}

// Run the function to display the color swatches
printColorSwatches();
