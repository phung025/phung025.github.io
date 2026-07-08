/**
* Nam Phung - Portfolio Main JS
* Custom implementation with Web Components for reusability
*/

(function() {
  "use strict";

  // Apply saved theme immediately on load to prevent flash
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme === 'dark') {
    document.body.classList.add('dark-theme');
  }

  /**
   * SiteHeader Web Component
   * Handles the Canvas and Navbar across all pages
   */
  class SiteHeader extends HTMLElement {
    connectedCallback() {
      const active = this.getAttribute('active') || '';
      const root = this.getAttribute('root') || '';
      const isDark = document.body.classList.contains('dark-theme');

      this.innerHTML = `
        <canvas id="fractal-canvas" style="position: fixed; top:0; left:0; width:100vw; height:100vh; z-index:-1; opacity:0.15; pointer-events:none;"></canvas>
        <div class="navbar">
          <div class="navbar-brand">NAM PHUNG</div>
          <button class="mobile-nav-toggle">☰</button>
          <div class="nav-links">
            <a href="${root}index.html" class="${active === 'home' ? 'active' : ''}">HOME</a>
            <span>|</span>
            <a href="${root}resume.html" class="${active === 'resume' ? 'active' : ''}">RESUME</a>
            <span>|</span>
            <a href="${root}portfolio.html" class="${active === 'portfolio' ? 'active' : ''}">PORTFOLIO</a>
            <span>|</span>
            <a href="${root}publications.html" class="${active === 'publications' ? 'active' : ''}">PUBLICATIONS</a>
            <span>|</span>
            <a href="https://www.linkedin.com/in/namphung/" target="_blank">LINKEDIN</a>
            <span>|</span>
            <a href="https://github.com/phung025/" target="_blank">GITHUB</a>
            <span>|</span>
            <button id="theme-toggle" class="theme-toggle-btn">[ THEME: ${isDark ? 'DARK' : 'LIGHT'} ]</button>
          </div>
        </div>
      `;

      // Re-initialize fractal tree, mobile toggle, and theme toggle after injection
      initFractalCanvas();
      setupMobileToggle(this);
      setupThemeToggle(this);
    }
  }

  // Define the custom element before any other logic
  if (!customElements.get('site-header')) {
    customElements.define('site-header', SiteHeader);
  }

  /**
   * ChessGame Web Component - Eight Queens Solution Display
   */
  class ChessGame extends HTMLElement {
    connectedCallback() {
      this.innerHTML = `
        <div class="chess-container">
          <div class="chess-board" id="board"></div>
        </div>
      `;
      this.render();
    }

    render() {
      const boardEl = this.querySelector('#board');
      boardEl.innerHTML = '';

      // One valid 8-Queens solution
      const solution = [3, 6, 2, 7, 1, 4, 0, 5]; // Column index for each row

      for (let r = 0; r < 8; r++) {
        for (let c = 0; c < 8; c++) {
          const square = document.createElement('div');
          square.className = `chess-square ${(r + c) % 2 === 0 ? 'light' : 'dark'}`;

          if (solution[r] === c) {
            const pieceEl = document.createElement('div');
            pieceEl.className = 'chess-piece';
            // Fluid font size: 8% of board width, capped at 40px
            pieceEl.style.fontSize = 'min(40px, 8.5vw)';
            pieceEl.classList.add(r % 2 === 0 ? 'piece-primary' : 'piece-secondary');
            pieceEl.style.display = 'flex';
            pieceEl.style.justifyContent = 'center';
            pieceEl.style.alignItems = 'center';
            pieceEl.textContent = '♛';
            square.appendChild(pieceEl);
          }
          boardEl.appendChild(square);
        }
      }
    }
  }

  if (!customElements.get('chess-game')) {
    customElements.define('chess-game', ChessGame);
  }
  const select = (el, all = false) => {
    el = el.trim()
    if (all) {
      return [...document.querySelectorAll(el)]
    } else {
      return document.querySelector(el)
    }
  }

  /**
   * Easy event listener function
   */
  const on = (type, el, listener, all = false) => {
    let selectEl = select(el, all)

    if (selectEl) {
      if (all) {
        selectEl.forEach(e => e.addEventListener(type, listener))
      } else {
        selectEl.addEventListener(type, listener)
      }
    }
  }

  /**
   * Porfolio isotope and filter
   */
  window.addEventListener('load', () => {
    let portfolioContainer = select('.portfolio-container');
    if (portfolioContainer) {
      let portfolioIsotope = new Isotope(portfolioContainer, {
        itemSelector: '.portfolio-item',
        layoutMode: 'fitRows'
      });

      let portfolioFilters = select('#portfolio-flters li', true);

      on('click', '#portfolio-flters li', function(e) {
        e.preventDefault();
        portfolioFilters.forEach(function(el) {
          el.classList.remove('filter-active');
        });
        this.classList.add('filter-active');

        portfolioIsotope.arrange({
          filter: this.getAttribute('data-filter')
        });
      }, true);
    }
  });

  /**
   * Initiate portfolio lightbox
   */
  if (typeof GLightbox !== 'undefined') {
    GLightbox({
      selector: '.portfolio-lightbox'
    });

    GLightbox({
      selector: '.portfolio-details-lightbox',
      width: '90%',
      height: '90vh'
    });
  }

  /**
   * Portfolio details slider
   */
  if (select('.portfolio-details-slider')) {
    new Swiper('.portfolio-details-slider', {
      speed: 400,
      loop: true,
      autoplay: {
        delay: 5000,
        disableOnInteraction: false
      },
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true
      }
    });
  }

  /**
   * Neural Network / Universe Background
   */
  function drawNeuralNetwork(ctx, width, height) {
    ctx.clearRect(0, 0, width, height);

    const isMobile = window.innerWidth <= 991;
    // High density node count
    const nodeCount = isMobile ? 150 : 350;
    const connectionDist = isMobile ? 100 : 180;
    const nodes = [];

    const isDark = document.body.classList.contains('dark-theme');
    const primaryAccent = isDark ? '#80C148' : '#7a0019';
    const secondaryAccent = isDark ? '#59A9FF' : '#ffcc33';
    const palette = [primaryAccent, secondaryAccent];

    // Generate random nodes
    for (let i = 0; i < nodeCount; i++) {
      nodes.push({
        x: Math.random() * width,
        y: Math.random() * height,
        size: Math.random() * (isMobile ? 2 : 3.5) + 1,
        color: palette[Math.floor(Math.random() * palette.length)]
      });
    }

    // Draw connections (edges)
    for (let i = 0; i < nodes.length; i++) {
      for (let j = i + 1; j < nodes.length; j++) {
        const dx = nodes[i].x - nodes[j].x;
        const dy = nodes[i].y - nodes[j].y;
        const distSq = dx * dx + dy * dy;

        if (distSq < connectionDist * connectionDist) {
          const dist = Math.sqrt(distSq);
          ctx.beginPath();
          ctx.moveTo(nodes[i].x, nodes[i].y);
          ctx.lineTo(nodes[j].x, nodes[j].y);

          // High-vibrance alpha
          const alpha = 1 - (dist / connectionDist);
          ctx.globalAlpha = alpha * 0.6; // Significantly more vibrant
          ctx.lineWidth = 1.5; // Sharper, thicker lines

          ctx.strokeStyle = Math.random() > 0.5 ? primaryAccent : secondaryAccent;
          ctx.stroke();
        }
      }
    }

    // Draw nodes
    for (let i = 0; i < nodes.length; i++) {
      const node = nodes[i];

      // Intense glow
      ctx.globalAlpha = 0.25;
      ctx.beginPath();
      ctx.arc(node.x, node.y, node.size * 2.5, 0, Math.PI * 2);
      ctx.fillStyle = node.color;
      ctx.fill();

      // Opaque, sharp core
      ctx.globalAlpha = 1.0; // Max vibrance
      ctx.beginPath();
      ctx.arc(node.x, node.y, node.size, 0, Math.PI * 2);
      ctx.fillStyle = node.color;
      ctx.fill();
    }

    ctx.globalAlpha = 1.0;
  }

  function initFractalCanvas() {
    const canvas = document.getElementById("fractal-canvas");
    if (!canvas) return;
    const ctx = canvas.getContext("2d");

    const resize = () => {
      const dpr = window.devicePixelRatio || 1;
      canvas.width = window.innerWidth * dpr;
      canvas.height = window.innerHeight * dpr;
      canvas.style.width = `${window.innerWidth}px`;
      canvas.style.height = `${window.innerHeight}px`;
      ctx.scale(dpr, dpr);
      drawNeuralNetwork(ctx, window.innerWidth, window.innerHeight);
    };

    window.addEventListener("resize", resize);
    resize();
  }

  /**
   * Mobile nav toggle functionality
   */
  function setupMobileToggle(container) {
    const mobileNavToggle = container.querySelector('.mobile-nav-toggle');
    const navLinks = container.querySelector('.nav-links');

    if (mobileNavToggle) {
      mobileNavToggle.addEventListener('click', function(e) {
        e.stopPropagation();
        navLinks.classList.toggle('nav-active');
        this.textContent = navLinks.classList.contains('nav-active') ? '✕' : '☰';
      });
    }

    document.addEventListener('click', function(e) {
      if (navLinks && navLinks.classList.contains('nav-active') && !navLinks.contains(e.target) && !mobileNavToggle.contains(e.target)) {
        navLinks.classList.remove('nav-active');
        mobileNavToggle.textContent = '☰';
      }
    });
  }

  /**
   * Theme switcher functionality
   */
  function setupThemeToggle(container) {
    const btn = container.querySelector('#theme-toggle');
    if (!btn) return;
    btn.addEventListener('click', function() {
      const isDark = document.body.classList.toggle('dark-theme');
      localStorage.setItem('theme', isDark ? 'dark' : 'light');
      btn.textContent = `[ THEME: ${isDark ? 'DARK' : 'LIGHT'} ]`;
      
      // Update fractal tree background colors dynamically
      const canvas = document.getElementById("fractal-canvas");
      if (canvas) {
        const ctx = canvas.getContext("2d");
        drawNeuralNetwork(ctx, window.innerWidth, window.innerHeight);
      }
    });
  }

})()
