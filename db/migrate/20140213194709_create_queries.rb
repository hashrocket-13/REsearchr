class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :type
      t.string :query
      t.references :user
    end
  end
end
