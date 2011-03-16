class CreateStudentAnswers < ActiveRecord::Migration
  def self.up
    create_table :student_answers do |t|
      t.string :student
      t.integer :aid
      
      t.timestamps
    end
  end

  def self.down
    drop_table :student_answers
  end
end
