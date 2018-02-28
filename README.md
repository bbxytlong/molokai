# Molokai Color Scheme for Vim

Molokai is a Vim port of the monokai theme for TextMate originally created by Wimer Hazenberg.

By default, it has a dark gray background based on the version created by Hamish Stuart Macpherson for the E editor.

![Gray Background](http://www.winterdom.com/weblog/content/binary/WindowsLiveWriter/MolokaiforVim_8602/molokai_normal_small_3.png)

![Molokai Original](http://www.winterdom.com/weblog/content/binary/WindowsLiveWriter/MolokaiforVim_8602/molokai_original_small_3.png)

256-Color terminals are also supported, though there are some differences with the Gui version. Only the dark gray background style is supported on terminal vim at this time.

## Installation

Copy the file on your .vim/colors and .vim/syntaxs folder.

If you prefer the scheme to match the original monokai background color, put this in your .vimrc file: 
```
let g:molokai_original = 1
```

There is also an alternative scheme under development for color terminals which attempts to bring the 256 color version as close as possible to the the default (dark) GUI version. To access, add this to your .vimrc:
```
let g:rehash256 = 1
```

## Syntax

If you prefer the scheme to highlight the syntax, put this in your .vimrc file: 
```
let g:molokai_original = 1
" c/cpp syntax
let g:c_highlight_brace = 1
let g:c_highlight_macro = 1
let g:c_highlight_functions = 1
let g:c_highlight_operators = 1
let g:c_highlight_custom_type_ts = 1
" go syntax
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_custom_type_ts = 1
let g:go_highlight_brace = 1
" lua syntax
let g:lua_highlight_function_name = 1
```

## Custom Syntax

Put `syntax/workspace_syntax.vim` to your project and rename to `.workspace_syntax.vim`, you can write yourself syntax. Like keyword.


