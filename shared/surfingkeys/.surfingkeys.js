// ###################################
// # 01_settings.js - Core behaviors #
// ###################################

// INFO: Heard about Use Browser APIs is Faster than RUNTIME
const {
    aceVimMap,
    mapkey,
    imap,
    iunmap,
    imapkey,
    getClickableElements,
    vmap,
    vmapkey,
    map,
    unmap,
    cmap,
    addSearchAlias,
    removeSearchAlias,
    tabOpenLink,
    readText,
    Clipboard,
    Hints,
    Visual,
    Normal,
    RUNTIME,
    Front,
    Insert,
} = api

// --------------------
// | General settings |
// --------------------
settings.showModeStatus = true;

// When total of opened tabs exceeds the number, Omnibar will be used for choosing tabs.
settings.tabsThreshold = 5;

// Improve scrolling
settings.scrollStepSize = 120;
settings.modeAfterYank = 'Normal';

// All custom mappings will start with this key.
// settings.leader = ' ';

// Align hints to the left of links for better readability
settings.hintAlign = "center";

// Ignore specific input fields when in insert mode
// settings.ignoredFrameProps = [
//     /.*mail\.google\.com.*#compose/, // Gmail compose window
//     /.*teams\.microsoft\.com.*/,    // Microsoft Teams
// ];

// -----------------------
// | Settings(with APIs) |
// -----------------------
// Hints.setCharacters('asdfgyuiopqwertnmzxcvb');
// ###############
// # 02_theme.js #
// ###############

// material darker theme for surfingkeys

const hintscss =
    "font-size: 12pt; " +
    "font-family: 'jetbrains mono nl', 'cascadia code', 'helvetica neue', helvetica, arial, sans-serif;" +
    "border: 1px solid #3f3f3f; border-radius: 4px; padding: 2px 4px;" +
    "color: #c3e88d !important; background: #323232; background-color: #323232;" +
    "box-shadow: 0px 2px 5px #1a1a1a;";

api.Hints.style(hintscss);
api.Hints.style(hintscss, "text");

settings.theme = `
  .sk_theme {
    background: #212121; /* background */
    color: #b0bec5; /* foreground */
  }
  .sk_theme input {
    color: #b0bec5; /* foreground */
  }
  .sk_theme .url {
    color: #727272; /* muted text for url */
  }
  .sk_theme .annotation {
    color: #f07178; /* red color */
  }
  .sk_theme kbd {
    background: #2a2a2a; /* buttons */
    color: #b0bec5; /* foreground */
  }
  .sk_theme .frame {
    background: #292929; /* second background */
  }
  .sk_theme .omnibar_highlight {
    color: #c3e88d; /* green color */
  }
  .sk_theme .omnibar_folder {
    color: #b0bec5; /* foreground */
  }
  .sk_theme .omnibar_timestamp {
    color: #89ddff; /* cyan color */
  }
  .sk_theme .omnibar_visitcount {
    color: #89ddff; /* cyan color */
  }
  .sk_theme .prompt, .sk_theme .resultpage {
    color: #b0bec5; /* foreground */
  }
  .sk_theme .feature_name {
    color: #b0bec5; /* foreground */
  }
  .sk_theme .separator {
    color: #616161; /* comments color */
  }
  body {
    margin: 0;
    font-family: "jetbrains mono nl", "cascadia code", "helvetica neue", helvetica, arial, sans-serif;
    font-size: 12px;
  }
  #sk_omnibar {
    background: #212121;
    border-radius: 8px;
    box-shadow: 0px 4px 20px rgba(0,0,0,0.5);
    left: 15%;
    max-height: 80%;
    overflow: hidden;
    position: fixed;
    text-align: left;
    width: 70%;
    z-index: 2147483000;
  }
  .sk_omnibar_middle {
    top: 10%;
    border-radius: 8px;
  }
  .sk_omnibar_bottom {
    bottom: 0;
    border-radius: 4px 4px 0px 0px;
  }
  #sk_omnibarsearcharea {
    border-bottom: 1px solid #3f3f3f;
    padding: 8px 16px;
  }
  #sk_omnibarsearchresult {
    margin: 0;
    padding: 8px;
  }
  #sk_omnibarsearchresult>ul>li {
    padding: 8px;
    border-radius: 4px;
  }
  .sk_theme #sk_omnibarsearchresult>ul>li.focused {
    background: #404040; /* selection background */
  }
`;


