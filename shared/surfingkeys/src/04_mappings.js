// #######################################################
// # 04_mappings.js - Powerful, general-purpose mappings #
// #######################################################
// At the TOP of your Surfingkeys settings
// 1. Erase all default normal-mode keybindings.
// unmapAllExcept([]);

// 2. Now, build YOUR default keymap from the ground up.
//    You are now "directly modifying" the effective keymap.
// Basic Navigation
// mapkey('j', '#4Scroll down', 'Normal.scroll("down")');
// mapkey('k', '#4Scroll up', 'Normal.scroll("up")');
// mapkey('h', '#4Scroll left', 'Normal.scroll("left")');
// mapkey('l', '#4Scroll right', 'Normal.scroll("right")');
// mapkey('G', '#4Scroll to bottom', 'Normal.scroll("bottom")');
// mapkey('gg', '#4Scroll to top', 'Normal.scroll("top")');

// Tab Control
// mapkey('d', '#1Close current tab', 'RUNTIME("closeTab")');
// mapkey('u', '#1Undo close tab', 'RUNTIME("openLast")');
// mapkey('t', '#1Open a new tab', 'RUNTIME("openTab")');

// History
// mapkey('H', '#2Go back in history', 'history.go(-1)');
// mapkey('L', '#2Go forward in history', 'history.go(1)');

// You get the idea...




// --- NAVIGATION ---
map('h', 'S'); // Back in history
map('l', 'D'); // Forward in history

// --- TAB MANAGEMENT ---
// api.map('gT', 'E'); // Go to previous tab
// api.map('gt', 'R'); // Go to next tab
// api.map('gC', 'x'); // Close current tab
// api.map('gX', 'X'); // Restore closed tab

// --- LEADER KEY MAPPINGS ---
// All our custom commands will live under the leader key (,)

// ,s - Open Surfingkeys settings
// api.mapkey('<Leader>s', 'Edit Surfingkeys settings', () => api.RUNTIME('openSettings'));

// ,t - Toggle a setting temporarily
// api.mapkey('<Leader>t', 'Toggle Smooth Scrolling', () => {
//     settings.smoothScroll = !settings.smoothScroll;
//     const status = settings.smoothScroll ? "enabled" : "disabled";
//     api.Front.showBanner(`Smooth scrolling ${status}`);
// });

// ,m - Copy current URL and Title as Markdown
// api.mapkey('<Leader>m', 'Copy URL and Title as Markdown', () => {
//     const markdown = `[${document.title}](${window.location.href})`;
//     api.Clipboard.write(markdown);
//     api.Front.showBanner(`Copied Markdown link!`, 2000);
// });

// ,p - Pin/unpin current tab
// api.mapkey('<Leader>p', 'Pin/unpin tab', () => api.RUNTIME('togglePinTab'));

// --- QUICK ACCESS TO SPECIFIC SITES ---
// === Quick Access to LLMs ===
// lq - open chat.qwen.ai
// == 工具函数：一键注册 LLM 快捷键 ==
// function registerLLM(shortcut, name, url) {
//     mapkey(shortcut, `#8Open ${name} Chat`, async () => {
//         try {
//             // 检查是否已打开，避免重复标签页
//             const tabs = await browser.tabs.query({ url: `${url}/*` });
//             if (tabs.length > 0) {
//                 await browser.tabs.update(tabs[0].id, { active: true });
//                 Front.showBanner(`✅ Switched to ${name}`, 1500);
//             } else {
//                 await browser.tabs.create({ url, active: true });
//                 Front.showBanner(`✅ Opened ${name}`, 1500);
//             }
//         } catch (err) {
//             Front.showBanner(`❌ Failed to open ${name}: ${err.message}`, 3000);
//             console.error(err);
//         }
//     });
// }
//
// // == 注册你的 LLM 们 ==
// registerLLM('lq', '通义千问', 'https://chat.qwen.ai');
// registerLLM('lg', 'Gemini', 'https://gemini.google.com');
// registerLLM('lc', 'Claude', 'https://claude.ai');
// registerLLM('ly', '腾讯元宝', 'https://yuanbao.tencent.com');
// registerLLM('ld', '豆包', 'https://www.doubao.com');
// registerLLM('lk', 'Kimi', 'https://kimi.moonshot.cn');
// registerLLM('lp', 'Perplexity', 'https://www.perplexity.ai');
// registerLLM('lo', 'OpenAI', 'https://chat.openai.com');

// mapkey('lq', '#8Open Qwen Chat', () => {
//     browser.tabs.create({
//         url: 'https://chat.qwen.ai',
//         active: true
//     });
// });

// mapkey('', '#3Open Qwen.ai', function () {
//     tabOpenLink("https://chat.qwen.ai/");
// });


