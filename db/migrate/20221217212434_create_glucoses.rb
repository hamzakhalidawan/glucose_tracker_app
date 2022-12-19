class CreateGlucoses < ActiveRecord::Migration[6.0]
  def change
    create_table :glucoses do |t|
      t.integer :level
      t.date :reading_date
      t.references :user
      t.timestamps
    end
  end
end
