/**
 * components.js - Logic for reusable HTML components
 * Uses data-attributes heavily.
 */

document.addEventListener('DOMContentLoaded', () => {

    // --- Sidebar Toggle ---
    const sidebarToggles = document.querySelectorAll('[data-action="toggle-sidebar"]');
    sidebarToggles.forEach(toggle => {
        toggle.addEventListener('click', () => {
            const sidebarId = toggle.getAttribute('data-target');
            const sidebar = document.getElementById(sidebarId);
            if (sidebar) {
                if (window.innerWidth > 1024) {
                    sidebar.classList.toggle('collapsed');
                } else {
                    sidebar.classList.toggle('mobile-open');
                }
            }
        });
    });

    // --- Modals ---
    const modalTriggers = document.querySelectorAll('[data-action="open-modal"]');
    const modalCloses = document.querySelectorAll('[data-action="close-modal"]');
    const overlays = document.querySelectorAll('.modal-overlay');

    modalTriggers.forEach(trigger => {
        trigger.addEventListener('click', (e) => {
            e.preventDefault();
            const targetId = trigger.getAttribute('data-target');
            const modal = document.getElementById(targetId);
            if (modal) modal.classList.add('active');
        });
    });

    modalCloses.forEach(btn => {
        btn.addEventListener('click', (e) => {
            e.preventDefault();
            const modal = btn.closest('.modal-overlay');
            if (modal) modal.classList.remove('active');
        });
    });

    overlays.forEach(overlay => {
        overlay.addEventListener('click', (e) => {
            if (e.target === overlay) {
                overlay.classList.remove('active');
            }
        });
    });

    // --- Tabs ---
    const tabItems = document.querySelectorAll('.tab-item');
    tabItems.forEach(tab => {
        tab.addEventListener('click', () => {
            const targetId = tab.getAttribute('data-target');
            if(!targetId) return;

            const tabsContainer = tab.closest('.tabs');
            if(!tabsContainer) return;

            // Remove active from peers
            tabsContainer.querySelectorAll('.tab-item').forEach(t => t.classList.remove('active'));
            tab.classList.add('active');

            // Handle content
            const contentContainer = tabsContainer.nextElementSibling;
            if(contentContainer && contentContainer.classList.contains('tab-content-wrapper')) {
                contentContainer.querySelectorAll('.tab-content').forEach(c => c.classList.remove('active'));
                const targetContent = document.getElementById(targetId);
                if(targetContent) targetContent.classList.add('active');
            }
        });
    });

});
