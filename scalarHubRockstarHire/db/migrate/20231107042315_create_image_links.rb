class CreateImageLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :image_links do |t|

      t.timestamps
    end
  end
end
