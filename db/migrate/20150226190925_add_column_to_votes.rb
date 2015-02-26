class AddColumnToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :veto, :boolean, default: false
  end
end
