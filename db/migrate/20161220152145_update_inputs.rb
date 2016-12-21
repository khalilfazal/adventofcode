class UpdateInputs < ActiveRecord::Migration[5.0]
  def change
    change_table :inputs do |t|
      t.change :year, :integer, null: false
      t.change :day, :integer, null: false
      t.change :input, :text, default: ''
    end

    add_index :inputs, [:year, :day], unique: true
  end
end