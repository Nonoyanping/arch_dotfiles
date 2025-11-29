// ##################################################################
// # 05_sites.js - Mappings that only activate on specific websites #
// ##################################################################

// --- YOUTUBE ---
// const ytDomain = { domain: /youtube\.com/i };
// api.mapkey('A', 'Go to channel', () => {
//     document.querySelector('#meta-contents #channel-name a').click();
// }, ytDomain);
// api.mapkey('F', 'Toggle fullscreen', () => {
//     document.querySelector('.ytp-fullscreen-button').click();
// }, ytDomain);
//

// --- GITHUB ---
// const ghDomain = { domain: /github\.com/i };
// api.mapkey('yr', 'Copy repo clone URL', () => {
//     const url = document.querySelector('[data-copy-button-text="Copy"] > [data-copy-item]').getAttribute('data-copy-item');
//     api.Clipboard.write(url);
//     api.Front.showBanner(`Copied repo URL: ${url}`);
// }, ghDomain);
// api.mapkey('yi', 'Copy issue/PR title and number', () => {
//     const title = document.querySelector('.gh-header-title').innerText.trim();
//     const url = window.location.href;
//     const text = `${title} (${url})`;
//     api.Clipboard.write(text);
//     api.Front.showBanner(`Copied issue/PR info`);
// }, ghDomain);
//

// --- GOOGLE ---
// const googleDomain = { domain: /google\.com/i };
// // Go to the next/previous search result page
// api.mapkey(']]', 'Next page', () => document.querySelector('#pnnext').click(), googleDomain);
// api.mapkey('[[', 'Previous page', () => document.querySelector('#pnprev').click(), googleDomain);

