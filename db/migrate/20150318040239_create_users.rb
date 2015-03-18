class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.string :password_digest
      t.boolean :admin ,default: false
      t.datetime :last_sign_in_at
      t.timestamps null: false
    end
  end
end
