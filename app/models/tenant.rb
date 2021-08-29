class Tenant < ApplicationRecord

  validates :name, presence: true
  validates :percent, numericality: { greater_than: 0, less_than: 100 }

end
