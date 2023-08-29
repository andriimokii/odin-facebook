class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :location
      t.string :bio
      t.string :full_name

      t.timestamps
    end
  end
end
