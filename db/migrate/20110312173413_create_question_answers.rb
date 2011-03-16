class CreateQuestionAnswers < ActiveRecord::Migration
  def self.up
    create_table :question_answers do |t|
      t.string :answer
      t.integer :qid
      
      t.timestamps
    end
  end

  def self.down
    drop_table :question_answers
  end
end
