class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :account_id
      t.integer :number_of_pages

      t.string :category
      t.string :sub_category
      t.string :sub_sub_category

      t.timestamps
    end
  end
end
