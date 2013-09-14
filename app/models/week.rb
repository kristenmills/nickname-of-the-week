class Week < ActiveRecord::Base
  has_one :nickname

  validates :number, :semester, :start_date, :end_date,
    presence: true
  validates :number, :semester,
    numericality: {only_integer: true, greater_than: 0}
  validate :date_validity

  def date_validity
    errors.add ('Start date is later than end date.') if start_date > end_date
  end
end