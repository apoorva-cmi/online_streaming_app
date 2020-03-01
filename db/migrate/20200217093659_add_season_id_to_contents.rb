class AddSeasonIdToContents < ActiveRecord::Migration[5.1]
  def change
    add_column :contents, :season_id, :integer
  end
end
