class Fixparentid < ActiveRecord::Migration[6.0]
  def change
    rename_column :pages, :parentId, :parent_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
