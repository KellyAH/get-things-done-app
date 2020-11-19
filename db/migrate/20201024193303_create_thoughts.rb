class CreateThoughts < ActiveRecord::Migration[6.0]
  def change
    create_table :thoughts do |t|
      t.string :description,
      t.has_one :user_category
      t.date :due_date
      t.column :priority, :string
      t.column :status, :string

      t.timestamps
    end
  end
end
