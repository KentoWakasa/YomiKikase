class CreateCommentPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_posts do |t|
      t.text :comment
      t.integer :customer_id
      t.integer :voice_post_id

      t.timestamps
    end
  end
end
