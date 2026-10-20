const { execSync } = require('child_process');

console.log('=== ACCESSIBILITY & HEADING STRUCTURE AUDIT ===\n');

// 1. Check all images in dbo.pages for alt attribute
const pages = JSON.parse(require('fs').readFileSync('./capture/pages.json', 'utf8'));

let missingAltCount = 0;
let totalImages = 0;

for (const p of pages) {
    const html = p.main_content_html || '';
    const imgMatches = html.matchAll(/<img([^>]+)>/gi);
    for (const m of imgMatches) {
        totalImages++;
        const attrs = m[1];
        if (!attrs.includes('alt=')) {
            missingAltCount++;
            console.log(`Missing alt tag in ${p.url}: ${m[0].substring(0, 80)}`);
        }
    }
}

console.log(`[1] Image alt attributes: ${totalImages} images checked, ${totalImages - missingAltCount} have alt attributes.`);

// 2. Heading hierarchy in views
const viewFiles = [
    'app/views/layout.cfm',
    'app/views/gardens/home.cfm',
    'app/views/gardens/page.cfm',
    'app/views/gardens/section.cfm',
    'app/views/gardens/gallery.cfm',
    'app/views/gardens/contact.cfm',
    'app/views/gardens/camera.cfm',
    'app/views/gardens/faq.cfm',
    'app/views/gardens/legal.cfm'
];

console.log('\n[2] Heading Hierarchy across templates:');
for (const vf of viewFiles) {
    const content = require('fs').readFileSync(vf, 'utf8');
    const h1Count = (content.match(/<h1\b/gi) || []).length;
    const h2Count = (content.match(/<h2\b/gi) || []).length;
    const h3Count = (content.match(/<h3\b/gi) || []).length;
    console.log(`  - ${vf}: H1=${h1Count}, H2=${h2Count}, H3=${h3Count}`);
}

console.log('\n=== AUDIT COMPLETE ===');

