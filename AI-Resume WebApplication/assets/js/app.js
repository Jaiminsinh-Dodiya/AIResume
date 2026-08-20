/**
 * app.js - Core Initialization
 * Requires: Lucide (CDN)
 */

document.addEventListener('DOMContentLoaded', () => {
    // Initialize Lucide Icons
    if (typeof lucide !== 'undefined') {
        lucide.createIcons();
    } else {
        console.warn("Lucide icons not loaded.");
    }
});