// ########################################
// # 03_search.js - Custom search engines #
// ########################################

// TODO: Quick access to specific pages on sites like github, reddit, etc.
// Thinking about using something like this:
//  - ghr for github repo, ghi for github issues, rsub for reddit subreddits, etc.
//  - LLM -> Qwen, Chatgpt, Gemini, Claude, etc.(lq, lc, lg, lc)?

// Remove defaults we don't use
// api.removeSearchAlias('b'); // Baidu
// api.removeSearchAlias('d'); // DuckDuckGo
// api.removeSearchAlias('y'); // YouTube
// api.removeSearchAlias('w'); // Wikipedia

// Add our preferred aliases
// api.addSearchAlias('g', 'Google', 'https://www.google.com/search?q=');
// api.addSearchAlias('gh', 'GitHub', 'https://github.com/search?q=');
// api.addSearchAlias('s', 'Stack Overflow', 'https://stackoverflow.com/search?q=');
// api.addSearchAlias('npm', 'NPM', 'https://www.npmjs.com/search?q=');
// api.addSearchAlias('w', 'Wikipedia', 'https://en.wikipedia.org/wiki/Special:Search/');
// api.addSearchAlias('yt', 'YouTube', 'https://www.youtube.com/results?search_query=');
// api.addSearchAlias('tr', 'Google Translate', 'https://translate.google.com/?sl=auto&tl=en&text=');


// ---- Search Engines -----
// removeSearchAlias('b', 's');
// removeSearchAlias('d', 's');
// removeSearchAlias('g', 's');
// removeSearchAlias('h', 's');
// removeSearchAlias('w', 's');
// removeSearchAlias('y', 's');
// removeSearchAlias('s', 's');

// addSearchAlias('ama', 'amazon', 'https://www.amazon.com/s?k=', 's');
// addSearchAlias('ap', 'arch pkg', 'https://www.archlinux.org/packages/?sort=&q=', 's');
// addSearchAlias('aur', 'aur', 'https://aur.archlinux.org/packages/?O=0&SeB=nd&K=', 's');
// addSearchAlias('aw', 'arch wiki', 'https://wiki.archlinux.org/index.php?title=Special:Search&search=', 's');
// addSearchAlias('d',  'ddg', 'https://duckduckgo.com/?q=', 's');
// addSearchAlias('dh', 'docker', 'https://hub.docker.com/search?type=image&q=', 's');
// addSearchAlias('fh', 'flathub', 'https://flathub.org/apps/search/', 's');
// addSearchAlias('gh', 'github', 'https://github.com/search?q=', 's');
// addSearchAlias('pdb', 'proton', 'https://www.protondb.com/search?q=', 's');
// addSearchAlias('r', 'reddit', 'https://libreddit.spike.codes/r/', 's');
// addSearchAlias('st', 'steam', 'https://store.steampowered.com/search/?term=', 's');
// addSearchAlias('wiki', 'wikipedia', 'https://en.wikipedia.org/wiki/Special:Search/', 's');
// addSearchAlias('y', 'yt', 'https://invidious.snopyta.org/search?q=', 's');


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

// ############################################
// # 06_editor.js - Insert Mode Configuration #
// ############################################
// NOTE: Maybe, Use Kanata, xremap to make system wide customization is better?
// directly map jk to <ESC>, at deeper level
// arrow keys, End, Home(Insert Mode)
// C-l: ESC, C-a: Home, C-e: End
// C-b: <-, C-f: ->, C-k: Delete after cursor, C-u: Delete before cursor

// aceVimMap('jk', '<Esc>', 'insert');
