class AddFieldsToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :first_name, :string
    add_column :doctors, :last_name, :string
    add_column :doctors, :specialty, :string
    add_column :doctors, :age, :integer
    add_column :doctors, :gender, :string
  end
end
