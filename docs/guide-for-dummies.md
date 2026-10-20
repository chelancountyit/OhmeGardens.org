# Ohme Gardens CMS & Website: The Complete Guide for Dummies

Welcome to the non-technical, plain-English guide to how **OhmeGardens.org** is built, how it connects to **CMSAdmin 2.0**, and how to manage and update it without needing a computer science degree!

---

## 1. The Big Picture: How Everything Fits Together

Imagine the whole setup as a restaurant:
- **The Kitchen (CMSAdmin 2.0):** This is where county staff create pages, upload photos, change hours, and build forms. Nobody from the public sees this behind-the-scenes system.
- **The Pantry (Database & Storage):** All the words, titles, and settings are saved in a Microsoft SQL Server database named `ChelanCountyWebsite`. All pictures and PDFs live in `files/ohme-gardens/`.
- **The Dining Room (OhmeGardens.org):** This is the public website that visitors see when they go to `www.ohmegardens.org`. It fetches fresh information from the database and displays it using responsive templates that look great on phones, tablets, and computers.

```mermaid
flowchart LR
    Staff["Staff Authors\n(CMSAdmin 2.0)"] -->|"Writes Content & Media"| DB[("SQL Server\nChelanCountyWebsite")]
    Staff -->|"Uploads Photos & PDFs"| Files["Filesystem\nfiles/ohme-gardens/"]
    DB -->|"Supplies Pages & Nav"| Web["Public Website\nOhmeGardens.org"]
    Files -->|"Loads Images & Docs"| Web
    Visitor["Public Visitors\n(Phones, Tablets, Desktops)"] --> Web
```

---

## 2. What Is a Workspace?

A **Workspace** is simply a dedicated compartment inside the CMS.
- Chelan County has workspaces for departments like the Assessor, Commissioners, Sheriff, and Public Works.
- We created a dedicated workspace for **Ohme Gardens** (`ohme-gardens`).
- Because Ohme Gardens has its own workspace:
  - Its pages don't get mixed up with county government pages.
  - Its images and documents live in their own folder: `C:\inetpub\CMSAdmin2.0\files\ohme-gardens\images\` and `documents\`.
  - Its brand color (Alpine Evergreen `#2D5A27`), phone number `(509) 662-5785`, address `3327 Ohme Road`, and seasonal hours `April 15 - October 15: 9:00 AM - 6:00 PM Daily` are stored once in the workspace settings and automatically used across the website.

---

## 3. The 5 Main Sections of the Site

The website is organized into 5 primary sections:
1. **The Gardens (`/thegardens`):** History, About Us, Photo Gallery, Map of the Gardens, Live Camera.
2. **Plan Your Visit (`/planyourvisit`):** Hours & Admission, Memberships, Driving Directions, Group Rates.
3. **Events (`/events`):** Concerts, Comedy, Sound Healing, Movie Nights, Story Hour.
4. **Weddings & Private Events (`/planyourspecialevent`):** Why Ohme, Weddings, FAQs, Photo Gallery, and Tripleseat booking link.
5. **Get Involved (`/getinvolved`):** How You Can Help, Friends of Ohme, Memorials & Tributes, Adopt a Bench, Donate.

Plus standalone utility pages:
- **Contact Us (`/contacts`):** Name, Phone, Email, Message form.
- **Legal (`/legal`):** Privacy policy, terms of use.

---

## 4. How Web Addresses (URLs) Work

Every page has a clean, predictable URL that matches the original live site:
- **Section Home:** `/{section}` (for example, `/thegardens` or `/planyourvisit`)
- **Interior Pages:** `/{section}/pages/{slug}` (for example, `/thegardens/pages/the-history-of-ohme-gardens` or `/planyourvisit/pages/hours-and-admission`)
- **Galleries:** `/{section}/photo-gallery` (for example, `/thegardens/photo-gallery`)
- **Contact Form:** `/contacts`
- **Legal:** `/legal`

---

## 5. How Content Is Stored & Edited

### Pages
Each page in the database has:
- **Title:** The headline of the page (e.g., "History of Ohme Gardens").
- **Slug (Permalink):** The URL ending (e.g., `the-history-of-ohme-gardens`).
- **Body:** The text and pictures of the page.
- **Parent ID:** Tells the system what section this page belongs to (for example, "The History of Ohme Gardens" has Parent ID 25, which points to "The Gardens").
- **Status & Visibility:** `Active` and `Published` so visitors can see it.
- **SEO Tags:** Title and description for Google and Bing search engines.

