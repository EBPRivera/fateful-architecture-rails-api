class Character < ApplicationRecord
  STAT_VALUES = %w[d4 d6 d8 d10 d12].freeze

  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true
  validates :physical, :mental, :social, :awareness, :prowess, :resilience,
            presence: true, inclusion: { in: STAT_VALUES }
  validates :stamina_limit, presence: true
end
