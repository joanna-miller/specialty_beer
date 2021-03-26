class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :birth_date, :presence => true
  validate :validate_age

  private

  def validate_age
      if birth_date.present? && birth_date > 21.years.ago
          errors.add('You must be over 21 years old to browse this site.')
      end
  end
end
