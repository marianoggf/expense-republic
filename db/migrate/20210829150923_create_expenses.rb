class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.datetime :date
      t.boolean :balanced
      t.decimal :total
      t.string :description

      t.timestamps
    end
  end
end
