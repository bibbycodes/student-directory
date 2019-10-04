def puts_message
  puts "lets read our own source"
end

file = File.open(__FILE__, "r")

file.readlines.each { |line|
  puts line
}