// -----------------------------------
// | 01_settings.js - Core behaviors |
// -----------------------------------
// Set the leader key. The comma is a good choice because it's easy to reach.
// All custom mappings will start with this key.
settings.leader = ' ';

// Ignore specific input fields when in insert mode
settings.ignoredFrameProps = [
    /.*mail\.google\.com.*#compose/, // Gmail compose window
    /.*teams\.microsoft\.com.*/,    // Microsoft Teams
];

// Improve scrolling
settings.smoothScroll = true;
settings.scrollStepSize = 120;

// Align hints to the left of links for better readability
settings.hintAlign = "left";

// Don't let the omnibar get too long
settings.omnibarMaxResults = 10;


