class ChangeAidType < ActiveRecord::Migration
  def self.up
    remove_column :questions, :aid
    add_column :questions, :answer, :string
    
    remove_column :student_answers, :aid
    add_column :student_answers, :answer, :string
    add_column :student_answers, :qid, :integer
  end

  def self.down
    add_column :questions, :aid
    remove_column :questions, :answer
    
    add_column :student_answers, :aid
    remove_column :student_answers, :answer
    remove_column :student_answers, :qid
  end
end
