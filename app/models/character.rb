class ConnectionsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless check_array(record, attribute, value)

    value.each do |item|
      break unless check_connection_format(record, attribute, item)
    end
  end

  private

  def check_array(record, attribute, value)
    return true if value.is_a?(Array)

    record.errors.add attribute, "must be a valid array input"
    false
  end

  def check_connection_format(record, attribute, value)
    unless value.is_a?(Hash) && value.key?("name") && value.key?("description")
      record.errors.add attribute, "invalid connection format"
      return false
    end

    if value["name"].empty?
      record.errors.add attribute, "connection name cannot be blank"
      return false
    end

    true
  end
end

class Character < ApplicationRecord
  STAT_VALUES = %w[d4 d6 d8 d10 d12].freeze

  belongs_to :user

  validates :physical, :mental, :social, :awareness, :prowess, :resilience,
            presence: true, inclusion: { in: STAT_VALUES }
  validates_presence_of :stamina, :endurance, :limit, :level,
                        :name, :user_id, :fate
  validates :connections, connections: true
end
