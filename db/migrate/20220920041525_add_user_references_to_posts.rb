class AddUserReferencesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :user_id, :int
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
