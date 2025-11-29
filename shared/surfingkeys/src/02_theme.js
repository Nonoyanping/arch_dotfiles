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


