class AddUrlToImageLinks < ActiveRecord::Migration[7.1]
  def change
    add_column :image_links, :url, :string
  end
end
