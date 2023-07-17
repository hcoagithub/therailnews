class AddPhotoToNotices < ActiveRecord::Migration[7.0]
  def change
    add_column :notices, :photo, :string
  end
end
