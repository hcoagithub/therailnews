class AddNoticeToComentarios < ActiveRecord::Migration[7.0]
  def change
    add_reference :comentarios, :notice, foreign_key: true
  end
end
