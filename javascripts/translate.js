// javascripts/translate.js
// Chelan County Translator Implementation for Ohme Gardens
// Builds the "English" utility dropdown's language list from /data/languages.json
// Self-contained, zero external CDN dependencies, fully accessible (WCAG 2.1 AA)

(function () {
  let isLoaded = false;

  function initTranslate() {
    const listElements = document.querySelectorAll(".translate-listbox");
    if (!listElements.length || isLoaded) return;

    fetch("/data/languages.json")
      .then((res) => {
        if (!res.ok) throw new Error(`${res.status} ${res.statusText}`);
        return res.json();
      })
      .then((data) => {
        isLoaded = true;
        const currentUrl = window.location.href.startsWith("http") 
          ? window.location.href 
          : "https://www.ohmegardens.org/";
        
        const linkFor = (code) => {
          if (code === "en") return "/";
          return `https://translate.google.com/translate?sl=auto&tl=${encodeURIComponent(code)}&u=${encodeURIComponent(currentUrl)}`;
        };

        const itemHtml = ({ code, label }) => `
          <li>
            <a class="dropdown-item translate-item" href="${linkFor(code)}" ${code !== 'en' ? 'target="_blank" rel="noopener noreferrer"' : ''} aria-label="${label} ${code !== 'en' ? '(opens in a new tab)' : ''}">${label}</a>
          </li>`;

        const pinnedHtml = (data.pinned || []).map(itemHtml).join("");
        const dividerHtml = `<li><hr class="dropdown-divider my-1"></li>`;
        const restHtml = (data.all || []).map(itemHtml).join("");
        const fullContent = pinnedHtml + dividerHtml + restHtml;

        listElements.forEach((el) => {
          el.innerHTML = fullContent;
        });
      })
      .catch((err) => {
        console.error("Could not load languages.json:", err);
        listElements.forEach((el) => {
          el.innerHTML = `
            <li><a class="dropdown-item" href="https://translate.google.com/translate?sl=auto&tl=es&u=https://www.ohmegardens.org" target="_blank" rel="noopener noreferrer">Spanish (Espa&ntilde;ol)</a></li>
            <li><a class="dropdown-item" href="https://translate.google.com/translate?sl=auto&tl=fr&u=https://www.ohmegardens.org" target="_blank" rel="noopener noreferrer">French (Fran&ccedil;ais)</a></li>
          `;
        });
      });
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", initTranslate);
  } else {
    initTranslate();
  }
})();

