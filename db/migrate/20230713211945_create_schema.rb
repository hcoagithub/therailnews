class CreateSchema < ActiveRecord::Migration[7.0]
  def change
    create_table :schemas do |t|

      t.timestamps
    end
  end
end
