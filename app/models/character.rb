class Character < ApplicationRecord
  belongs_to :user
  has_one :statistic

  def add_exp(gained_exp)
    while levels_up?(gained_exp)
      gained_exp -= exp_till_next_level
      self.exp = 0
      level_up
    end
    self.exp += gained_exp
  end

  private

  # experience needed to reach next level
  def exp_till_next_level
    next_lvl_exp(level) - exp
  end

  def levels_up?(gained_exp)
    exp + gained_exp > next_lvl_exp(level)
  end

  def level_up
    self.level += 1
    # some other stuff
  end

  # belongs somewhere else probably
  def next_lvl_exp(current_level)
    50 * current_level**1.2
  end
end
