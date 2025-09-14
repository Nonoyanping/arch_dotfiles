// main.js - The Ultimate Surfingkeys Loader (v2 - with fetch/eval)

console.log("🚀 Welcome to the Ultimate Surfingkeys Configuration! Loading...");

// =================================================================================
//      CONFIGURATION
// =================================================================================
// IMPORTANT: Make sure this matches your GitHub username and repository name!
const config = {
    username: "Nonoyanping", // I've updated this to your username from the error log
    repo: "arch_dotfiles/refs/heads/main/surfingkeys",   // and your repo name
};
// =================================================================================

// NOTE: Your URL from the error log had "refs/heads/" in it.
// The standard raw URL usually doesn't. We will build the standard one.
// https://raw.githubusercontent.com/Nonoyanping/arch_dotfiles/refs/heads/main/surfingkeys/main.js
const baseUrl = `https://raw.githubusercontent.com/${config.username}/${config.repo}/`;

const modules = [
    '01_settings.js',
    '02_theme.js',
    '03_search.js',
    '04_mappings.js',
    '05_sites.js'
];

async function loadModules() {
    try {
        for (const module of modules) {
            const url = baseUrl + module;
            console.log(`↳ Fetching module: ${module}`);

            // 1. Fetch the code as plain text
            const response = await fetch(url);
            const scriptText = await response.text();

            // 2. Execute the text as JavaScript
            eval(scriptText);
        }
        console.log("✅ All modules loaded successfully!");
        api.Front.showBanner("Ultimate Surfingkeys config loaded!", 1500);
    } catch (error) {
        console.error("❌ Error loading Surfingkeys modules:", error);
        api.Front.showBanner(`❌ Error loading: ${error.message}. See console.`, 5000);
    }
}

loadModules();
