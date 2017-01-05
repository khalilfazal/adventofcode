# Add a column for answers.
# Represented as a binary string
class CreateAnswersColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :advent_problems, :answers, :binary
  end
end