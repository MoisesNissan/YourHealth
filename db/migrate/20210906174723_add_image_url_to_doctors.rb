class AddImageUrlToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :image_url, :string
  end
end
