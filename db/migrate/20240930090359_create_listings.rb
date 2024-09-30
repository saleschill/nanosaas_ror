class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.decimal :commission, precision: 5, scale: 2
      t.text :description
      t.string :contact_info
      t.string :website_link
      t.boolean :approved, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
