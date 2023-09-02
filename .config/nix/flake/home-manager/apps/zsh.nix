{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}

