function getLuminance(r, g, b) {
    const a = [r, g, b].map(v => {
        v /= 255;
        return v <= 0.03928 ? v / 12.92 : Math.pow((v + 0.055) / 1.055, 2.4);
    });
    return a[0] * 0.2126 + a[1] * 0.7152 + a[2] * 0.0722;
}

function hexToRgb(hex) {
    hex = hex.replace('#', '');
    if (hex.length === 3) hex = hex.split('').map(c => c + c).join('');
    const num = parseInt(hex, 16);
    return [(num >> 16) & 255, (num >> 8) & 255, num & 255];
}

function getContrast(hex1, hex2) {
    const rgb1 = hexToRgb(hex1);
    const rgb2 = hexToRgb(hex2);
    const lum1 = getLuminance(...rgb1);
    const lum2 = getLuminance(...rgb2);
    const brightest = Math.max(lum1, lum2);
    const darkest = Math.min(lum1, lum2);
    return ((brightest + 0.05) / (darkest + 0.05));
}

const tests = [
    { label: "Body Text (#212529 on #FFFFFF)", fg: "#212529", bg: "#FFFFFF", min: 4.5 },
    { label: "Muted Text (#595959 on #FFFFFF)", fg: "#595959", bg: "#FFFFFF", min: 4.5 },
    { label: "Content Links (#1e6b18 on #FFFFFF)", fg: "#1e6b18", bg: "#FFFFFF", min: 4.5 },
    { label: "Content Links Hover (#13460e on #FFFFFF)", fg: "#13460e", bg: "#FFFFFF", min: 4.5 },
    { label: "Brand Heading (#1b4317 on #FFFFFF)", fg: "#1b4317", bg: "#FFFFFF", min: 3.0 },
    { label: "Sidebar Active Item Text (#FFFFFF on #2D5A27)", fg: "#FFFFFF", bg: "#2D5A27", min: 4.5 },
    { label: "Sidebar Inactive Item Text (#1b4317 on #f4f6ef)", fg: "#1b4317", bg: "#f4f6ef", min: 4.5 },
    { label: "Sidebar Hover Item Text (#FFFFFF on #3a6e33)", fg: "#FFFFFF", bg: "#3a6e33", min: 4.5 },
    { label: "Feature Tile Visit (#FFFFFF on #214d1c)", fg: "#FFFFFF", bg: "#214d1c", min: 4.5 },
    { label: "Feature Tile Join (#FFFFFF on #183f15)", fg: "#FFFFFF", bg: "#183f15", min: 4.5 },
    { label: "Feature Tile Connect (#FFFFFF on #1e4a27)", fg: "#FFFFFF", bg: "#1e4a27", min: 4.5 },
    { label: "Feature Tile Livecam (#FFFFFF on #153920)", fg: "#FFFFFF", bg: "#153920", min: 4.5 },
    { label: "Footer Body Text (#e4ece1 on #1c281a)", fg: "#e4ece1", bg: "#1c281a", min: 4.5 },
    { label: "Footer Links (#96e088 on #1c281a)", fg: "#96e088", bg: "#1c281a", min: 4.5 },
    { label: "Footer Links Hover (#c4f7bc on #1c281a)", fg: "#c4f7bc", bg: "#1c281a", min: 4.5 },
    { label: "Navbar Nav Links (#FFFFFF on #181d18)", fg: "#FFFFFF", bg: "#181d18", min: 4.5 },
    { label: "Navbar Donate / Contact Button (#FFFFFF on #2D5A27)", fg: "#FFFFFF", bg: "#2D5A27", min: 4.5 },
    { label: "Form Input Border (#495057 on #FFFFFF) - 1.4.11 Non-text", fg: "#495057", bg: "#FFFFFF", min: 3.0 }
];

console.log("=== WCAG 2.1 AA COLOR CONTRAST VERIFICATION ===\n");
let allPass = true;
tests.forEach(t => {
    const ratio = getContrast(t.fg, t.bg);
    const pass = ratio >= t.min;
    if (!pass) allPass = false;
    const status = pass ? "PASS" : "FAIL";
    console.log(`[${status}] ${t.label}: ${ratio.toFixed(2)}:1 (Requires >= ${t.min}:1)`);
});

console.log("\nOVERALL STATUS: " + (allPass ? "ALL COLORS PASS WCAG 2.1 AA!" : "SOME FAILURES DETECTED"));

