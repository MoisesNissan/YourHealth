class AddDateToMedicalRecord < ActiveRecord::Migration[6.0]
  def change
    add_column :medical_records, :date, :datetime
  end
end
