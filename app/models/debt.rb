class Debt < ApplicationRecord

  belongs_to :expense
  belongs_to :tenant

  scope :paid, -> { where(paid: true) }

end
