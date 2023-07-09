_dotfileLog "sourcing fzf.zsh" 2>/dev/null

export FZF_DEFAULT_OPTS=\
"--height 40% 
--layout=reverse
--no-preview
--bind ctrl-u:preview-up,ctrl-d:preview-down"
# --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284
# --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf
# --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"
# \ --bind ctrl-y:preview-up,ctrl-e:preview-down,
# \ctrl-b:preview-page-up,ctrl-f:preview-page-down,
# \ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
# \shift-up:preview-top,shift-down:preview-bottom,
# \alt-up:half-page-up,alt-down:half-page-down"
