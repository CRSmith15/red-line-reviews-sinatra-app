class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :game_title
      t.integer :score
      t.text :description
      t.integer :id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
