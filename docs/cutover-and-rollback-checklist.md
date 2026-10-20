# OhmeGardens.org Go-Live Cutover & Rollback Checklist

> **STOP**: Per project guidelines, do NOT perform live DNS cutover or live IIS binding changes without administrator handoff and verification. Use this checklist during the scheduled maintenance window.

---

## 1. Pre-Cutover Verification (T - 24 Hours)

- [x] **Workspace Configuration:** Workspace `ohme-gardens` active in `dbo.cms_workspaces` with branding color `#2D5A27`, directory `files/ohme-gardens`, domain `www.ohmegardens.org`, and seasonal hours.
- [x] **Content Import:** All 33 pages imported into `dbo.pages` under `SiteID = 'ohme-gardens'` with clean HTML, verified parent-child hierarchy, and accurate metadata.
- [x] **Asset Verification:** 100% of media assets (105 photos, SVG icons, and Bench Map PDF) located on disk at `C:\inetpub\CMSAdmin2.0\files\ohme-gardens\` and local `images/` & `documents/`.
- [x] **Zero CDN Policy:** All 10 CSS files, 16 JS scripts, and webfonts hosted locally. 0 external CDNs.
- [x] **Search Engine Tags:** Google Site Verification (`-FA1R0dtcrbcrdLtYacf8AeuV345kPpZmpgXth4VcQ4`) and Bing Verification (`58C0EBB56FF34375FF16ECF3ACFCF8C9`) retained in header layout.
- [x] **SEO Files:** `robots.txt` and canonical `sitemap.xml` generated with 33 URLs.
- [x] **Redirect Map:** Permanent (301) redirect rules implemented in `web.config` and `config/redirects.json` for legacy URLs and aliases.
- [x] **Form Protection:** Honeypot anti-spam field configured on `/contacts` form with database audit logging.
- [x] **Database Backup:** Run a full SQL Server backup of `ChelanCountyWebsite` prior to live traffic cutover:
  ```sql
  BACKUP DATABASE [ChelanCountyWebsite] 
  TO DISK = N'C:\Backups\ChelanCountyWebsite_PreCutover_20261019.bak' 
  WITH NOFORMAT, NOINIT, NAME = N'Pre-Cutover Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10;
  ```

---

## 2. Cutover Execution Steps (T - 0)

1. **IIS Site Binding Setup:**
   - In IIS Manager, create or confirm the site binding for `OhmeGardens.org` pointing physical path to:
     `C:\inetpub\OhmeGardens.org`
   - Add bindings for:
     - `http://www.ohmegardens.org` (Port 80)
     - `http://ohmegardens.org` (Port 80)
     - `https://www.ohmegardens.org` (Port 443 with SSL Certificate)
     - `https://ohmegardens.org` (Port 443 with SSL Certificate)
2. **ColdFusion Connector:**
   - Ensure the Adobe ColdFusion IIS connector (wsconfig) is enabled for the `OhmeGardens.org` site so `.cfm` requests execute via ColdFusion.
3. **Application Pool:**
   - Set the IIS Application Pool to `.NET CLR Version: No Managed Code` with `Identity: ApplicationPoolIdentity` (or dedicated service account having Read/Execute access to `C:\inetpub\OhmeGardens.org` and Modify access to `C:\inetpub\OhmeGardens.org\app\views\helpers\`).
4. **App Initialization & Warmup:**
   - Request `http://127.0.0.1/up` or `http://localhost/index.cfm?reload=true` to warm up Wheels framework caches and compile CFML templates.
5. **DNS Cutover:**
   - Update external DNS A records:
     - `ohmegardens.org` -> Chelan County Web Server IP
     - `www.ohmegardens.org` -> Chelan County Web Server IP
   - Set TTL to 300 seconds initially for rapid rollback capability if needed.

---

## 3. Post-Cutover Sanity Verification (T + 15 Minutes)

- [ ] Check home page (`https://www.ohmegardens.org/`) loads hero slider, 4 feature blocks, phone, and seasonal hours.
- [ ] Check section navigation:
  - [ ] `/thegardens` and `/thegardens/pages/the-history-of-ohme-gardens`
  - [ ] `/planyourvisit` and `/planyourvisit/pages/hours-and-admission`
  - [ ] `/events` and event detail pages with local Square event thumbnails
  - [ ] `/planyourspecialevent` and `/planyourspecialevent/frequently-asked-questions` (all 24 accordion items)
  - [ ] `/getinvolved` and `/getinvolved/pages/donate`
- [ ] Check photo galleries and lightbox:
  - [ ] `/thegardens/photo-gallery` (Click image -> Magnific Popup modal displays)
  - [ ] `/planyourspecialevent/photo-gallery` (Click image -> Magnific Popup modal displays)
- [ ] Check live camera:
  - [ ] `/thegardens/camera`
- [ ] Check contact form submission:
  - [ ] Submit test message from `/contacts`. Verify flash success message and check `dbo.form_submissions`.
- [ ] Test legacy 301 redirects:
  - [ ] `/garden` -> `/thegardens`
  - [ ] `/wedding` -> `/planyourspecialevent/pages/weddings`
  - [ ] `/faq` -> `/planyourspecialevent/frequently-asked-questions`

---

## 4. Rollback Procedure (In Case of Critical Failure)

If a critical blocker is encountered during cutover that cannot be resolved within 30 minutes:

1. **DNS Rollback:**
   - Point DNS A records for `ohmegardens.org` and `www.ohmegardens.org` back to the previous host IP.
2. **IIS Site Disablement:**
   - Stop the `OhmeGardens.org` site in IIS Manager.
3. **Database Reversion (if necessary):**
   - If database issues arose, restore `ChelanCountyWebsite` from `ChelanCountyWebsite_PreCutover_20261019.bak` or deactivate workspace:
     ```sql
     UPDATE dbo.cms_workspaces SET is_active = 0 WHERE id = 'ohme-gardens';
     ```
4. **Log Incident:**
   - Note error messages, server logs (`C:\inetpub\OhmeGardens.org\app\logs\` or ColdFusion server logs `C:\ColdFusion2021\cfusion\logs\exception.log`), and report to IT administrator.

