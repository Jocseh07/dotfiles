#!/usr/bin/env bash
# setup dotfiles

prompt_continue() {
  read -p "Press any key to continue or 'n' to cancel: " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Nn]$ ]]
  then
    return 1
  fi
  return 0
}

print_heading() {
  local heading="$1"
  local num_stars=100

  # Print stars
  printf "\n"
  printf "\e[34m%0.s*\e[0m" $(seq 1 $num_stars)
  printf "\n"

  # Print heading with whitespace and blue color
  printf "\e[34m   %s   \e[0m\n" "$heading"

  # Print stars
  printf "\e[34m%0.s*\e[0m" $(seq 1 $num_stars)
  printf "\n\n"
}

create_symlink() {
  local source_dir="$(realpath $1)"
  local target_dir="$HOME/$2"

  # Start marker with green color
  print_heading "Creating symbolic link from $source_dir to $target_dir"

  if [ -L "$target_dir" ]; then
    # Alert with yellow color
    printf "\e[33m%s is already a symbolic link\e[0m\n" "$target_dir"
    if ! prompt_continue; then
      printf "Skipping %s\n" "$target_dir"
      return 1
    fi
    rm -rf "$target_dir"
    ln -sf "$source_dir" "$target_dir"
  elif [ -f "$target_dir" ]; then
    # Alert with yellow color
    printf "\e[33m%s is a file\e[0m\n" "$target_dir"
    if ! prompt_continue; then
      printf "Skipping %s\n" "$target_dir"
      return 1
    fi
    rm -rf "$target_dir"
    ln -sf "$source_dir" "$target_dir"
  elif [ -d "$target_dir" ]; then
    # Alert with yellow color
    printf "\e[33m%s is a directory\e[0m\n" "$target_dir"
    if ! prompt_continue; then
      printf "Skipping %s\n" "$target_dir"
      return 1
    fi
    rm -rf "$target_dir"
    ln -sf "$source_dir" "$target_dir"
  else
    printf "Creating new symbolic link to %s\n" "$target_dir"
    ln -s "$source_dir" "$target_dir"
  fi

  # Completion marker with green color
  printf "\e[32mCompleted creating symbolic link from %s to %s\e[0m\n" "$source_dir" "$target_dir"
}

create_symlink "alacritty" ".config/alacritty"
create_symlink "bspwm" ".config/bspwm"
create_symlink "nvim" ".config/nvim"
create_symlink "polybar" ".config/polybar"
create_symlink "redshift" ".config/redshift"
create_symlink "starship.toml" ".config/starship.toml"
create_symlink "rofi" ".config/rofi"
create_symlink "fish" ".config/fish"
create_symlink ".zshrc" ".zshrc"

# Finish marker with green color
printf "\e[32mSetup complete!\e[0m\n"