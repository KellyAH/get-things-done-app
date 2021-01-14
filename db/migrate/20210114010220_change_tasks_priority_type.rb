class ChangeTasksPriorityType < ActiveRecord::Migration[6.0]
  def change
    change_table :tasks do |t|
      t.change(:priority, :string)
    end
  end
end
