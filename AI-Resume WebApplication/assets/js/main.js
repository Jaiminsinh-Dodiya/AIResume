/* ==========================================
   ResumeAI Vanilla JavaScript Core Engine
   ========================================== */

document.addEventListener('DOMContentLoaded', () => {
  initNavbarScroll();
  initTabSwitchers();
  initFaqAccordions();
  initZoomControls();
  initSidebarToggle();
  initLiveResumeSync();
  initCategoryFilters();
});

/* 1. Navbar Scroll Effect */
function initNavbarScroll() {
  const navbar = document.querySelector('.navbar');
  if (!navbar) return;

  window.addEventListener('scroll', () => {
    if (window.scrollY > 20) {
      navbar.classList.add('scrolled');
    } else {
      navbar.classList.remove('scrolled');
    }
  });
}

/* 2. Generic Tab Switching Engine */
function initTabSwitchers() {
  const tabGroups = document.querySelectorAll('[data-tabs]');
  
  tabGroups.forEach(group => {
    const tabButtons = group.querySelectorAll('.tab-btn, [data-tab-target]');
    const groupName = group.getAttribute('data-tabs');
    const tabPanels = document.querySelectorAll(`[data-tab-group="${groupName}"] .tab-panel, [data-tab-content="${groupName}"]`);

    tabButtons.forEach(btn => {
      btn.addEventListener('click', (e) => {
        e.preventDefault();
        const targetId = btn.getAttribute('data-tab-target') || btn.getAttribute('href')?.replace('#', '');
        
        tabButtons.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');

        tabPanels.forEach(panel => {
          if (panel.id === targetId || panel.getAttribute('data-panel') === targetId) {
            panel.classList.add('active');
          } else {
            panel.classList.remove('active');
          }
        });
      });
    });
  });
}

/* 3. FAQ Accordion Engine */
function initFaqAccordions() {
  const faqItems = document.querySelectorAll('.faq-item');

  faqItems.forEach(item => {
    const header = item.querySelector('.faq-question');
    if (!header) return;

    header.addEventListener('click', () => {
      const isOpen = item.classList.contains('active');
      faqItems.forEach(i => i.classList.remove('active'));
      if (!isOpen) {
        item.classList.add('active');
      }
    });
  });
}

/* 4. Document Viewer Zoom Control Engine */
function initZoomControls() {
  const doc = document.getElementById('resumeDoc');
  const zoomInBtn = document.getElementById('zoomIn');
  const zoomOutBtn = document.getElementById('zoomOut');
  const zoomResetBtn = document.getElementById('zoomReset');
  const zoomLabel = document.getElementById('zoomVal');

  if (!doc) return;

  let currentScale = 1.0;

  function updateZoom(newScale) {
    currentScale = Math.min(Math.max(newScale, 0.5), 1.5);
    doc.style.transform = `scale(${currentScale})`;
    if (zoomLabel) {
      zoomLabel.textContent = `${Math.round(currentScale * 100)}%`;
    }
  }

  if (zoomInBtn) zoomInBtn.addEventListener('click', () => updateZoom(currentScale + 0.1));
  if (zoomOutBtn) zoomOutBtn.addEventListener('click', () => updateZoom(currentScale - 0.1));
  if (zoomResetBtn) zoomResetBtn.addEventListener('click', () => updateZoom(1.0));
}

/* 5. Mobile Sidebar Toggle Engine */
function initSidebarToggle() {
  const toggleBtn = document.getElementById('sidebarToggle');
  const sidebar = document.querySelector('.sidebar');

  if (!toggleBtn || !sidebar) return;

  toggleBtn.addEventListener('click', () => {
    sidebar.classList.toggle('open');
  });
}

/* 6. Live Resume Builder Field Synchronization */
function initLiveResumeSync() {
  const nameInput = document.getElementById('inputFullName');
  const titleInput = document.getElementById('inputTargetTitle');
  const emailInput = document.getElementById('inputEmail');
  const phoneInput = document.getElementById('inputPhone');
  const summaryInput = document.getElementById('inputSummary');

  const prevName = document.getElementById('previewFullName');
  const prevTitle = document.getElementById('previewTargetTitle');
  const prevEmail = document.getElementById('previewEmail');
  const prevPhone = document.getElementById('previewPhone');
  const prevSummary = document.getElementById('previewSummary');

  if (nameInput && prevName) {
    nameInput.addEventListener('input', (e) => prevName.textContent = e.target.value || 'Alexander Wright');
  }
  if (titleInput && prevTitle) {
    titleInput.addEventListener('input', (e) => prevTitle.textContent = e.target.value || 'Senior Principal Software Engineer');
  }
  if (emailInput && prevEmail) {
    emailInput.addEventListener('input', (e) => prevEmail.textContent = e.target.value || 'alexander.wright@tech.io');
  }
  if (phoneInput && prevPhone) {
    phoneInput.addEventListener('input', (e) => prevPhone.textContent = e.target.value || '+1 (555) 234-5678');
  }
  if (summaryInput && prevSummary) {
    summaryInput.addEventListener('input', (e) => prevSummary.textContent = e.target.value || 'Results-driven Senior Engineer with 8+ years experience scaling high-concurrency systems...');
  }
}

/* 7. Category Filter Engine for Templates */
function initCategoryFilters() {
  const filterBtns = document.querySelectorAll('[data-filter]');
  const cards = document.querySelectorAll('[data-category]');

  if (!filterBtns.length) return;

  filterBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      const category = btn.getAttribute('data-filter');

      filterBtns.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      cards.forEach(card => {
        const itemCat = card.getAttribute('data-category');
        if (category === 'all' || itemCat === category) {
          card.style.display = 'block';
        } else {
          card.style.display = 'none';
        }
      });
    });
  });
}
