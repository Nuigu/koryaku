class CreateFlowcharts < ActiveRecord::Migration[7.0]
  def change
    create_table :flowcharts do |t|
      t.string :title,          null: false
      t.string :goal,           null: false
      t.integer :category_id,   null: false
      t.boolean :private,       null: false
      # t.references :user,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
