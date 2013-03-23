class CreateTables < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
			t.string :name
			t.string :role
			t.boolean :join_mailing_list, :default => false

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Encryptable
      # t.string :password_salt

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable
      # t.string :authentication_token


      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true
		
		create_table :categories do |t|
			t.string :title
			t.string :slug
			t.timestamps
		end

		create_table :tags do |t|
			t.string :title
			t.string :slug
			t.timestamps
		end
		
		create_table :types do |t|
			t.string :title
			t.string :slug
			t.timestamps
		end

		create_table :posts do |t|
			t.string :title
      t.text :body
			t.text :excerpt
			t.text :hero_image
			t.boolean :published, :null => false, :default => false
			t.string :slug
			t.references :type
      t.references :category
			t.references :user
			t.timestamps
		end
		
		create_table "sir_trevor_images" do |t|
	    t.string   "file"
	    t.timestamps
	  end

  end
end
