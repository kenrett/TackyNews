class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :first_name, :last_name, :username, :email
      t.text        :password_hash
      
      t.timestamps
    end

    create_table :posts do |t|
      t.string      :title
      t.text        :content, :url
      t.references  :user

      t.timestamps
    end

    create_table :comments do |t|
      t.text :content
      t.references :post, :user

      t.timestamps
    end
  end
end
