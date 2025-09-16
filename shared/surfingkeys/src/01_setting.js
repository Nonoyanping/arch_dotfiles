// ###################################
// # 01_settings.js - Core behaviors #
// ###################################
const {
    aceVimMap,
    mapkey: mapkey_,
    imap,
    iunmap,
    imapkey: imapkey_,
    getClickableElements,
    vmap,
    vmapkey: vmapkey_,
    map: nmap,
    unmap: nunmap,
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
settings.tabsThreshold = 0;

// Improve scrolling
settings.scrollStepSize = 120;
settings.modeAfterYank = 'Normal';

// All custom mappings will start with this key.
settings.leader = ' ';

// Ignore specific input fields when in insert mode
// settings.ignoredFrameProps = [
//     /.*mail\.google\.com.*#compose/, // Gmail compose window
//     /.*teams\.microsoft\.com.*/,    // Microsoft Teams
// ];

// Align hints to the left of links for better readability
settings.hintAlign = "left";


// -----------------------
// | Settings(with APIs) |
// -----------------------
// Hints.setCharacters('asdfgyuiopqwertnmzxcvb');
