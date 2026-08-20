/**
 * text.js - Text split animations
 * Requires: SplitType (CDN), GSAP
 */
document.addEventListener('DOMContentLoaded', () => {
    if (typeof SplitType !== 'undefined' && typeof gsap !== 'undefined') {
        
        const textElements = document.querySelectorAll('[data-animation="split-text"]');
        
        textElements.forEach(el => {
            const text = new SplitType(el, { types: 'words, chars' });
            
            gsap.from(text.chars, {
                opacity: 0,
                y: 20,
                rotateX: -90,
                stagger: 0.02,
                duration: 0.8,
                ease: "power3.out",
                scrollTrigger: {
                    trigger: el,
                    start: "top 90%",
                }
            });
        });
    }
});
