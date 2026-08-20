/**
 * cards.js - Glass card animations
 * Requires: GSAP, ScrollTrigger
 */
document.addEventListener('DOMContentLoaded', () => {
    if (typeof gsap !== 'undefined' && typeof ScrollTrigger !== 'undefined') {
        const fadeUpCards = document.querySelectorAll('[data-animation="fade-up"]');
        
        fadeUpCards.forEach((card, i) => {
            gsap.fromTo(card, 
                { opacity: 0, y: 40 },
                { 
                    opacity: 1, 
                    y: 0, 
                    duration: 0.8, 
                    ease: "power2.out",
                    scrollTrigger: {
                        trigger: card,
                        start: "top 85%",
                        toggleActions: "play none none reverse"
                    }
                }
            );
        });

        // Hover 3D effect on specific cards
        const tiltCards = document.querySelectorAll('[data-animation="tilt"]');
        tiltCards.forEach(card => {
            card.addEventListener('mousemove', (e) => {
                const rect = card.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;
                
                const centerX = rect.width / 2;
                const centerY = rect.height / 2;
                
                const rotateX = ((y - centerY) / centerY) * -5;
                const rotateY = ((x - centerX) / centerX) * 5;
                
                gsap.to(card, {
                    rotateX: rotateX,
                    rotateY: rotateY,
                    transformPerspective: 1000,
                    ease: "power1.out",
                    duration: 0.5
                });
            });
            
            card.addEventListener('mouseleave', () => {
                gsap.to(card, {
                    rotateX: 0,
                    rotateY: 0,
                    ease: "elastic.out(1, 0.3)",
                    duration: 1
                });
            });
        });
    }
});
