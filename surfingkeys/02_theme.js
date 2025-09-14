// 02_theme.js - A clean theme based on the Nord color palette

settings.theme = `
/* Use CSS variables for easy customization */
:root {
    --font: 'Input Sans Condensed', 'JetBrains Mono', 'Fira Code', monospace;
    --font-size: 12;
    --font-weight: 500;

    /* Nord Theme Colors */
    --nord0: #2E3440; /* Polar Night */
    --nord1: #3B4252;
    --nord3: #4C566A;
    --nord4: #D8DEE9; /* Snow Storm */
    --nord6: #ECEFF4;
    --nord8: #88C0D0; /* Frost */
    --nord10: #5E81AC;
    --nord14: #A3BE8C; /* Aurora Green */
}

/* Main UI Elements */
#sk_omnibar, #sk_status, #sk_keystroke, .sk_theme {
    font-family: var(--font);
    font-size: var(--font-size);
    font-weight: var(--font-weight);
    background: var(--nord0);
    color: var(--nord4);
    border: 1px solid var(--nord3);
}

/* Omnibar Search Prompt & Query */
#sk_omnibar .prompt, #sk_omnibar .query { color: var(--nord8); }
#sk_omnibar .separator { color: var(--nord10); }

/* Omnibar Results */
#sk_omnibar .omnibar_highlight { color: var(--nord14); }
#sk_omnibar .omnibar_folder { color: var(--nord10); }
#sk_omnibar .omnibar_visitcount { color: var(--nord8); }
#sk_omnibar .omnibar_url { color: var(--nord4); font-weight: 400; }
#sk_omnibar li.selected { background: var(--nord1); }

/* Hints */
#sk_hints > div {
    font-family: var(--font);
    font-weight: var(--font-weight);
    background: var(--nord8);
    color: var(--nord0);
    border: none;
}
`;
