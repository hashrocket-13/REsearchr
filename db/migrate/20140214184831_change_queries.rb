class ChangeQueries < ActiveRecord::Migration
  def change
      change_table(:queries) do |t|
      t.rename :type, :title
    end
  end
end
