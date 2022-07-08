class School
  attr_reader :start_time, 
              :hours_in_school_day,
              :student_names
  def initialize(time, hours)
    @start_time = time
    @hours_in_school_day = hours
    @student_names = []
  end 
  def add_student_name(name)
    @student_names << name
  end 
  def end_time
    parts = @start_time.split(":")
    hours = parts[0].to_i
    mins = parts[1]

    "#{hours + hours_in_school_day}:#{mins}"
  end 
  def is_full_time?
    @hours_in_school_day > 4
  end 
  def standard_student_names
    # @student_names.map {|student| student.capitalize} #Fancy using .map method

    cap_names = []
    @student_names.each do |name|
      cap_names << name.capitalize
    end 
    cap_names
  end 
  def convert_end_time_to_clock_time
    parts = end_time.split(":") # ["16", "00"]
    hours = parts[0].to_i # 16
    mins = parts[1] # "00"

    if hours > 12
      hours -= 12 # 16 - 12 = 4
    end 
    "#{hours}:#{mins}"
  end 
end 

