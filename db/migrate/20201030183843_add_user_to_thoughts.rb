class AddUserToThoughts < ActiveRecord::Migration[6.0]
  def change
    add_reference :thoughts, :user, null: true, foreign_key: true
  end
end
