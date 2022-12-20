class CreateFriendlies < ActiveRecord::Migration[7.0]
  def change
    create_table :friendlies do |t|
      t.integer :param
      t.text :result

      t.timestamps
    end
  end
end
