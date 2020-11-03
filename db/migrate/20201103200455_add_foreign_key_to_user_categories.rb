class AddForeignKeyToUserCategories < ActiveRecord::Migration[6.0]
    def change
      add_foreign_key :user_categories, :user_id
    end
end
