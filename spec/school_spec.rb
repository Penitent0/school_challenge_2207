require 'rspec'
require 'pry'
# require 'simplecov'
# SimpleCov.start
require './lib/school'


RSpec.configure do |config|
  config.default_formatter = 'doc'
end

RSpec.describe 'School Spec Harness' do
  before :each do
    @school1 = School.new('9:00', 7)
    @school2 = School.new('10:00', 2)
  end

  describe 'Iteration 1' do
    it '1. School Instantiation' do
      expect(School).to respond_to(:new).with(2).argument
      expect(@school1).to be_an_instance_of(School)

      expect(@school1).to respond_to(:start_time).with(0).argument
      expect(@school1.start_time).to eq('9:00')
      expect(@school2.start_time).to eq('10:00')

      expect(@school1).to respond_to(:hours_in_school_day).with(0).argument
      expect(@school1.hours_in_school_day).to eq(7)
      expect(@school2.hours_in_school_day).to eq(2)

      expect(@school1).to respond_to(:student_names).with(0).argument
      expect(@school1.student_names).to eq([])
      expect(@school2.student_names).to eq([])
    end
  end

  describe 'Iteration 2' do
    it '2. School #add_student_name' do
      expect(@school1).to respond_to(:add_student_name).with(1).argument

      @school1.add_student_name('megan')
      @school1.add_student_name('Aurora')
      @school1.add_student_name('tim')

      expect(@school1.student_names).to eq(['megan', 'Aurora', 'tim'])
    end

    it '3. School #end_time' do
      expect(@school1).to respond_to(:end_time).with(0).argument
      expect(@school1.end_time).to eq('16:00')
      expect(@school2.end_time).to eq('12:00')
    end
  end

  describe 'iteration 3' do
    it 'is school full time?' do
      expect(@school1.is_full_time?).to eq(true)
    end 
    it 'standardizes names' do 
      @school1.add_student_name('Aurora')
      @school1.add_student_name('Tim')
      @school1.add_student_name('Megan')

      expect(@school1.standard_student_names).to eq(["Aurora", "Tim", "Megan"])
    end 
  end 

  describe 'iteration 4' do 
    it 'convert time' do 
      expect(@school1.convert_end_time_to_clock_time).to eq("4:00")
      expect(@school2.convert_end_time_to_clock_time).to eq("12:00")
    end 
  end 
end
