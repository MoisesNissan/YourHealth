class CreateMedicalRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_records do |t|
      t.text :lab_results
      t.string :medications
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
