class CreateHashtagVoicePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtag_voice_posts do |t|
      t.references :voice_post, foreign_key: true
      t.references :hashtag, foreign_key: true

      t.timestamps
    end
  end
end
