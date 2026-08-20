/**
 * cursor.js - Interactive glowing cursor
 * Requires: GSAP
 */
document.addEventListener('DOMContentLoaded', () => {
    if (typeof gsap !== 'undefined' && window.innerWidth > 768) {
        
        // Create cursor elements dynamically
        const cursorDot = document.createElement('div');
        cursorDot.classList.add('cursor-dot');
        
        const cursorGlow = document.createElement('div');
        cursorGlow.classList.add('cursor-glow');
        
        document.body.appendChild(cursorDot);
        document.body.appendChild(cursorGlow);
        
        // Basic Styles for cursor (injected via JS to keep it grouped, or could be in CSS)
        Object.assign(cursorDot.style, {
            position: 'fixed',
            top: 0, left: 0,
            width: '8px', height: '8px',
            backgroundColor: 'var(--primary)',
            borderRadius: '50%',
            pointerEvents: 'none',
            zIndex: 'var(--z-cursor)',
            transform: 'translate(-50%, -50%)',
            mixBlendMode: 'screen'
        });
        
        Object.assign(cursorGlow.style, {
            position: 'fixed',
            top: 0, left: 0,
            width: '400px', height: '400px',
            background: 'radial-gradient(circle, rgba(124, 58, 237, 0.15) 0%, transparent 70%)',
            borderRadius: '50%',
            pointerEvents: 'none',
            zIndex: '0', // Keep it behind text
            transform: 'translate(-50%, -50%)'
        });

        // Mouse tracking
        let mouseX = 0, mouseY = 0;
        
        window.addEventListener('mousemove', (e) => {
            mouseX = e.clientX;
            mouseY = e.clientY;
            
            // Fast follow for dot
            gsap.to(cursorDot, { x: mouseX, y: mouseY, duration: 0.1 });
            
            // Slow follow for glow
            gsap.to(cursorGlow, { x: mouseX, y: mouseY, duration: 0.5, ease: "power2.out" });
        });
        
        // Hover states
        const interactables = document.querySelectorAll('a, button, input, [data-cursor="pointer"]');
        interactables.forEach(el => {
            el.addEventListener('mouseenter', () => {
                gsap.to(cursorDot, { scale: 3, backgroundColor: 'var(--accent)', duration: 0.2 });
            });
            el.addEventListener('mouseleave', () => {
                gsap.to(cursorDot, { scale: 1, backgroundColor: 'var(--primary)', duration: 0.2 });
            });
        });
    }
});
