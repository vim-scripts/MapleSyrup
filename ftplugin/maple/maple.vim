" maple.vim: should be placed as ftplugin/maple/maple.vim
" Author:	Charles E. Campbell, Jr.  <NdrOchip@ScampbellPfamily.AbizM>-NOSPAM
" Date:		Oct 29, 2004
" Version:	2
" History:
" 	1, Oct 29, 2004 : * Initial release, just contains matchit support
" GetLatestVimScripts: 39 1 :AutoInstall: matchit.vim

" ---------------------------------------------------------------------
"  Load Once: {{{1
if exists("b:did_maple_ftplugin")
 finish
endif
let b:did_maple_ftplugin= "v2"

" ---------------------------------------------------------------------
" Custom Matchit Support: {{{1
let b:match_words=
   \ '\<if\>:\<elif\>:\<else\>:\<fi\>,'.
   \ '\<for\>:\<od\>,'.
   \ '\<while\>:\<od\>,'.
   \ '\<proc\>:\<RETURN\>:\<end\>'

" vim: ts=4 fdm=marker
