@students = []
# create array of student names
def input_students
  puts "Please enter the names of the students"
  puts "To Finish, just hit return twice"
  # create an empty array
  @students = []
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    append_to_students_array(name, cohort = "November")
    puts "Now we have #{@students.count} students"
    # Get another name
    name = STDIN.gets.chomp
  end
  # return the array of students
  @students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def append_to_students_array(name, cohort)
  @students << {name: name, cohort: cohort}
  @students = @students.uniq
end

def print_students_list
  if @students.count > 0
    @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_Students
    when "9"
      exit
    else 
      puts "Please enter a valid number"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  @students = @sudents.uniq
  file.close
  puts "Saved #{@students.length} students to file"
end

def load_Students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    append_to_students_array(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_Students(filename)
    puts "Loaded #{@students.count} student entries from #{filename}."
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def interactive_menu
  @students = []
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu