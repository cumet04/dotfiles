raw = `git status --branch --porcelain`.split("\n")

# 'master...origin/master [behind 1]' => ["master", "origin/master", "[behind 1]"]
branch_params = raw[0][3..-1].split(/\.\.\.| /, 3)

# TODO: rebase, conflict, ...

p = {
    staged: raw.select{ |line| /^[MADRC]/ === line }.count,
    changed: raw.select{ |line| /^\ [MADRC]/ === line }.count,
    untracked: raw.select{ |line| /^\?/ === line }.count,
    branch: branch_params[0],
    status:
        if branch_params.length == 1
            nil
        elsif branch_params[2].nil?
            0
        else
            (branch_params[2].include?('ahead') ? 1 : -1) *
            branch_params[2][1..-2].sub(/[^\d]*/, '').to_i
        end
}

def fgc(text, color)
    "#[fg=colour#{color}]#{text}#[default]"
end

status_view =
    if p[:status].nil?; '(local)'
    elsif p[:status] == 0; ''
    elsif p[:status].positive?; fgc("#{0x2B06.chr('UTF-8')} #{p[:status].to_s}", 21)
    elsif p[:status].negative?; fgc("#{0x2B07.chr('UTF-8')} #{(-p[:status]).to_s}", 21)
    end

puts "On #{p[:branch]}#{status_view}, " +
    if p[:staged] + p[:changed] + p[:untracked] == 0
        "workspace is clear"
    else
        (p[:staged] == 0 ?    "no staged, "    : fgc("#{p[:staged]} staged", 40)) + ", " +
        (p[:changed] == 0 ?   "no changed, "   : fgc("#{p[:changed]} changed", 124)) + ", " +
        (p[:untracked] == 0 ? "no untracked, " : fgc("#{p[:untracked]} untracked", 88))
    end
