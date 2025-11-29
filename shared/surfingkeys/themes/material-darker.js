// Material Darker(v1)

const hintsCss =
    "font-size: 12pt; " +
    "font-family: 'JetBrains Mono NL', 'Cascadia Code', 'Helvetica Neue', Helvetica, Arial, sans-serif; " +
    "border: 1px solid #3F3F3F; border-radius: 4px; padding: 2px 4px; " +
    "color: #FF9800 !important; background: #323232; background-color: #323232; " +
    "box-shadow: 0px 2px 5px #1A1A1A;";

api.Hints.style(hintsCss);
api.Hints.style(hintsCss, "text");

settings.theme = `
  .sk_theme {
    background: #212121; /* Background */
    color: #B0BEC5; /* Foreground */
  }
  .sk_theme input {
    color: #B0BEC5; /* Foreground */
  }
  .sk_theme .url {
    color: #727272; /* Muted Text for URL */
  }
  .sk_theme .annotation {
    color: #f07178; /* Red Color */
  }
  .sk_theme kbd {
    background: #2A2A2A; /* Buttons */
    color: #B0BEC5; /* Foreground */
    border: 1px solid #3F3F3F;
  }
  .sk_theme .frame {
    background: #292929; /* Second Background */
  }
  .sk_theme .omnibar_highlight {
    color: #c3e88d; /* Green Color */
  }
  .sk_theme .omnibar_folder {
    color: #B0BEC5; /* Foreground */
  }
  .sk_theme .omnibar_timestamp {
    color: #89ddff; /* Cyan Color */
  }
  .sk_theme .omnibar_visitcount {
    color: #89ddff; /* Cyan Color */
  }
  .sk_theme .prompt, .sk_theme .resultPage {
    color: #B0BEC5; /* Foreground */
  }
  .sk_theme .feature_name {
    color: #c792ea; /* Purple Color */
  }
  .sk_theme .separator {
    color: #616161; /* Comments Color */
  }
  body {
    margin: 0;
    font-family: "JetBrains Mono NL", "Cascadia Code", "Helvetica Neue", Helvetica, Arial, sans-serif;
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
  #sk_omnibarSearchArea {
    border-bottom: 1px solid #3F3F3F;
    padding: 8px 16px;
  }
  #sk_omnibarSearchResult {
    margin: 0;
    padding: 8px;
  }
  #sk_omnibarSearchResult>ul>li {
    padding: 8px;
    border-radius: 4px;
  }
  .sk_theme #sk_omnibarSearchResult>ul>li.focused {
    background: #404040; /* Selection Background */
  }
  
  #sk_usage, #sk_popup, #sk_editor {
    background: #212121 !important; /* Background */
    color: #B0BEC5 !important; /* Foreground */
    border-radius: 8px;
    box-shadow: 0px 4px 20px rgba(0,0,0,0.5);
    padding: 1rem;
    overflow: auto;
    position: fixed;
    text-align: left;
    z-index: 2147483298;
  }

  #sk_usage {
    width: 80%;
    max-height: 80%;
    top: 10%;
    left: 10%;
  }

  #sk_usage .feature_name>span {
    border-bottom: 2px solid #B0BEC5;
  }
  
  #sk_usage span.annotation {
    color: #727272;
  }

`;

