class ChangeIdColumnsToIntegers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :organisation_id, :integer, using: 'organisation_id::integer'
  end
end