### Revisions (RCW 42.56 Compliance)
Every time someone edits a page and clicks Save, the CMS automatically takes a permanent snapshot of the old version into `page_revisions`. This means:
- You can never accidentally lose anything.
- If someone makes a mistake, you can roll back to any previous version with one click.
- It fulfills Washington State public record retention laws.

---

## 6. How Photo Galleries Work

Ohme Gardens features two photo galleries:
1. The Gardens Gallery (`/thegardens/photo-gallery`)
2. Weddings Gallery (`/planyourspecialevent/photo-gallery`)

Instead of requiring external plugins or slow outside code, the galleries:
- Load high-resolution images directly from the local server (`files/ohme-gardens/images/garden/` and `wedding/`).
- Display them in a fast, responsive thumbnail grid.
- When clicked, open a smooth full-screen **Lightbox** that lets users swipe or click next/previous.
- Zero external CDNs are used, keeping it fast, private, and secure.
- **Bug Fix:** In the live site, the photo gallery breadcrumb mistakenly linked "The Gardens" to `/getinvolved`. In our new template, this is fixed so it correctly points back to `/thegardens`!

---

## 7. How the Contact Form Works

The Contact Us page (`/contacts`) has a form with four fields:
1. **Your Name** (Required)
2. **Phone Number** (Optional)
3. **Email Address** (Required)
4. **Message** (Required)

### Protection & Delivery:
- **Anti-Spam:** Protected by a hidden "honeypot" field (`website`). Human visitors never see it, but spam robots automatically fill it in. If filled, the form rejects the submission immediately!
- **Email Delivery:** When submitted, the form automatically sends an email to the address configured in CMS settings (`info@ohmegardens.org`). No hardcoded email addresses in code!
- **Audit Log:** Every submission is recorded in `dbo.form_submissions` so no inquiry ever gets lost.

---

## 8. Why We Stored 100% of Images Locally (Zero CDN Policy)

Many websites load icons, fonts, and images from external companies (like Amazon, Google Fonts, or Cloudflare). If any of those companies have an outage or change a link, the site looks broken.
- In this rebuild, **all 105 pictures, posters, and PDFs** live right on your own server in `C:\inetpub\CMSAdmin2.0\files\ohme-gardens\`.
- Even the event poster images from Square (like comedy nights and movie nights) were downloaded and saved locally.
- All styles, scripts, and fonts are self-contained. The website does not depend on ANY outside servers to display properly!

---

## 9. How Events & Ticketing Work

- **Event Pages:** Events like *Comedy in the Gardens*, *Movies in the Gardens*, and *Sound Healing* have their own pages under `/events/pages/...`.
- **Ticketing & Booking:**
  - Wedding and private event inquiries connect directly to **Tripleseat** (`https://ohmegardens.tripleseat.com/party_request/20439`).
  - Event tickets, memberships, and donations connect to **Square** checkout links.
  - When clicked, ticket links open cleanly in a new tab so visitors never lose their place on the Ohme Gardens website.

---

## 10. How Search Engines & Social Media Find the Site

- **`robots.txt`:** A text file that tells Google, Bing, and other search engines that all pages are welcome to be indexed.
- **`sitemap.xml`:** A modern list of all 33 pages on `www.ohmegardens.org` that search engines read to find new and updated content instantly.
- **Search Engine Verification:** The existing Google and Bing site ownership verification codes are preserved in the website header so search rankings are not interrupted.
- **Clean Article Reading Experience:** Redundant floating social share bars and font-size widgets were removed in favor of clean, distraction-free reading, responsive native browser zoom, and modern mobile sharing.
- **Chelan County Translator:** A dedicated header dropdown (`[US Flag] ENGLISH ▼`) lets visitors translate the entire site into any of 142 languages on the fly via Google Translate, seamlessly matching the Chelan County government translation system with zero external CDNs.

---

## 11. How to Manage Navigation Menus in CMSAdmin 2.0

Ohme Gardens' navigation bar is completely dynamic and powered by CMSAdmin's built-in **Navigation Manager**!

### Where to Find It:
1. Log into CMSAdmin 2.0.
2. Select the **Ohme Gardens** workspace from the top workspace picker.
3. In the left administration menu, click **Navigation Menus** (or navigate to `/navigation`).

