const http = require('http');

function fetchUrl(urlPath) {
    return new Promise((resolve, reject) => {
        const req = http.get({
            hostname: '127.0.0.1',
            port: 80,
            path: urlPath,
            headers: {
                'Host': 'ohmegardens.org'
            }
        }, (res) => {
            let data = '';
            res.on('data', chunk => data += chunk);
            res.on('end', () => resolve({ status: res.statusCode, headers: res.headers, body: data }));
        });
        req.on('error', reject);
    });
}

async function run() {
    console.log("=== COMPREHENSIVE BOOTSTRAP 5 & WCAG 2.1 AA LIVE VERIFICATION ===\n");

    const routes = [
        { path: '/', label: 'Home Page' },
        { path: '/thegardens/page/the-history-of-ohme-gardens', label: 'History Interior Page' },
        { path: '/planyourvisit/page/hours-and-admission', label: 'Hours & Admission Page' },
        { path: '/thegardens/photo-gallery', label: 'Photo Gallery' },
        { path: '/contacts', label: 'Contact Us Form' },
        { path: '/thegardens/camera', label: 'Live Camera Page' },
        { path: '/planyourspecialevent/frequently-asked-questions', label: 'FAQ Page' },
        { path: '/legal', label: 'Legal / Terms of Use' },
        { path: '/stylesheets/bootstrap5/css/bootstrap.min.css', label: 'Bootstrap 5.3 CSS' },
        { path: '/stylesheets/bootstrap5/js/bootstrap.bundle.min.js', label: 'Bootstrap 5.3 Bundle JS' },
        { path: '/stylesheets/ohme-custom.css', label: 'Custom WCAG Stylesheet' }
    ];

    let overallSuccess = true;

    for (const r of routes) {
        try {
            const res = await fetchUrl(r.path);
            const isOk = res.status === 200;
            if (!isOk) overallSuccess = false;
            console.log(`[${isOk ? 'PASS' : 'FAIL'}] [${res.status}] ${r.label} (${r.path}) - Size: ${res.body.length} bytes`);

            // If HTML page, test for Bootstrap 5 & WCAG components
            if (r.path.indexOf('.css') === -1 && r.path.indexOf('.js') === -1) {
                const hasSkipLink = res.body.includes('skip-link') && res.body.includes('href="#main-content"');
                const hasHeaderLandmark = res.body.includes('<header role="banner">');
                const hasMainLandmark = res.body.includes('<main id="main-content"');
                const hasFooterLandmark = res.body.includes('<footer') && res.body.includes('role="contentinfo"');
                const hasBs5Css = res.body.includes('/stylesheets/bootstrap5/css/bootstrap.min.css');
                const hasBs5Js = res.body.includes('/stylesheets/bootstrap5/js/bootstrap.bundle.min.js');
                const hasBs5Nav = res.body.includes('navbar navbar-expand-lg navbar-dark');
                const hasBs5Toggler = res.body.includes('data-bs-toggle="collapse"');

                console.log(`   - Skip link present: ${hasSkipLink ? 'YES' : 'NO'}`);
                console.log(`   - Semantic landmarks: header=${hasHeaderLandmark}, main=${hasMainLandmark}, footer=${hasFooterLandmark}`);
                console.log(`   - Bootstrap 5 assets: CSS=${hasBs5Css}, JS=${hasBs5Js}, Nav=${hasBs5Nav}, Toggler=${hasBs5Toggler}`);

                if (!hasSkipLink || !hasHeaderLandmark || !hasMainLandmark || !hasFooterLandmark || !hasBs5Css || !hasBs5Js) {
                    overallSuccess = false;
                }
            }
        } catch (e) {
            console.log(`[ERROR] ${r.label} (${r.path}): ${e.message}`);
            overallSuccess = false;
        }
    }

    console.log("\n========================================================");
    console.log(`AUDIT RESULT: ${overallSuccess ? "ALL 11 CHECKS PASSED!" : "SOME FAILURES OCCURRED"}`);
    console.log("========================================================");
}

run();

