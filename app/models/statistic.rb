class Statistic < ApplicationRecord
  belongs_to :character

  def self.warrior_level_stats
    {
      strength: 4,
      dexterity: 1,
      stamina: 3,
      initiative: 1
    }
  end

  def self.hunter_level_stats
    {
      strength: 2,
      dexterity: 3,
      stamina: 2,
      initiative: 2
    }
  end

  def self.mage_level_stats
    {
      strength: 1,
      dexterity: 2,
      stamina: 2,
      initiative: 4
    }
  end
end
