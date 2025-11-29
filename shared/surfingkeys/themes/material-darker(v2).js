// ┌───────────────────────────────────────────┐
// │  Material Darker Theme for SurfingKeys    |
// │  FIXED: No white cards • Uses !important  |
// └───────────────────────────────────────────┘

const hintsCss =
    "font-size: 12pt; " +
    "font-family: 'JetBrains Mono NL', 'Cascadia Code', 'SF Mono', 'Monaco', 'Consolas', monospace; " +
    "border: 1px solid #FF9800; border-radius: 4px; padding: 2px 6px; " +
    "color: #FFFFFF !important; background: #323232; " +
    "box-shadow: 0 2px 6px rgba(0, 0, 0, 0.4);";

api.Hints.style(hintsCss);
api.Hints.style(hintsCss, "text");

settings.theme = `
  .sk_theme {
    background: #212121;
    color: #ECEFF1;
  }
  .sk_theme input {
    color: #ECEFF1;
  }
  .sk_theme .url {
    color: #9E9E9E;
  }
  .sk_theme .annotation {
    color: #FF8A80;
  }
  .sk_theme kbd {
    background: #2A2A2A;
    color: #ECEFF1;
    border: 1px solid #424242;
    border-radius: 3px;
    padding: 2px 6px;
  }
  .sk_theme .frame {
    background: #292929;
  }
  .sk_theme .omnibar_highlight {
    color: #C3E88D;
    font-weight: bold;
  }
  .sk_theme .omnibar_folder {
    color: #CE93D8;
  }
  .sk_theme .omnibar_timestamp,
  .sk_theme .omnibar_visitcount {
    color: #89DDFF;
  }
  .sk_theme .prompt,
  .sk_theme .resultPage {
    color: #9E9E9E;
  }
  .sk_theme .feature_name {
    color: #80CBC4;
  }
  .sk_theme .separator {
    color: #757575;
  }

  body {
    margin: 0;
    font-family: "JetBrains Mono NL", "Cascadia Code", "SF Mono", "Monaco", "Consolas", monospace;
    font-size: 12px;
  }

  #sk_omnibar {
    background: #212121;
    border-radius: 8px;
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.6);
    left: 15%;
    width: 70%;
    max-height: 80%;
    position: fixed;
    text-align: left;
    z-index: 2147483000;
    overflow: hidden;
  }

  .sk_omnibar_middle {
    top: 10%;
    border-radius: 8px;
  }

  .sk_omnibar_bottom {
    bottom: 0;
    border-radius: 8px 8px 0 0;
  }

  #sk_omnibarSearchArea {
    display: flex;
    align-items: center;
    padding: 10px 16px;
    border-bottom: 1px solid #3F3F3F;
  }

  #sk_omnibarSearchArea > input {
    flex: 1;
    font-size: 18px;
    background: transparent;
    border: none;
    outline: none;
    color: #ECEFF1;
  }

  /* ── SEARCH RESULTS (FORCED) ──────────────────── */
  #sk_omnibarSearchResult {
    margin: 0;
    padding: 8px;
    max-height: 60vh;
    overflow-y: auto;
    background: #212121 !important;
  }

  #sk_omnibarSearchResult > ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }

  #sk_omnibarSearchResult > ul > li {
    padding: 8px 12px !important;
    border-radius: 4px !important;
    margin-bottom: 2px !important;
    display: flex !important;
    justify-content: space-between !important;
    align-items: flex-start !important;
    color: #ECEFF1 !important;
    background: transparent !important;
    transition: background 0.15s ease !important;
  }

  #sk_omnibarSearchResult > ul > li.focused {
    background: #3F3F3F !important;
    box-shadow: 0 0 0 1px #89DDFF inset !important;
  }

  #sk_omnibarSearchResult > ul > li:hover {
    background: #2A2A2A !important;
  }

  #sk_omnibarSearchResult .title {
    flex: 1;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    color: #ECEFF1 !important;
  }

  #sk_omnibarSearchResult .url {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    color: #9E9E9E !important;
    font-size: 13px !important;
    width: 100% !important;
  }

  #sk_omnibarSearchResult .focused .url {
    white-space: normal !important;
  }

  #sk_omnibarSearchResult .annotation {
    color: #FF8A80 !important;
    margin-left: 12px !important;
    flex-shrink: 0 !important;
    font-size: 12px !important;
  }

  #sk_omnibarSearchResult .icon {
    width: 16px !important;
    height: 16px !important;
    margin-right: 8px !important;
    color: #9E9E9E !important;
    flex-shrink: 0 !important;
  }

  #sk_status {
    position: fixed;
    bottom: 0;
    right: 20%;
    z-index: 2147483000;
    padding: 4px 10px;
    border-radius: 4px 4px 0 0;
    border: 1px solid #3F3F3F;
    background: #212121;
    color: #ECEFF1;
    font-size: 12px;
  }

  #sk_keystroke {
    position: fixed;
    bottom: 0;
    right: 0;
    z-index: 2147483000;
    padding: 6px 10px;
    background: #212121;
    color: #FF9800;
    font-family: monospace;
    font-weight: bold;
  }

  #sk_usage {
    background: #212121;
    border-radius: 8px;
    box-shadow: 0 8px 30px rgba(0,0,0,0.6);
    padding: 1rem;
  }

  #sk_usage .kbd-span {
    width: 90px;
    text-align: right;
    color: #89DDFF;
  }

  #sk_usage .feature_name > span {
    border-bottom: 2px solid #80CBC4;
  }

  #sk_banner {
    background: #212121;
    border: 1px solid #FF8A80;
    color: #FF8A80;
    border-radius: 4px;
    padding: 6px 12px;
    position: fixed;
    left: 15%;
    top: -3rem;
    width: 70%;
    text-align: center;
    z-index: 2147483000;
    transition: top 0.3s ease;
  }

  #sk_tabs {
    background: rgba(33, 33, 33, 0.95);
  }

  div.sk_tab {
    background: #292929;
    border: 1px solid #3F3F3F;
    border-radius: 6px;
    padding: 10px 16px;
    margin: 6px;
    color: #ECEFF1;
  }

  div.sk_tab_title { color: #ECEFF1; }
  div.sk_tab_url { color: #9E9E9E; }
  div.sk_tab_hint {
    background: #323232;
    color: #FF9800;
    border: 1px solid #FF9800;
    border-radius: 4px;
    padding: 2px 6px;
    font-weight: bold;
  }

  #sk_bubble {
    background: #212121;
    color: #ECEFF1;
    border: 1px solid #3F3F3F;
    border-radius: 6px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.6);
    padding: 10px;
  }

  #sk_bubble * {
    color: #ECEFF1 !important;
  }

  @media only screen and (max-width: 767px) {
    #sk_omnibar {
      width: 95%;
      left: 2.5%;
    }
    #sk_omnibarSearchResult {
      max-height: 50vh;
    }
  }

  /* ── FORCE THEME COLORS ON ALL ELEMENTS ────────── */
  .sk_theme * {
    background-color: inherit !important;
    color: inherit !important;
    border-color: #3F3F3F !important;
  }
`;
