" AutoAlign.vim: a ftplugin for Maple
" Author:	Charles E. Campbell, Jr.  <NdrOchip@ScampbellPfamily.AbizM>-NOSPAM
" Date:		Oct 28, 2004
" Version:	5
" History:
"   5, Oct 28, 2004 : * using g:mapleader instead of a built-in backslash to
"                       access AlignMaps
"   4, Jul 02, 2004 : * see |i_ctrl-g_u| -- breaks undo sequence at every align
"   3, Mar 03, 2004 : * autoalign not taken if a no-pattern line is
"                       in-between the keepalign line and the current line
"   2               : * b:autoalign==0: turns autoalign off
"                       b:autoalign==1: turns autoalign back on
"                     * 'a now used during autoalign, and AlignMap's \t=
"                       If user changes 'a, then AutoAlign recognizes that
"                       it is not to keep aligning
"                     * The AA command can be used to toggle AutoAlign
"   1               : * The Epoch
" GetLatestVimScripts: 884 1 :AutoInstall: AutoAlign.vim
" GetLatestVimScripts: 1066 1 :AutoInstall: cecutil.vim
" GetLatestVimScripts: 294 1 :AutoInstall: Align.vim
if exists("b:did_maple_autoalign")
 finish
endif
let b:did_maple_autoalign = "v5"

" ---------------------------------------------------------------------
" Public Interface: AA toggles AutoAlign {{{1
com! -nargs=0 AA if exists("b:autoalign")|let b:autoalign= !b:autoalign|else|let b:autoalign= 0|endif|echo "AutoAlign is ".(b:autoalign? "on" : "off")

" ---------------------------------------------------------------------
"  overloading '=' to keep things lined up {{{1
ino <silent> := :=<c-o>:let b:autoalign_vekeep=&ve<bar>set ve=<cr><c-o>:silent call <sid>KeepMapleAligned()<cr><c-o>:let &ve=b:autoalign_vekeep<cr>

fun! s:KeepMapleAligned()
  if exists("b:autoalign") && b:autoalign == 0
   return
  endif
  set lz

  if getline(".") =~ ':='
   let curposn   = SaveWinPosn()
   let curline   = line(".")
   let nopatline = search('^\%(\%(:=\)\@!.\)*$','bW')
   call RestoreWinPosn(curposn)
   if exists("b:keepmpleqlaligned") && line("'a") == b:keepmpleqlaligned && b:keepmpleqlaligned < curline && nopatline < line("'a")
    exe "norm! i\<c-g>u\<esc>"
    exe "norm ".g:mapleader."a=$"
   else
    let b:keepmpleqlaligned= line(".")
    ka
   endif
  elseif exists("b:keepmpleqlaligned")
   unlet b:keepmpleqlaligned
  endif

  set nolz
endfun

" ---------------------------------------------------------------------
" vim: ts=4 fdm=marker
