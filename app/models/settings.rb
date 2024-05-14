class Settings < ApplicationRecord
  before_create :ensure_single_instance

  def self.instance
    first
  end

  def self.rules
    instance.rules.gsub("__EGGS_NUMBER__", Egg.count.to_s)
  end

  private

  def ensure_single_instance
    raise "There can be only one instance of Settings" if Settings.any?
  end
end
