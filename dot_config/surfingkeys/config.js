const {
  aceVimMap,
  mapkey,
  unmap,
  unmapAllExcept,
  vunmap,
  iunmap,
  imap,
  imapkey,
  getClickableElements,
  vmapkey,
  vmap,
  map,
  cmap,
  addSearchAlias,
  removeSearchAlias,
  tabOpenLink,
  readText,
  Clipboard,
  Front,
  Hints,
  Visual,
  Normal,
  RUNTIME,
} = api;

unmap('w');


map("<Ctrl-d>", "d")
map("<Ctrl-u>", "u")

// map("<Ctrl-o>", "S")
// map("<Ctrl-i>", "D")

//tab navigation
// map('H', 'E'); //move to tab to the left
// map('L', 'R'); //move to tab on the right
unmap('H');
unmap('L');
map('<Space>fm', 'om');

//tab manipulation
map('ww', 'x'); //close tab
map('wo', 'gxx'); //close all other tabs
map('wh', 'gx0') //close to the left
map('wl', 'gx$') //close to the right

map('u', 'X'); //undo close tab

//opening stuff
map('o', 'go'); //open in current tab
map('O', 't'); //open in new tab
map('F', 'af')
//open bookmark in current tab
// map('b', 'bO');
unmap('t') 
map('tp', '<Alt-p>') //pin tab

unmap('E');
unmap('R');
unmap('d');
unmap("X");

unmap('h');

settings.modeAfterYank = 'Normal';
unmapAllExcept(['o', 'O', 'b', 'B'], /bento/);
settings.blacklistPattern = /trello.com/;
