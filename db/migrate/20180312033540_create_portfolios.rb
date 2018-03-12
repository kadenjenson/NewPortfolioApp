class CreatePortfolios < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.text :body
      t.text :thumb_img
      t.text :img1
      t.text :img2
      t.text :img3
      t.text :img4

      t.timestamps
    end
  end
end
