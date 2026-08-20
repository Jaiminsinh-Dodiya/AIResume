/**
 * scroll.js - Lenis Smooth Scroll and ScrollTrigger init
 * Requires: Lenis, GSAP, ScrollTrigger (CDN)
 */

document.addEventListener('DOMContentLoaded', () => {
    if (typeof Lenis !== 'undefined') {
        const lenis = new Lenis({
            duration: 1.2,
            easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)), 
            direction: 'vertical',
            gestureDirection: 'vertical',
            smooth: true,
            mouseMultiplier: 1,
            smoothTouch: false,
            touchMultiplier: 2,
        });

        function raf(time) {
            lenis.raf(time);
            requestAnimationFrame(raf);
        }

        requestAnimationFrame(raf);

        // Sync with GSAP ScrollTrigger
        if (typeof gsap !== 'undefined' && typeof ScrollTrigger !== 'undefined') {
            lenis.on('scroll', ScrollTrigger.update);
            gsap.ticker.add((time)=>{
                lenis.raf(time * 1000);
            });
            gsap.ticker.lagSmoothing(0, 0);
        }
    }
});
