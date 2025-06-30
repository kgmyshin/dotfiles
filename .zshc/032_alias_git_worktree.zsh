## Git Worktree便利コマンド
## required peco
## required git

# Git worktree add - ブランチ名だけで新しいworktreeを追加
wta() {
  if [ $# -eq 0 ]; then
    echo "Usage: wta <branch-name>"
    return 1
  fi
  
  local branch_name="$1"
  local worktree_dir="~/.worktrees/$branch_name"
  
  # worktreesディレクトリが存在しない場合は作成
  mkdir -p ~/.worktrees
  
  # worktreeを追加
  git worktree add "$worktree_dir" "$branch_name"
}

# Git worktree remove - pecoで選択してworktreeを削除
wtr() {
  local selected_worktree
  selected_worktree=$(git worktree list | grep -v "(bare)" | tail -n +2 | peco --prompt="Remove worktree> ")
  
  if [ -n "$selected_worktree" ]; then
    local worktree_path=$(echo "$selected_worktree" | awk '{print $1}')
    echo "Removing worktree: $worktree_path"
    git worktree remove "$worktree_path"
  fi
}

# Git worktree cd - pecoで選択してworktreeにcd
wtc() {
  local selected_worktree
  selected_worktree=$(git worktree list | grep -v "(bare)" | peco --prompt="Change to worktree> ")
  
  if [ -n "$selected_worktree" ]; then
    local worktree_path=$(echo "$selected_worktree" | awk '{print $1}')
    cd "$worktree_path"
  fi
}

# Git worktree list - worktreeの一覧を見やすく表示
wtl() {
  echo "=== Git Worktrees ==="
  git worktree list
}