/**
 * theme.js - Future proof theme manager
 */
const ThemeManager = {
    init() {
        this.applyTheme(this.getSavedTheme() || 'dark');
    },
    
    setTheme(themeName) {
        localStorage.setItem('app-theme', themeName);
        this.applyTheme(themeName);
    },
    
    getSavedTheme() {
        return localStorage.getItem('app-theme');
    },
    
    applyTheme(themeName) {
        document.documentElement.setAttribute('data-theme', themeName);
        // Dispatch event for other components if needed
        window.dispatchEvent(new CustomEvent('themeChanged', { detail: themeName }));
    }
};

document.addEventListener('DOMContentLoaded', () => {
    ThemeManager.init();
});
