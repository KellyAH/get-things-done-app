class AddPriorityToThoughts < ActiveRecord::Migration[6.0]
  def change
    add_column :thoughts, :priority, :string
  end
end