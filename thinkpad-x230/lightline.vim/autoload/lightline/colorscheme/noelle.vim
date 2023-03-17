" =============================================================================
" Filename: autoload/lightline/colorscheme/solarized.vim
" Author: itchyny
" License: MIT License
" Last Change: 2020/04/06 19:22:53.
" =============================================================================

let s:cuicolors = {
      \ 'base03': [ '8', '234', 'DarkGray' ],
      \ 'base02': [ '0', '235', 'Black' ],
      \ 'base01': [ '10', '239', 'LightGreen' ],
      \ 'base00': [ '11', '240', 'LightYellow' ],
      \ 'base0':  [ '12', '244', 'LightBlue' ],
      \ 'base1':  [ '14', '245', 'LightCyan' ],
      \ 'base2': [ '7', '187', 'LightGray' ],
      \ 'basetam': [ '7', '187', 'LightGray' ],
      \ 'basetam2': [ '7', '187', 'LightGray' ],
      \ 'base3': [ '15', '230', 'White' ],
      \ 'yellow': [ '3', '136', 'DarkYellow' ],
      \ 'orange': [ '9', '166', 'LightRed' ],
      \ 'red': [ '1', '124', 'DarkRed' ],
      \ 'magenta': [ '5', '125', 'DarkMagenta' ],
      \ 'violet': [ '13', '61', 'LightMagenta' ],
      \ 'blue': [ '4', '33', 'DarkBlue' ],
      \ 'cyan': [ '6', '37', 'DarkCyan' ],
      \ 'green': [ '2', '64', 'DarkGreen' ],
      \ }

" The following condition only applies for the console and is the same
" condition vim-colors-solarized uses to determine which set of colors
" to use.
let s:solarized_termcolors = get(g:, 'solarized_termcolors', 256)
if s:solarized_termcolors != 256 && &t_Co >= 16
  let s:cuiindex = 0
elseif s:solarized_termcolors == 256
  let s:cuiindex = 1
else
  let s:cuiindex = 2
endif


let s:basetam = [ '#250E07', s:cuicolors.basetam[s:cuiindex] ]
let s:basetam2 = [ '#BB9791', s:cuicolors.basetam[s:cuiindex] ]
let s:base03 = [ '#002b36', s:cuicolors.base03[s:cuiindex] ]
let s:base02 = [ '#F2CC60', s:cuicolors.base02[s:cuiindex] ]
let s:base01 = [ '#E7A09E', s:cuicolors.base01[s:cuiindex] ]
let s:base00 = [ '#657b83', s:cuicolors.base00[s:cuiindex] ]
let s:base0 = [ '#E2C9C5', s:cuicolors.base0[s:cuiindex] ]
let s:base1 = [ '#93a1a1', s:cuicolors.base1[s:cuiindex] ]
let s:base2 = [ '#F3EAE9', s:cuicolors.base2[s:cuiindex] ]
let s:base3 = [ '#F0DFDD', s:cuicolors.base3[s:cuiindex] ]
let s:yellow = [ '#D4A520', s:cuicolors.yellow[s:cuiindex] ]
let s:orange = [ '#cb4b16', s:cuicolors.orange[s:cuiindex] ]
let s:red = [ '#dc322f', s:cuicolors.red[s:cuiindex] ]
let s:magenta = [ '#D68482', s:cuicolors.magenta[s:cuiindex] ]
let s:violet = [ '#ECC3C2', s:cuicolors.violet[s:cuiindex] ]
let s:blue = [ '#268bd2', s:cuicolors.blue[s:cuiindex] ]
let s:cyan = [ '#2aa198', s:cuicolors.cyan[s:cuiindex] ]
let s:green = [ '#ADC185', s:cuicolors.green[s:cuiindex] ]

if lightline#colorscheme#background() ==# 'light'
  let [ s:base03, s:base3 ] = [ s:base3, s:base03 ]
  let [ s:base02, s:base2 ] = [ s:base2, s:base02 ]
  let [ s:base01, s:base1 ] = [ s:base1, s:base01 ]
  let [ s:base00, s:base0 ] = [ s:base0, s:base00 ]
endif

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:basetam, s:base1 ], [ s:basetam, s:base00 ] ]
let s:p.normal.right = [ [ s:basetam, s:base1 ], [ s:basetam, s:base00 ] ]
let s:p.inactive.right = [ [ s:base02, s:base00 ], [ s:basetam2, s:base03 ] ]
let s:p.inactive.left =  [ [ s:basetam2, s:base02 ], [ s:base0, s:base02 ] ]
let s:p.insert.left = [ [ s:basetam, s:yellow ], [ s:basetam, s:base00 ] ]
let s:p.replace.left = [ [ s:base03, s:red ], [ s:basetam, s:base00 ] ]
let s:p.visual.left = [ [ s:basetam, s:violet ], [ s:basetam, s:base00 ] ]
let s:p.normal.middle = [ [ s:basetam2, s:base02 ] ]
let s:p.inactive.middle = [ [ s:basetam2, s:base02 ] ]
let s:p.tabline.left = [ [ s:basetam, s:base02 ] ]
let s:p.tabline.tabsel = [ [ s:basetam, s:base2 ] ]
let s:p.tabline.middle = [ [ s:base0, s:base02 ] ]
let s:p.tabline.right = copy(s:p.tabline.left)
let s:p.normal.error = [ [ s:base03, s:red ] ]
let s:p.normal.warning = [ [ s:base03, s:yellow ] ]

let g:lightline#colorscheme#noelle#palette = lightline#colorscheme#flatten(s:p)

