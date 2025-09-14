// 04_mappings.js - Powerful, general-purpose mappings

// --- NAVIGATION ---
api.map('h', 'S'); // Back in history
api.map('l', 'D'); // Forward in history

// --- TAB MANAGEMENT ---
api.map('gT', 'E'); // Go to previous tab
api.map('gt', 'R'); // Go to next tab
api.map('gC', 'x'); // Close current tab
api.map('gX', 'X'); // Restore closed tab

// --- LEADER KEY MAPPINGS ---
// All our custom commands will live under the leader key (,)

// ,s - Open Surfingkeys settings
api.mapkey('<Leader>s', 'Edit Surfingkeys settings', () => api.RUNTIME('openSettings'));

// ,t - Toggle a setting temporarily
api.mapkey('<Leader>t', 'Toggle Smooth Scrolling', () => {
    settings.smoothScroll = !settings.smoothScroll;
    const status = settings.smoothScroll ? "enabled" : "disabled";
    api.Front.showBanner(`Smooth scrolling ${status}`);
});

// ,m - Copy current URL and Title as Markdown
api.mapkey('<Leader>m', 'Copy URL and Title as Markdown', () => {
    const markdown = `[${document.title}](${window.location.href})`;
    api.Clipboard.write(markdown);
    api.Front.showBanner(`Copied Markdown link!`, 2000);
});

// ,p - Pin/unpin current tab
api.mapkey('<Leader>p', 'Pin/unpin tab', () => api.RUNTIME('togglePinTab'));
