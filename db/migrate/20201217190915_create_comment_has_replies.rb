class CreateCommentHasReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_has_replies do |t|
      t.references :reply, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
