class AddContentToAttempt < ActiveRecord::Migration[5.0]
  def change
    add_column :attempts, :content, :string
  end
end