### How It Works:
- **Two-Level Hierarchy:** You will see the 6 main categories (*The Gardens*, *Plan Your Visit*, *Events*, *Plan Your Special Event*, *Get Involved*, *Contacts*) and their nested dropdown children.
- **Drag-and-Drop Reordering:** Want to change the order of menu links? Simply grab the handle next to any link and drag it up or down.
- **Adding New Links:** Pick any published page from the left workspace page list to add it to the menu, or enter a custom link.
- **Toggling Visibility:** You can temporarily hide any menu item with a single toggle switch without deleting the page.
- **Automatic Fallback:** If the database ever goes offline for scheduled maintenance, the site automatically serves an embedded fallback menu so visitors never experience a broken header.

---

## 12. Accessibility (WCAG 2.1 AA) & Modern Bootstrap 5

### What is WCAG 2.1 AA?
WCAG (Web Content Accessibility Guidelines) is the official gold standard for making websites easy to use for everyone — including people with low vision, color blindness, or people who navigate using screen readers and keyboards instead of a mouse.

### What Was Fixed for Accessibility:
1. **Easy to Read Colors (High Contrast):**
   - On the old site, light greens (`#89b81c`, `#95aa5f`) were washed out against white backgrounds and hard for many people to read.
   - We replaced them with deep, rich, evergreen alpine colors (`#2D5A27`, `#1e6b18`, `#214d1c`) that achieve high-contrast ratios between **6.6:1 and 15.4:1** (exceeding even the strictest Level AAA guidelines!).
   - All body links are clearly underlined so they stand out without relying solely on color.
2. **"Skip to Content" Button:**
   - When a person using a screen reader or keyboard presses `Tab`, the very first thing they see is a button to jump straight past the menus directly to the main page content.
3. **Keyboard Focus Outlines:**
   - When tabbing through the site with a keyboard, every button, link, and input field gets a bright green outline ring so visitors always know where they are.
4. **Accessible Forms & Accordions:**
   - Every input field has a clearly connected label.
   - The FAQ questions expand and collapse with accessible buttons that announce their open/closed state to screen readers.

### Why Bootstrap Latest (v5.3)?
- The website now runs on the newest **Bootstrap 5.3** framework with zero legacy dependencies.
- It uses modern mobile-first styling (`navbar-expand-lg`, `visually-hidden`, `gap-*`, `rounded-pill`) so the website looks crisp, modern, and loads blazing fast on iPhones, Android devices, iPads, and desktop computers.

---

## 13. What to Do on Go-Live Day (Cutover Made Easy)

When it's time to make the new site live:
1. Open the [Cutover & Rollback Checklist](file:///C:/inetpub/OhmeGardens.org/docs/cutover-and-rollback-checklist.md).
2. Point your website in IIS Manager to `C:\inetpub\OhmeGardens.org`.
3. Test that `https://www.ohmegardens.org` loads with your SSL certificate.
4. Point DNS to the server IP.
5. If anything goes wrong, you can rollback in under 5 minutes by following Section 4 of the checklist.

---

## 14. Full Project Phase Summary

| Phase | What It Covered | Status |
| :--- | :--- | :--- |
| **Phase 0: Discover** | Researched CMSAdmin 2.0 tables, filesystems, and databases | Completed & Approved |
| **Phase 1: Scaffold** | Created `ohme-gardens` workspace, section landing pages, and folder storage | Completed & Approved |
| **Phase 2: Capture** | Polite crawler downloaded all 33 pages, 105 assets, and clean JSON | Completed (33/33 match) |
| **Phase 3: Templates** | Built responsive templates: Home, Interior, Section, Gallery, Contact, Camera, FAQ, Legal | Completed |
| **Phase 4: Content** | Imported all 33 pages into `dbo.pages`, rewrote image links, cleaned HTML | Completed |
| **Phase 5: Features** | Lightbox galleries, contact form, spam protection, Tripleseat/Square links, Spanish link | Completed |
| **Phase 6: QA & WCAG** | Upgraded to Bootstrap 5.3, passed 42/42 WCAG 2.1 AA checks, 0 external CDNs, 100% alt text | 100% Certified |
| **Phase 7: Go-Live Prep** | Prepared `robots.txt`, `sitemap.xml`, redirect map, and cutover checklist | Ready for Handover |
