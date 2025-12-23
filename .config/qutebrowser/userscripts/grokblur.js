#!/usr/bin/env node
// ==UserScript==
// @name        Anti-Blur for Grok AI's Image Generator
// @name:fr        Anti-Flou pour le Générateur d'Image de l'IA de Grok
// @namespace   Violentmonkey Scripts
// @match       https://grok.com/
// @license     MIT License
// @grant       none
// @version     1.0
// @author      AntoineGenvintroy
// @description:en Removes any blurring from Grok's AI when generating an image. More precisely, it permanently removes all instances of "filter: blur(70px) contrast(2);" applied to page elements.
// @description:fr Supprime tout flou causé par l'IA de Grok lors de la génération d'une image. Plus précisément, supprime définitivement toutes les instances de « filter: blur(70px) contrast(2); » appliquées aux éléments de la page.
// @description Removes any blurring from Grok's AI when generating an image. More precisely, it permanently removes all instances of "filter: blur(70px) contrast(2);" applied to page elements.
// ==/UserScript==

// Function to clean an element of this specific filter
function removeSpecificFilter(el) {
  const computed = window.getComputedStyle(el);
  if (computed.filter === 'blur(70px) contrast(2)') {
    el.style.filter = 'none';
  }
  // Sometimes the filter is defined inline (in style), so we can also remove it directly if detected
  if (el.style && el.style.filter === 'blur(70px) contrast(2)') {
    el.style.filter = 'none';
  }
}

// Recursive function to process the entire DOM
function cleanAllElements() {
  document.querySelectorAll('*').forEach(removeSpecificFilter);
}

// Observe changes in the DOM
const observer = new MutationObserver((mutations) => {
  for (const mutation of mutations) {
    if (mutation.type === 'attributes' && mutation.attributeName === 'style') {
      removeSpecificFilter(mutation.target);
    }
    if (mutation.type === 'childList') {
      mutation.addedNodes.forEach(node => {
        if (node.nodeType === 1) { // élément HTML
          removeSpecificFilter(node);
          node.querySelectorAll('*').forEach(removeSpecificFilter);
        }
      });
    }
  }
});

// Observation options
observer.observe(document.documentElement, {
  attributes: true,
  subtree: true,
  childList: true,
  attributeFilter: ['style']
});

// Initial cleaning
cleanAllElements();

// Optional: cleaning every 500ms in addition to observing it (reinforcement)
setInterval(cleanAllElements, 500);
