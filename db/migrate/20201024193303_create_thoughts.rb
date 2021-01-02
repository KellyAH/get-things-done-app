class CreateThoughts < ActiveRecord::Migration[6.0]
  def change
    create_table :thoughts do |t|
      t.string :description
      t.references :user_category
      t.date :due_date
      t.string :priority
      t.string :status
      t.timestamps
    end
  end
end
