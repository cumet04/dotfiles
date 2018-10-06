#!/usr/bin/env ruby

anyenv_root = "/opt/anyenv"

output = []
output.push("set -gx ANYENV_ROOT #{anyenv_root}")

`env ANYENV_ROOT=#{anyenv_root} anyenv init - --no-rehash fish`.split("\n").each do |line|
    line.match(/set -x PATH \$PATH "(.*)"/) do |md|
        line = "__add_userpath #{md[1]}"
    end

    line.match(/set -gx PATH '(.*)'/) do |md|
        line = "__add_userpath #{md[1]}"
    end

    output.push(line)
end

output.push("")
output.push("# direnv")
`direnv hook fish`.split("\n").each do |line|
    output.push(line)
end

File.open("#{ENV['HOME']}/.config/fish/conf.d/load_anyenv.fish", "w") do |f|
    output.each do |line|
        f.puts(line)
    end
end
