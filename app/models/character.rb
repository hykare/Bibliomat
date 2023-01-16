class Character < ApplicationRecord
  belongs_to :user
  has_one :statistic

  def progress_level(gained_exp)
    leveled_up = false

    while levels_up?(gained_exp)
      gained_exp -= exp_till_next_level
      self.exp = 0
      level_up
      leveled_up = true
    end
    self.exp += gained_exp
    leveled_up
  end

  # experience needed to reach next level
  def exp_till_next_level
    next_lvl_exp(level) - exp
  end

  # belongs somewhere else probably
  def next_lvl_exp(current_level)
    50 * current_level**1.2
  end

  private

  def levels_up?(gained_exp)
    exp + gained_exp > next_lvl_exp(level)
  end

  def level_up
    self.level += 1

    increse_stats

    # some other stuff
  end

  def increse_stats
    level_stats = if character_class == 'warrior'
                    Statistic.warrior_level_stats
                  elsif character_class == 'hunter'
                    Statistic.hunter_level_stats
                  else
                    Statistic.mage_level_stats
                  end
    statistic.strength += level_stats[:strength]
    statistic.dexterity += level_stats[:dexterity]
    statistic.stamina += level_stats[:stamina]
    statistic.initiative += level_stats[:initiative]

    statistic.save
  end
end
