class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :device_id
      t.string :private_token

      t.timestamps
    end
  end
end
