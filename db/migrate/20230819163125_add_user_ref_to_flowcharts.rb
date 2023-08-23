class AddUserRefToFlowcharts < ActiveRecord::Migration[7.0]
  def change
    add_reference :flowcharts, :user, null: false, foreign_key: true
  end
end
