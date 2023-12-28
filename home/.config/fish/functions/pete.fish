# pet exec相当だが、実行コマンドをhistoryに残せるようにshell経由実行にするラッパー
function pete
    commandline (pet search)
    commandline -f repaint
end
