$center_amount = 200

# create array of student names
def input_students_info
  puts "Please enter the students age".center($center_amount)
  age = gets.chomp
  puts "Please enter the entrance exam score".center($center_amount)
  score = gets.chomp
  puts "Please enter the students country of birth".center($center_amount)
  nationality = gets.chomp
  puts "What cohort will this student be attending?".center($center_amount)
  cohort = gets.chomp
  return {
    age: age,
    score: score,
    nationality: nationality,
    cohort: cohort
  }
end

def input_students
  puts "Please enter the names of the students".center($center_amount)
  puts "To Finish, just hit return twice".center($center_amount)
  # create an empty array
  students = []
  # get the first name
  name = gets.split("\n").join
  # while the name is not empty, repeat this code
  while !name.empty? do
    details = input_students_info
    # add the student hash to the array
    students << {name: name, cohort: details[:cohort], age: details[:age], score: details[:score], nationality: details[:nationality] }
    puts "Now we have #{students.count} #{students.count > 1 ? "students" : "student"}. Hit Return to end data entry or type in the next students name".center($center_amount)
    # Get another name
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center($center_amount)
  puts "--------------------------------".center($center_amount)
end

def print(students)
  if students.count > 0
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center($center_amount)
    end
  end
end

def print_details_of(students)
  # iterate over the array
  students.each_with_index do |student, index|
    name = ""
    age = ""
    cohort = ""
    age = ""
    nationality = ""
    score = ""
    #for each key value pair 
    student.each do |key, value|
      if key.to_s == "name"
        name = value
      elsif key.to_s == "cohort"
        cohort = value
      elsif key.to_s == "age"
        age = value
      elsif key.to_s == "nationality"
        nationality = value
      else
        score = value
      end
    end
    p "#{name} is #{age} years old, was born in #{nationality} and achieved a score of #{score} to get into the #{cohort} cohort".center($center_amount)
  end
end

def group_by_cohort(students)
  # Get List of different cohorts
  cohort_names = []
  groups = []
  students.each { |student|
    cohort_names.push(student[:cohort])
  }
  cohort_names = cohort_names.uniq

  # For each cohort
  for cohort in cohort_names
    # Select Cohort and push to groups
    group = students.select {|student|
      student[:cohort] == cohort
    }
    groups.push(group)
  end
  return groups
end

def print_starting_with(letter, students)
  students.each_with_index do |student|
    first_letter = student[:name][0]
    if first_letter.downcase == letter.downcase
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center($center_amount)
    end
  end
end

def print_shorter_than(number = 12, students)
  students.each do |student|
    name = student[:name]
    if (name.length < number)
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center($center_amount)
    end
  end
end

def print_while(students)
  i = 0 
  while i < students.length do
    student = students[i]
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center($center_amount)
    i += 1
  end
end

def print_until(students)
  i = 0 
  until i == students.length do
    student = students[i]
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center($center_amount)
    i += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great #{students.count > 1 ? "students" : "student"}".center($center_amount)
end

def print_details_by(groups)
  for group in groups
    puts "#{group[0][:cohort]} cohort students:".center($center_amount - $center_amount / 2)
    puts "\n"
    print_details_of(group)
  end
end

students = input_students
groups = group_by_cohort(students)
print_details_by(groups)
print_footer(students)