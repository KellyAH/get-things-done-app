class CreateThoughts < ActiveRecord::Migration[6.0]
  def change
    create_table :thoughts do |t|
      t.column :description, :string #is this the right way?
      t.has_one :user_category
      t.date :due_date
      t.integer :priority, default: 0

      t.timestamps
    end
  end
end


# https://api.rubyonrails.org/v5.2.3/classes/ActiveRecord/Enum.html
# https://guides.rubyonrails.org/active_record_migrations.html
# enums example {'open':1,'hold':2,'closed':3}
# t.enum priority: [ :none, :low, :medium, :high ]
#       t.enum status: [ :none, :to_do, :in_progress, :complete, :archived, :trash ]