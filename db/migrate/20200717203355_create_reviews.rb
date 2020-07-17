class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :text
      t.integer :user_id
      t.integer :article_id
    end
  end
end
