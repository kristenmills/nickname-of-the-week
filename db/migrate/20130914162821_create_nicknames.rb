class CreateNicknames < ActiveRecord::Migration
  def change
    create_table :nicknames do |t|
      t.string :name
      t.text :comment
      t.integer :rating
      t.references :week, index: true

      t.timestamps
    end
  end
end
