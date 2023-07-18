class Character < ApplicationRecord
  STAT_VALUES = %w[d4 d6 d8 d10 d12].freeze

  belongs_to :user

  validates :physical, :mental, :social, :awareness, :prowess, :resilience,
            presence: true, inclusion: { in: STAT_VALUES }
  validates_presence_of :stamina_current, :stamina_max, :stamina_limit, :level,
                        :name, :user_id
end
