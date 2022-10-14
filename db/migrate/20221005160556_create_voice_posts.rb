class CreateVoicePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :voice_posts do |t|
      t.string :title
      t.string :introduction
      t.string :voice
      t.integer :customer_id
      t.string :category

      t.timestamps
    end
  end
end
