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
