class AddQuizIdToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :quizId, :integer
  end

  def self.down
    remove_column :questions, :quizId
  end
end
