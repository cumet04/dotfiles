
# fish scrpit内で変数の再代入ができないようなので
# while内から値を取り出すために関数化 -> returnで対応
function _walk_select
    set preview_command (printf "\
        test -f {};
        and cat {};
        or ls -al --color=always {} | tr -s ' ' | cut -d ' ' -f 9,10,11;
    ")
    while true
        # TODO: 一切選択肢せずにcancelした場合にcdせずに終了したい（historyに残したくない）
        # TODO: Enterで確定＆returnにしたい
        set selected (\
            ls -a1 --color=always |\
            fzf --ansi --tac --no-sort\
                --bind 'tab:accept'\
                --preview "$preview_command"
        )
        if [ "$selected" = "" ]
            echo (pwd)
            return
        end
        if [ -f $selected ]
            echo (pwd)/$selected
            return
        end
        builtin cd $selected
    end
end

function walk
    if count $argv > /dev/null
        builtin cd $argv
    end

    set target (_walk_select)

    if [ -f $target ]
        # 関数内で複数のコマンドをcommandlineで実行させることはできないようなのでセミコロンで妥協
        commandline "cd "(dirname $target)";vim "(basename $target)
        commandline -f execute
    else
        commandline "cd $target"
        commandline -f execute
    end
end
