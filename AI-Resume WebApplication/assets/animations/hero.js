/**
 * hero.js - Landing page hero animations
 * Requires: GSAP
 */
document.addEventListener('DOMContentLoaded', () => {
    if (typeof gsap !== 'undefined') {
        const heroTitle = document.querySelector('.hero-title');
        const heroSubtitle = document.querySelector('.hero-subtitle');
        const heroBtns = document.querySelectorAll('.hero-section .btn');
        
        const tl = gsap.timeline();
        
        if (heroTitle) {
            tl.fromTo(heroTitle, 
                { opacity: 0, y: 30 }, 
                { opacity: 1, y: 0, duration: 1, ease: "power3.out" }
            );
        }
        
        if (heroSubtitle) {
            tl.fromTo(heroSubtitle, 
                { opacity: 0, y: 20 }, 
                { opacity: 1, y: 0, duration: 0.8, ease: "power3.out" }, 
                "-=0.6"
            );
        }
        
        if (heroBtns.length > 0) {
            tl.fromTo(heroBtns, 
                { opacity: 0, y: 20 }, 
                { opacity: 1, y: 0, duration: 0.6, stagger: 0.1, ease: "power3.out" }, 
                "-=0.4"
            );
        }
    }
});
