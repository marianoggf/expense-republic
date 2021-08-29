class Expense < ApplicationRecord

  validates :date, :total, :description, presence: true
  validates :balanced, inclusion: [true, false]
  validates :total, numericality: { greater_than: 0 }
  validate :tenants_percent_sum, unless: :balanced
  validate :non_paid_debts

  after_save :create_debts

  has_many :debts, dependent: :destroy

  private

  def tenants_percent_sum
    errors.add(:base, 'No se puede crear, la suma de porcentajes no da 100%') if Tenant.sum(:percent) != 100
  end

  def non_paid_debts
    if debts.paid.present?
      errors.add(:base, 'No se puede modificar, hay gastos marcados como pagados')
    end
  end

  def create_debts
    debts.destroy_all
    tenants = Tenant.all
    tenants.each do |tenant|
      debt_total = balanced ? total / tenants.count : total * tenant.percent
      debts.create!(total: debt_total, tenant: tenant)
    end
  end

end
