class CreateNotices < ActiveRecord::Migration[7.0]
  def change
    create_table :notices do |t|
      t.string :titulo
      t.string :contenido

      t.timestamps
    end
  end
end
