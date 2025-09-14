{
"blocklist": {},
"cmdHistory": [
"createTabGroup sk",
"listSession",
"createTabGroup a"
],
"findHistory": [
"visual",
"bookmark"
],
"lastKeys": [
"yj"
],
"localPath": "http://localhost:1717/surfingkeys/.surfingkeys.js",
"marks": {
"u": {
"url": "about:blank",
"scrollLeft": 0,
"scrollTop": 0
},
"ㄠ": {
"url": "about:blank",
"scrollLeft": 0,
"scrollTop": 0
}
},
"savedAt": 1757818463885,
"showAdvanced": true,
"snippets": "// ~/dotfiles/surfingkeys/.surfingkeys.js\n\n// Load external configs\ntry {\n    // Load theme first (so mappings can rely on it)\n    include('./theme.js');\n    // Then load key mappings\n    include('./main.js');\n} catch (e) {\n    console.error('Failed to load SurfingKeys config:', e.message);\n}\n\n// Optional: Print success message\nconsole.log('✅ SurfingKeys config loaded: main.js + theme.js');\n"
}
