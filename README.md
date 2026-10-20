# OhmeGardens.org

Official website for **Ohme Gardens**, Chelan County, Washington.

Built with **CFWheels (ColdFusion on Wheels)**, following idiomatic MVC architecture (`/[controller]/page/[key]`), modern **Bootstrap 5.3**, and strict **WCAG 2.1 AA / Level AAA** accessibility standards.

---

## Key Features

- **Pure CFWheels MVC Architecture:** Clean separation of concerns with dedicated section controllers (`Home.cfc`, `Thegardens.cfc`, `Planyourvisit.cfc`, `Events.cfc`, `Planyourspecialevent.cfc`, `Getinvolved.cfc`, `Contacts.cfc`, `Legal.cfc`) extending a unified base controller.
- **Dynamic CMS Navigation:** Seamlessly integrates with the Chelan County CMSAdmin navigation system (`dbo.navigation_menus` / `dbo.navigation_menu_items`).
- **Interactive Illustrated Trail Map:** Vector-based illustrated trail map grounded in the authentic Ohme Gardens topography (1 mile of stone paths, 53 stone benches, 7 pools, 4 waterfalls, 11 destinations).
- **Zero External CDN Policy:** All fonts (Playfair Display, Raleway, Montserrat, FontAwesome), CSS, and JavaScript libraries are 100% locally hosted.
- **Full WCAG 2.1 AA Compliance:** High-contrast palette (exceeding Level AAA ratios up to 11.28:1), keyboard-accessible navigation with visible focus indicators, skip-to-content links, and semantic ARIA landmarks.
- **Offline Fallbacks & Resilient Routing:** Dual slug resolution (handles single and double-hyphen legacy URLs) and graceful 404 handlers.

---

## Directory Structure

```
OhmeGardens.org/
├── .env.example                      # Template for local environment variables
├── .gitignore                        # Git ignore rules (secrets, caches, logs)
├── Application.cfc                   # CFWheels front controller & engine mapping
├── index.cfm                         # Front controller entrypoint
├── robots.txt                        # Production search engine rules
├── sitemap.xml                       # Production XML sitemap
├── web.config                        # IIS URL rewrite rules
├── app/
│   ├── controllers/                  # CFWheels MVC controllers
│   ├── models/                       # Data models (Page, NavigationMenu, etc.)
│   ├── views/                        # Conventional views & layout templates
│   ├── events/                       # ColdFusion lifecycle event handlers
│   └── global/                       # Global helpers & functions
├── config/
│   ├── routes.cfm                    # CFWheels route definitions
│   └── settings.cfm                  # Framework and datasource configuration
├── data/                             # Runtime data (languages.json)
├── docs/                             # Architecture findings & cutover checklists
├── documents/                        # Downloadable PDF assets & brochures
├── fonts/                            # Locally hosted WOFF2 / TTF web fonts
├── images/                           # High-res photography & SVG assets
├── javascripts/                      # Local scripts (Bootstrap 5, garden map)
├── stylesheets/                      # Local stylesheets & WCAG custom rules
├── tests/                            # Automated test & WCAG verification suites
└── vendor/                           # CFWheels core framework
```

---

## Getting Started

### Prerequisites
- Adobe ColdFusion 2021+ or Lucee 5/6+
- Microsoft IIS with URL Rewrite Module 2.0+
- Microsoft SQL Server with `ChelanCountyWebsite` database

### Installation
1. Clone this repository into your web root (e.g. `C:\inetpub\OhmeGardens.org`):
   ```bash
   git clone https://github.com/chelancountyit/OhmeGardens.org.git
   ```
2. Copy `.env.example` to `.env` and configure your local settings:
   ```bash
   cp .env.example .env
   ```
3. Configure your IIS website binding to point to the cloned directory.
4. Verify the application by running the automated test suite:
   ```bash
   node tests/verify-bootstrap-wcag.js
   node tests/audit-wcag-full.js
   ```

---

## Testing & Quality Assurance

Run the automated test suite from the project root:

```bash
# Verify route responsiveness, Bootstrap 5 integration & landmarks
node tests/verify-bootstrap-wcag.js

# Run full WCAG 2.1 AA accessibility audit across all sections
node tests/audit-wcag-full.js

# Test color contrast ratios against Level AAA requirements
node tests/test-wcag-contrast.js
```

---

## License

Published and maintained by **Chelan County Information Technology Department** for Ohme Gardens County Park, Wenatchee, WA.

