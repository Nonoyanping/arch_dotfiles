// 03_search.js - Custom search engines

// Remove defaults we don't use
api.removeSearchAlias('b'); // Baidu
api.removeSearchAlias('d'); // DuckDuckGo
api.removeSearchAlias('y'); // YouTube
api.removeSearchAlias('w'); // Wikipedia

// Add our preferred aliases
api.addSearchAlias('g', 'Google', 'https://www.google.com/search?q=');
api.addSearchAlias('gh', 'GitHub', 'https://github.com/search?q=');
api.addSearchAlias('s', 'Stack Overflow', 'https://stackoverflow.com/search?q=');
api.addSearchAlias('npm', 'NPM', 'https://www.npmjs.com/search?q=');
api.addSearchAlias('w', 'Wikipedia', 'https://en.wikipedia.org/wiki/Special:Search/');
api.addSearchAlias('yt', 'YouTube', 'https://www.youtube.com/results?search_query=');
api.addSearchAlias('tr', 'Google Translate', 'https://translate.google.com/?sl=auto&tl=en&text=');
