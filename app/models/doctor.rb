class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :medical_records, dependent: :destroy
  has_many :appointments, dependent: :destroy
  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :first_name, :last_name, :specialty ],
  using: {
    tsearch: { prefix: true }
  }
end
