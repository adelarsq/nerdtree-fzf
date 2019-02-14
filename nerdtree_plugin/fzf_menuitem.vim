" NerdTree Plugin for search with fzf
if exists("g:loaded_nerdtree_fzf_menuitem")
  finish
endif

let g:loaded_nerdtree_fzf_menuitem = 1
let s:haskdeinit = system("ps -e") =~ 'kdeinit'
let s:hasdarwin = system("uname -s") =~ 'Darwin'

call NERDTreeAddMenuItem({
      \ 'text': 'f(z)f search',
      \ 'shortcut': 'z',
      \ 'callback': 'NERDTreeFzfSearch' })

function! NERDTreeFzfSearch()
  let l:oldssl=&shellslash
  set noshellslash
  let treenode = g:NERDTreeFileNode.GetSelected()
  let path = treenode.path.str()

  let s:cmd = 'FZF '.path
  execute s:cmd

  let &shellslash=l:oldssl
  redraw!
endfunction
