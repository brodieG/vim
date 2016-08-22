" Vim syntax file
" Language:	R (GNU S)
" Maintainer:	Tom Payne <tom@tompayne.org>
" Last Change:  2003 May 11
" Filenames:	*.r
" URL:		http://www.tompayne.org/vim/syntax/r.vim
"
" Modified by Jeremy Stephens and Will Gray.
"
" Further modifications by BrodieG:
"   - Removed all function highlighting
"   - Adding roxygen comments
"   - @Spell in comments
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version >= 600
  setlocal iskeyword=@,48-57,_,.
else
  set iskeyword=@,48-57,_,.
endif

syn case match

" Comment Stuff

syn match rRoxyTag contained /@\(description\|examples\|exportClass\|export\|importFrom\|import\|name\|note\|method\|param\|rdname\|return\|section\|seealso\|slot\)\>/

syn region rRoxyDocTag contained start=/\\\S\+{/ end=/}/ contains=rRoxyDocTag
" syn match rRoxyDocTagAtom contained /\\\a\+{.\{-\}}/
" syn match rRoxyDocTag contained /\\\a\+{.\{-\}}/ contains=rRoxyDocTag
syn match rComment /\#\([^']\|$\).*/ contains=@Spell
syn match rCommentRoxy /\#'.*/ contains=rRoxyTag,rRoxyDocTag,rRoxyDocTagAtom,@Spell

" Constant
" string enclosed in double quotes
syn region rString matchgroup=rStringDelimiter start=/"/ skip=/\\\\\|\\"/ end=/"/
" string enclosed in single quotes
syn region rString matchgroup=rStringDelimiter start=/'/ skip=/\\\\\|\\'/ end=/'/
" number with no fractional part or exponent
syn match rNumber /\d\+/
" floating point number with integer and fractional parts and optional exponent
syn match rFloat /\d\+\.\d*\([Ee][-+]\=\d\+\)\=/
" floating point number with no integer part and optional exponent
syn match rFloat /\.\d\+\([Ee][-+]\=\d\+\)\=/
" floating point number with no fractional part and optional exponent
syn match rFloat /\d\+[Ee][-+]\=\d\+/

" Identifier
" identifier with leading letter and optional following keyword characters
syn match rIdentifier /\a\k*/
" identifier with leading period, one or more digits, and at least one non-digit keyword character
syn match rIdentifier /\.\d*\K\k*/

syn match rFunction /\a\k*(/me=e-1 nextgroup=rParenRegion

" Statement
syn keyword rStatement   break next return
syn keyword rConditional if else
syn keyword rRepeat      for in repeat while

" Constant
syn keyword rConstant NULL
syn keyword rBoolean  FALSE TRUE NA
syn keyword rNumber   NA_integer_ NA_real_
syn keyword rString   NA_charaacter_

syn match rArrow /<\{1,2}-/
syn match rArrow /->\{1,2}/

" Special
syn match rDelimiter /[,;:]/

" Error
syn region rParenRegion matchgroup=rParenDelimiter start=/(/ end=/)/ transparent contains=ALLBUT,rError,rBraceError,rCurlyError
syn region rCurlyRegion matchgroup=rCurlyDelimiter start=/{/ end=/}/ transparent contains=ALLBUT,rError,rBraceError,rParenError fold
syn region rBraceRegion matchgroup=rBraceDelimiter start=/\[/ end=/]/ transparent contains=ALLBUT,rError,rCurlyError,rParenError
syn match rError      /[)\]}]/
syn match rBraceError /[)}]/ contained
syn match rCurlyError /[)\]]/ contained
syn match rParenError /[\]}]/ contained

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_r_syn_inits")
  if version < 508
    let did_r_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink rComment                 Comment
  HiLink rCommentRoxy             Comment
  HiLink rRoxyTag                 SpecialComment
  HiLink rRoxyDocTag              SpecialComment
  HiLink rRoxyDocTagAtom          SpecialComment
  HiLink rConstant                Constant
  HiLink rString                  String
  HiLink rNumber                  Number
  HiLink rBoolean                 Boolean
  HiLink rFloat                   Float
  HiLink rStatement               Statement
  HiLink rConditional             Conditional
  HiLink rRepeat                  Repeat
  HiLink rIdentifier              Identifier
  HiLink rFunction                Function
  HiLink rArrow                   Statement
  HiLink rType	                  Type
  HiLink rDelimiter               Delimiter
  HiLink rStringDelimiter         Delimiter
  HiLink rParenDelimiter          Delimiter
  HiLink rCurlyDelimiter          Delimiter
  HiLink rBraceDelimiter          Delimiter
  HiLink rError                   Error
  HiLink rParenError              Error
  HiLink rCurlyError              Error
  HiLink rBraceError              Error
  delcommand HiLink
endif

let b:current_syntax="r"

" Comment stuff

setlocal comments=:#
setlocal comments=:#'

" Local settings for buffer

setlocal spell
setlocal spell

" vim: ts=8 sw=2

