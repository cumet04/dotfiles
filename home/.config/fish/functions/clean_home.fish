# .vscode-server: can't move/remove
# .sudo_as_admin_successful: can remove, but can't prevent creation
#   It is created every time by sudo
# .docker: can't move/remove
#   It is created by Docker Desktop and the directory has symlink to windows dir
# .netlify: can't move/remove
#   The path is hard coded, and it includes auth data

# .azure
#   It is often created by WSL
# .npm: can move/remove, but can't for part of them
#   This is created there by some package that has BAD install script (ex. esbuild)
# .irb_history
#   Its location can be set by `.irbrc`, but `.irbrc` location can't be change
# .python_history
#    refs https://stackoverflow.com/questions/62063414/how-to-disable-python-history-saving

function clean_home
  cd $HOME
  rm -rf \
    .bashrc \
    .bash_history \
    .bash_logout \
    .bash_profile \
    .landscape \
    .motd_shown \
    .azure \
    .irb_history \
    .python_history \
    .degit \
    .wget-hsts \
    .serverless \
    .serverlessrc \
    .profile \
    .pylint.d \
    .viminfo \
    .npm \
    .yarn \
    .yarnrc \
    2>/dev/null
end
