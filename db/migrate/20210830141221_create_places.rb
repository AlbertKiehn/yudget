class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.text :name
      t.string :category
      t.text :description
      t.text :address
      t.string :summary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
