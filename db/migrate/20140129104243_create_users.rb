class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash # use this name specificly instead if password, to use bcrypt
      t.timestamps
    end
  end
end
