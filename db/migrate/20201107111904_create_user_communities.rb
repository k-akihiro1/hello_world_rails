class CreateUserCommunities < ActiveRecord::Migration[6.0]
  def change
    create_table :user_communities do |t|
      t.references :user
      t.references :community

      t.timestamps
    end
  end
end
