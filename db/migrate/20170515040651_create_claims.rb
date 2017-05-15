class CreateClaims < ActiveRecord::Migration[5.1]
  def change
    create_table :claims do |t|
      t.integer :amount
      t.boolean :approval_status

      t.timestamps
    end
  end
end
