/**
 * studio.js - Animations for the 3-column Resume Studio
 * Requires: GSAP
 */
document.addEventListener('DOMContentLoaded', () => {
    const studioLayout = document.querySelector('.studio-layout');
    
    if (studioLayout && typeof gsap !== 'undefined') {
        // Staggered entry of the 3 columns
        const cols = [
            document.querySelector('.studio-sidebar'),
            document.querySelector('.studio-preview'),
            document.querySelector('.studio-ai-panel')
        ];
        
        gsap.fromTo(cols,
            { opacity: 0, y: 20 },
            { opacity: 1, y: 0, duration: 0.8, stagger: 0.15, ease: "power3.out", delay: 0.2 }
        );

        // Resume scale fit
        function scaleResume() {
            const previewContainer = document.querySelector('.studio-preview');
            const paper = document.querySelector('.resume-paper');
            if(previewContainer && paper) {
                // A4 is roughly 794x1123 px at 96 DPI
                const containerWidth = previewContainer.clientWidth - 64; // 32px padding both sides
                const paperWidth = 794; 
                
                if (containerWidth < paperWidth) {
                    const scale = containerWidth / paperWidth;
                    paper.style.transform = `scale(${scale})`;
                } else {
                    paper.style.transform = `scale(1)`;
                }
            }
        }

        window.addEventListener('resize', scaleResume);
        setTimeout(scaleResume, 100);
    }
});
