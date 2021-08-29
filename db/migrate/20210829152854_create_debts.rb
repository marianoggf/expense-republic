class CreateDebts < ActiveRecord::Migration[6.1]
  def change
    create_table :debts do |t|
      t.boolean :paid, default: false
      t.decimal :total
      t.belongs_to :expense, null: false, foreign_key: true
      t.belongs_to :tenant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
