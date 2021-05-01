cases = File.read('test-git-status').split("\n\n")

cases.each_with_index do |input, i|
  print "case #{i} ... "
  expect = IO.popen("ruby __tmux_status_git.rb", "r+") do |io|
    io.print input
    io.close_write
    io.gets
  end
  actual = IO.popen("__tmux_status_git", "r+") do |io|
    io.print input
    io.close_write
    io.gets
  end
  if expect.chomp == actual.chomp
    puts 'ok'
  else
    puts 'fail'
    puts ">> #{input}"
    puts "expect: #{expect}"
    puts "actual: #{actual}\n\n"
  end
end
