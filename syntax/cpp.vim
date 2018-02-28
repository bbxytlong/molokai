" Vim syntax file
" Language:	C++
" Current Maintainer:	vim-jp (https://github.com/vim-jp/vim-cpp)
" Previous Maintainer:	Ken Shan <ccshan@post.harvard.edu>
" Last Change:	2015 May 04

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
if version < 600
  so <sfile>:p:h/c.vim
else
  runtime! syntax/c.vim
  unlet b:current_syntax
endif

" C++ extensions
syn keyword cppStatement	new delete this friend using
syn keyword cppAccess		public protected private
syn keyword cppType		inline virtual explicit export bool wchar_t
syn keyword cppExceptions	throw try catch
syn keyword cppOperator		operator typeid
syn keyword cppOperator		and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword cppStorageClass	mutable
syn keyword cppStructure	class typename template namespace
syn keyword cppBoolean		true false
syn keyword cppConstant		__cplusplus

" C++ 11 extensions
if !exists("cpp_no_cpp11")
  syn keyword cppType		override final
  syn keyword cppExceptions	noexcept
  syn keyword cppStorageClass	constexpr decltype thread_local
  syn keyword cppConstant	nullptr
  syn keyword cppConstant	ATOMIC_FLAG_INIT ATOMIC_VAR_INIT
  syn keyword cppConstant	ATOMIC_BOOL_LOCK_FREE ATOMIC_CHAR_LOCK_FREE
  syn keyword cppConstant	ATOMIC_CHAR16_T_LOCK_FREE ATOMIC_CHAR32_T_LOCK_FREE
  syn keyword cppConstant	ATOMIC_WCHAR_T_LOCK_FREE ATOMIC_SHORT_LOCK_FREE
  syn keyword cppConstant	ATOMIC_INT_LOCK_FREE ATOMIC_LONG_LOCK_FREE
  syn keyword cppConstant	ATOMIC_LLONG_LOCK_FREE ATOMIC_POINTER_LOCK_FREE
  syn region cppRawString	matchgroup=cppRawStringDelimiter start=+\%(u8\|[uLU]\)\=R"\z([[:alnum:]_{}[\]#<>%:;.?*\+\-/\^&|~!=,"']\{,16}\)(+ end=+)\z1"+ contains=@Spell
endif

" The minimum and maximum operators in GNU C++
syn match cppMinMax "[<>]?"

" Function
if !exists("g:c_highlight_functions")
  let g:c_highlight_functions = 0
endif
if g:c_highlight_functions isnot 0
    syn match	cppUserFunction	display "[a-zA-Z_]\w*("me=e-1
    " Rpc
    syn match Rpc		display "rpc_client_\w*("me=e-1
    syn match Rpc		display "rpc_server_\w*("me=e-1
endif

" Operation
if !exists("g:c_highlight_operators")
  let g:c_highlight_operators= 0
endif
if g:c_highlight_operators isnot 0
    syntax match cppUserOperation display "[?:\.+=\-&|~%^]"
    syntax match cppUserOperation display "[<>!]"
    syntax match cppUserOperation display "[<>!]="
    syntax match cppUserOperation display "[+=\-&|~]="
    syntax match cppUserOperation display "\(&&\|||\)"
    syntax match cppUserOperation display "\(&&\|||\)$"
    syntax match cppUserOperation display "!"
    syntax match cppUserOperation display ";"
    syntax match cppUserOperation display ","
    syntax match cppUserOperation display "++"
    syntax match cppUserOperation display ">>=\?"
    syntax match cppUserOperation display "<<=\?"
    syntax match cppUserOperation display "--"
    syntax match cppUserOperation display "/="
    syntax match cppUserOperation display "*="
    syntax match cppUserOperation display "[\[\]]"
    " Filter Comment
    syntax match cppUserOperation display "/[^/*]"me=e-1
    syntax match cppUserOperation display "*[^/]"me=e-1
    syntax match cppUserOperation display "*$"
    syntax match cppUserOperation display "/$"
endif

" Brace
if !exists("g:c_highlight_brace")
  let g:c_highlight_brace= 0
endif
if g:c_highlight_brace isnot 0
    syntax match cppBrace     display "{"
    syntax match cppBrace     display "}"
endif

" Macro
if !exists("g:c_highlight_macro")
  let g:c_highlight_macro= 0
endif
if g:c_highlight_macro isnot 0
    syntax match cppUserMacro1    display  "[^a-zA-Z0-9_"][A-Z_][A-Z0-9_][A-Z0-9_]*[^a-zA-Z0-9_"]"hs=s+1,he=e-1,ms=s+1,me=e-1
    syntax match cppUserMacro2    display  "^[A-Z_][A-Z0-9_][A-Z0-9_]*[^a-zA-Z0-9_"]"he=e-1,me=e-1
endif

" Type
if !exists("g:c_highlight_custom_type_ts")
  let g:c_highlight_custom_type_ts = 0
endif
if g:c_highlight_custom_type_ts isnot 0
    syntax match cppUserType      display "[a-zA-Z_][a-zA-Z0-9_]*_[ts][^a-zA-Z0-9_]"me=e-1
endif

" Read the Project Custom syntax to start with
runtime! syntax/workspace_syntax.vim
let b:current_syntax_custom_file = expand("%:p:h")."/.workspace_syntax.vim"
if filereadable(b:current_syntax_custom_file)
    so %:p:h/.workspace_syntax.vim
endif
" echom b:current_syntax_custom_file


" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
  if version < 508
    let did_cpp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink cppAccess		cppStatement
  HiLink cppCast		cppStatement
  HiLink cppExceptions		Exception
  HiLink cppOperator		Operator
  HiLink cppStatement		Statement
  HiLink cppType		Type
  HiLink cppStorageClass	StorageClass
  HiLink cppStructure		Structure
  HiLink cppBoolean		Boolean
  HiLink cppConstant		Constant
  HiLink cppRawStringDelimiter	Delimiter
  HiLink cppRawString		String

  HiLink cppUserType		Type
  HiLink cppUserFunction  	Function
  HiLink cppUserOperation	Operation
  HiLink cppBrace		Brace
  HiLink cppUserMacro1		Macro
  HiLink cppUserMacro2		Macro

  delcommand HiLink
endif

let b:current_syntax = "cpp"

" vim: ts=8
" /usr/local/Cellar/vim/7.4.826/share/vim/vim74/syntax/cpp.vim
