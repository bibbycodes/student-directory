@students = []
# create array of student names
def input_students
  puts "Please enter the names of the students"
  puts "To Finish, just hit return twice"
  # create an empty array
  @students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # Get another name
    name = gets.chomp
  end
  # return the array of students
  @students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
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
    when "9"
      exit
    else 
      puts "Please enter a valid number"
  end
end

def interactive_menu
  @students = []
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu