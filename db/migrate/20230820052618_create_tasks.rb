class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title,         null: false
      t.text :detail
      t.integer :time,         null: false
      t.integer :position,     null: false
      t.references :flowchart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
