# CMSAdmin 2.0 Architectural Discovery & Findings

**Document Location:** `docs/cms-findings.md`  
**Date:** 2026-10-19  
**Investigator:** AI Agent (Antigravity)  
**System Target:** Chelan County CMSAdmin 2.0 (`C:\inetpub\CMSAdmin2.0`) & ChelanCounty.gov (`C:\inetpub\ChelanCounty.gov`)  
**Database Datasource:** `ChelanCountyWebsite` (Microsoft SQL Server)  
**Target Workspace / Site:** Ohme Gardens (`C:\inetpub\OhmeGardens.org`)  

---

## Executive Summary

Phase 0 discovery was conducted in complete read-only mode across the CMSAdmin 2.0 codebase, the ChelanCounty.gov public frontend implementation, the SQL Server database `ChelanCountyWebsite`, and filesystem directory trees.

Key Discovery Highlights:
1. **No Existing Ohme Gardens Workspace:** Neither the database table `dbo.cms_workspaces` nor the physical filesystem (`C:\inetpub\CMSAdmin2.0\files\` or `C:\inetpub\chelan-county\files\`) contains an `ohme-gardens` workspace or directory. It must be scaffolded clean in Phase 1.
2. **Architecture Model:** CMSAdmin 2.0 acts as the headless/back-office management system (managing workspaces, pages, navigation menus, media assets, and forms in SQL Server `ChelanCountyWebsite`). Frontend websites (such as `ChelanCounty.gov` and `OhmeGardens.org`) run as independent CFWheels applications on Adobe ColdFusion/Lucee, querying `ChelanCountyWebsite` for published content and rendering responsive templates.
3. **No Native Gallery Module:** CMSAdmin 2.0 does not possess a dedicated "galleries" table or module; media is stored in `dbo.media_assets` and physical disk files under `/files/{workspace}/images/`. Gallery functionality is implemented via dedicated template views and frontend lightbox scripts.
4. **Native Form Builder:** A full-featured dynamic form builder exists in CMSAdmin 2.0 (`dbo.forms`, `dbo.form_fields`, `dbo.form_submissions`) that supports spam protection and email notifications, embeddable via shortcodes (`[chelan_form slug="..."]`) or rendered natively.

---

## 1. How CMSAdmin Represents a Site, Section, Page, and Template

### A. Site (Workspace)
- **Database Table:** `dbo.cms_workspaces`
  - `code` (NVARCHAR(50), Unique Key): The workspace identifier / slug, e.g. `'ohme-gardens'`.
  - `name` (NVARCHAR(150)): Display name, e.g. `'Ohme Gardens'`.
  - `type` (NVARCHAR(20)): Scoping type (`'site'`, `'dept'`, or `'global'`). For Ohme Gardens, this is `'site'`.
  - `virtual_directory` (NVARCHAR(100), Unique Key): Directory / URL segment alias, e.g. `'ohme-gardens'`.
  - `domain_name` (NVARCHAR(255)): Domain binding, e.g. `'www.ohmegardens.org'` or test host.
  - `project_path` (NVARCHAR(255)): Physical root path of the frontend application (`'C:\inetpub\OhmeGardens.org'`).
  - `storage_path` (NVARCHAR(255)): Asset storage folder relative or absolute (`'files/ohme-gardens'`).
  - Contact metadata: `contact_first_name`, `contact_last_name`, `contact_email`, `contact_phone`, `address`, `office_hours`, `color` (brand hex).
- **Filesystem Representation:**
  - `C:\inetpub\chelan-county\files\<workspace-code>\` with subfolders `images\` and `documents\`.
  - `C:\inetpub\CMSAdmin2.0\files\` is an NTFS Junction pointing to `C:\inetpub\chelan-county\files\`. When a workspace is created via `Workspaces.cfc`, these subfolders are created automatically.

### B. Section
- **Representation:**
  - CMSAdmin 2.0 does **not** have a separate relational `sections` table.
  - In CMSAdmin's architecture, sections are represented in two coupled ways:
    1. **Top-Level Pages (`dbo.pages`):** Section landing pages are stored as parent pages with `ParentID = 0` (or `NULL`), where `Permalink` matches the section slug (`thegardens`, `planyourvisit`, `events`, `planyourspecialevent`, `getinvolved`). Interior pages set `ParentID = <SectionLandingPageID>`.
    2. **Navigation Hierarchy (`dbo.navigation_menus` & `dbo.navigation_menu_items`):** Navigation menus scoped to `siteid = 'ohme-gardens'` define the section structure. Top-level menu items represent the sections, and nested items (`parent_item_id`) define the interior pages and subnav ordering.

### C. Page
- **Database Tables:**
  - `dbo.pages`: Primary content record.
    - `ContentID` (INT, PK, Identity)
    - `SiteID` (NVARCHAR(100)): Workspace code (`'ohme-gardens'`)
    - `Title` (NVARCHAR(255)): Display title
    - `Permalink` (NVARCHAR(255)): URL slug (e.g. `'history'`, `'about-us'`)
    - `Body` (NVARCHAR(MAX)): Main HTML content
    - `Summary` (NVARCHAR(MAX)): Excerpt / summary
    - `ParentID` (INT): Parent page reference for hierarchy
    - `LayoutType` (NVARCHAR(50)): Layout wireframe (`'Full'` or `'Right Sidebar'`)
    - `StatusCode` (NVARCHAR(50)): `'Active'` or `'Archived'`
    - `Visibility` (NVARCHAR(50)): `'Published'` or `'Draft'`
    - `isPublished` (BIT): `1` or `0`
    - `MetaTitle`, `MetaDesc`, `MetaKeyWords`: SEO metadata
    - `imageAttachment`, `imageAlt`, `imageTitle`, `imageDecorative`: Featured cover image
    - `Created`, `CreatedBy`, `Modified`, `ModifiedBy`, `DeletedAt`: Audit tracking
  - `dbo.page_revisions`: Immutable revision snapshots capturing complete state and `meta_json` for legal retention (RCW 42.56 compliance).

### D. Template
- **Representation:**
  - Templates are **CFML view files** located in the frontend site application (`app/views/`).
  - Wireframe modes stored in the database (`dbo.pages.LayoutType`):
    - `'Full'`: 12-column full-width content container.
    - `'Right Sidebar'`: 9/3 column grid displaying left subnav, main body, and right contextual sidebar widgets.
  - Page Templates required by PLAN.md:
    1. **Home Template:** (`app/views/gardens/home.cfm`) — Hero, seasonal announcement banner, 4 feature tiles (Visit, Join, Connect, Live Cam).
    2. **Interior Page Template:** (`app/views/gardens/page.cfm`) — Banner header, breadcrumbs, left subnav, font/print/share toolbar, main content, optional sidebar.
    3. **Section Landing Template:** (`app/views/gardens/section.cfm`) — Section overview, child page directory/cards, breadcrumbs.
    4. **Gallery Template:** (`app/views/gardens/gallery.cfm`) — Responsive image grid with modal lightbox.
    5. **Contact Template:** (`app/views/gardens/contact.cfm`) — Contact details, office hours, interactive form embed.
    6. **Event Template:** (`app/views/gardens/event.cfm`) — Repeating event blocks (date, title, price, Square checkout button).

---

## 2. Content Blocks, Galleries, and Forms

### A. Content Blocks
- **Primary Body:** Stored directly in `dbo.pages.Body` as clean HTML.
- **Shortcode Resolution:** As implemented in `ChelanCounty.gov/app/views/helpers.cfm::renderCmsContent()`, body content passes through shortcode parsers:
  - `[cta_grid slugs="..." cols="2|3|4"]`: Resolves Call to Action cards from `dbo.page_call_to_actions` and `dbo.page_CtaCard`.
  - `[chelan_form slug="..."]`: Embeds online forms dynamically.
  - `[folder_explorer ...]`: Embeds document repositories.
- **Subpages / Contextual Sidebars:** Stored in `dbo.page_SubPage` (linked by `ContentID` and `SiteID`).

### B. Galleries
- **Findings:**
  - **No dedicated gallery table exists in CMSAdmin 2.0.**
  - Media images are managed through `Media.cfc` and cataloged in `dbo.media_assets` (`site_id`, `filename`, `file_path`, `web_url`, `alt_text`, `title`, `caption`).
  - The live Ohme Gardens site utilizes 21 images in `thegardens/photo-gallery` and a wedding gallery in `planyourspecialevent/photo-gallery`.
- **Implementation Mechanism:**
  - The frontend Gallery template will query `dbo.media_assets` (filtered by `site_id = 'ohme-gardens'` and category/folder e.g. `'garden'`, `'weddings'`) or load directly from `files/ohme-gardens/images/garden/`, rendering an accessible responsive grid with a Vanilla JS lightbox (zero external CDN invariant).

### C. Forms
- **Findings:**
  - CMSAdmin 2.0 includes a full Form Builder (`app/controllers/Forms.cfc`).
  - Relational tables:
    - `dbo.forms`: Form definitions (`id`, `title`, `slug`, `siteid`, `alert_email`, `submit_button_text`, `theme_color`, `is_active`, etc.).
    - `dbo.form_fields`: Individual inputs (`form_id`, `label`, `element_type`, `field_name`, `is_required`, `options`, `sort_order`). Supported field types include `text`, `email`, `phone`, `textarea`, `dropdown`, etc.
    - `dbo.form_submissions` & `dbo.form_submission_values`: Secure encrypted storage of citizen submissions.
- **Contact Form Handling:**
  - The Ohme Gardens contact form (Name, Phone, Email, Message) can be provisioned as a form record (`slug = 'ohme-contact'`) scoped to `siteid = 'ohme-gardens'` with notification destination configured via CMS settings/form configuration (not hardcoded).
  - It can be rendered in the Contact template via native CFML form processing or via the `[chelan_form slug="ohme-contact"]` integration.

---

## 3. URL Routing and IIS Domain Binding

### A. URL Routing in Wheels (CFWheels 4.1/4.2)
- All requests flow into IIS, which evaluates `web.config`:
  ```xml
  <rule name="Wheels Clean URLs" stopProcessing="true">
      <match url="^(.*)$" />
      <conditions logicalGrouping="MatchAll">
          <add input="{REQUEST_FILENAME}" matchType="IsFile" negate="true" />
          <add input="{REQUEST_FILENAME}" matchType="IsDirectory" negate="true" />
          <add input="{URL}" pattern="^/(files|images|javascripts|stylesheets|robots\.txt|favicon\.ico|sitemap\.xml|index\.cfm)" negate="true" />
      </conditions>
      <action type="Rewrite" url="index.cfm/{R:1}" />
  </rule>
  ```
- Requests rewrite to `index.cfm/{R:1}` and are dispatched by `vendor/wheels/dispatch/request.cfm` through routes defined in `config/routes.cfm`.
- To match the live Ohme Gardens URLs exactly:
  ```cfm
  mapper()
      // Content pages: /{section}/pages/{slug}
      .get(name="gardenPage", pattern="/[section]/pages/[slug]", to="gardens##page")
      // Galleries: /{section}/photo-gallery
      .get(name="gardenGallery", pattern="/[section]/photo-gallery", to="gardens##gallery")
      // Section landings: /{section}
      .get(name="gardenSection", pattern="/[section]", to="gardens##section")
      // Special routes
      .get(name="contacts", pattern="/contacts", to="gardens##contacts")
      .get(name="legal", pattern="/legal", to="gardens##legal")
      // Root route: /
      .root(to="gardens##home", method="get")
      .wildcard()
  .end();
  ```

### B. IIS Domain Binding
- An IIS Website is created or assigned with Physical Path = `C:\inetpub\OhmeGardens.org`.
- Site Bindings attach the domain (`www.ohmegardens.org`, `ohmegardens.org`) or development hostname (e.g. `ohmegardens.local` or port binding).
- In CMSAdmin, `dbo.cms_workspaces` records `domain_name = 'www.ohmegardens.org'` and `project_path = 'C:\inetpub\OhmeGardens.org'`.

---

## 4. Does an `ohme-gardens` Workspace Already Exist?

**Definitive Answer:** **NO.**
- **Database Check:**
  - Ran `SELECT id, code, name FROM dbo.cms_workspaces`.
  - Found exactly two records: `global` (id: 1) and `assessor` (id: 45).
  - No workspace with code `ohme-gardens`, `ohme`, or `gardens` exists.
- **Pages Check:**
  - Ran `SELECT COUNT(*) FROM dbo.pages WHERE SiteID LIKE '%ohme%'`. Returned `0`.
- **Filesystem Check:**
  - `C:\inetpub\CMSAdmin2.0\files\` (and junction target `C:\inetpub\chelan-county\files\`) contains folders for `assessor`, `auditor`, `commissioners`, `community-development`, `hrm`, `pio`, `public-works`, and `shared`.
  - **No `ohme-gardens` directory exists on disk.**
- **Media Check:**
  - `dbo.media_assets` contains zero records for Ohme Gardens.

*Explanation of Live Site Reference:* The live site loaded assets from `co.chelan.wa.us/files/ohme-gardens/images/` because of an older legacy deployment, but it was never migrated into CMSAdmin 2.0. A clean rebuild/scaffold is necessary.

---

## 5. What `C:\inetpub\OhmeGardens.org` Is Supposed to Hold

`C:\inetpub\OhmeGardens.org` is the **dedicated public frontend website application** for Ohme Gardens. It mirrors the relationship between `C:\inetpub\ChelanCounty.gov` and `C:\inetpub\CMSAdmin2.0`.

It will contain:
1. `capture/`:
   - `capture/pages.json` (scraped page inventory, metadata, breadcrumbs, subnav order, cleaned HTML).
   - `capture/assets/` (all downloaded images and documents).
2. `docs/`:
   - `docs/cms-findings.md` (this architectural report).
   - `docs/build-log.md` (chronological step log).
3. Public Application Structure (Wheels 4.1/4.2):
   - `Application.cfc` & `index.cfm` (configured to connect to datasource `ChelanCountyWebsite`).
   - `web.config` (IIS URL rewriting).
   - `config/` (`routes.cfm`, `settings.cfm`, `environment.cfm`).
   - `app/`
     - `controllers/` (`Gardens.cfc`, `Up.cfc`, `Controller.cfc`).
     - `models/` (`Page.cfc`, `Workspace.cfc`, `NavigationMenu.cfc`, `MediaAsset.cfc`, etc.).
     - `views/` (`gardens/home.cfm`, `gardens/page.cfm`, `gardens/section.cfm`, `gardens/gallery.cfm`, `gardens/contact.cfm`, `gardens/event.cfm`, `layout.cfm`, and shared header/footer/subnav partials).
   - `stylesheets/`, `javascripts/`, `images/` (branding, logo, vanilla CSS/JS with zero external CDNs).
   - `files/` (virtual directory or junction to `C:\inetpub\chelan-county\files\ohme-gardens` for uploaded media and documents).
   - `vendor/wheels/` (Wheels core framework).

---

## Summary & Checkpoint Decisions Needed

As required by prompt rules and checkpoints, we **stop here** at the conclusion of Phase 0. No database or CMS changes have been made.

### Decisions / Confirmations Requested Before Phase 1:
1. **Workspace Creation Method:**
   - Should we create the `ohme-gardens` workspace record in `dbo.cms_workspaces` via CMSAdmin's administrative API / controller logic (`Workspaces.cfc`), or by executing a parameterized SQL Server `INSERT` with `SET ANSI_NULLS ON; SET QUOTED_IDENTIFIER ON;` (after showing the exact statement for approval)?
2. **Sections Representation:**
   - Confirm our proposal: represent the 5 sections (`thegardens`, `planyourvisit`, `events`, `planyourspecialevent`, `getinvolved`) as:
     a) Top-level parent pages in `dbo.pages` (`ParentID = 0`, `Permalink = '<section>'`, `SiteID = 'ohme-gardens'`), and
     b) Top-level menu items in `dbo.navigation_menus` / `dbo.navigation_menu_items` (`siteid = 'ohme-gardens'`, `menu_key = 'top'`).
3. **Event Images:**
   - The live site hotlinks event images from Square's S3 bucket. Should we download all event images locally into `files/ohme-gardens/images/events/` so the site complies with the zero-external-dependency rule?
4. **Test Hostname & IIS Binding:**
   - What local test hostname or port binding would you prefer for testing in IIS (e.g. `test.ohmegardens.org`, `ohmegardens.local`, or `localhost:8088`)?
5. **Scaffold Approval:**
   - Ready to proceed to **Phase 1: Scaffold** and **Phase 2: Capture** upon your approval.

