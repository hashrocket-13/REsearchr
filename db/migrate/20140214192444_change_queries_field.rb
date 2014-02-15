class ChangeQueriesField < ActiveRecord::Migration
  def change
      change_table(:queries) do |t|
      t.rename :query, :q_string
    end
  end
end
