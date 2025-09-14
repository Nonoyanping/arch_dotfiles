// main.js - The Ultimate Surfingkeys Loader

console.log("🚀 Welcome to the Ultimate Surfingkeys Configuration! Loading...");

// =================================================================================
//      CONFIGURATION
// =================================================================================
// IMPORTANT: Replace with your GitHub username and repository name!
// https://raw.githubusercontent.com/Nonoyanping/arch_dotfiles/refs/heads/main/surfingkeys/.surfingkeys.js
const config = {
    username: "Nonoyanping",
    repo: "arch_dotfiles/refs/heads/main/surfingkeys",
};
// =================================================================================

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
            console.log(`↳ Loading module: ${module}`);
            await import(url);
        }
        console.log("✅ All modules loaded successfully!");
        api.Front.showBanner("Ultimate Surfingkeys config loaded!", 1500);
    } catch (error) {
        console.error("❌ Error loading Surfingkeys modules:", error);
        api.Front.showBanner("❌ Error loading Surfingkeys config. See console.", 5000);
    }
}

loadModules();
