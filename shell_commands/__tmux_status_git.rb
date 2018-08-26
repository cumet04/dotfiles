raw = `git status --branch --porcelain`.split("\n")

# 'master...origin/master [behind 1]' => ["master", "origin/master", "[behind 1]"]
branch_params = raw[0][3..-1].split(/\.\.\.| /, 3)

# TODO: rebase, conflict, ...

params = {
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
            branch_params[2].include?('ahead') ? 1 : -1 *
            branch_params[2][1..-2].sub(/[^\d]*/, '').to_i
        end
}

def num_filter(num)
    num == 0 ? 'no' : num.to_s
end

view = params.dup.tap { |p|
    p[:staged] = num_filter(p[:staged])
    p[:changed] = num_filter(p[:changed])
    p[:untracked] = num_filter(p[:untracked])
    p[:status] =
        if p[:status].nil?; '(local)'
        elsif p[:status] == 0; ''
        elsif p[:status].positive?; "#{0x2B06.chr('UTF-8')} #{p[:status].to_s}"
        elsif p[:status].negative?; "#{0x2B07.chr('UTF-8')} #{(-p[:status]).to_s}"
        end
}

puts sprintf(
    if [params[:staged], params[:changed], params[:untracked]] == [0, 0, 0]
        "On %s%s, workspace is clear"
    else
        "On %s%s, %s staged, %s changed, %s untracked"
    end,
    view[:branch], view[:status], view[:staged], view[:changed], view[:untracked])
