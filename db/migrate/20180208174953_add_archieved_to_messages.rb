class AddArchievedToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :archieved, :boolean, null: false, default: false
  end
end
