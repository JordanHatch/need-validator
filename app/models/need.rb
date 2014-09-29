class Need < ActiveRecord::Base
  validates :need_api_id, presence: true
  validates :positive_rating_count, :neutral_rating_count, :negative_rating_count,
              numericality: { only_integer: true }

  VALID_OPINIONS = [
    :positive,
    :neutral,
    :negative,
  ]

  before_save :set_percentage_score

  def to_param
    need_api_id.to_s
  end

  def submit_score(opinion)
    raise "Invalid opinion: '#{opinion}'" unless VALID_OPINIONS.include?(opinion)

    increment("#{opinion}_rating_count", 1)
    increment("total_rating_count", 1)
    save!
  end

  def self.random
    total = self.count
    self.offset(rand(total)).first
  end

private

  def set_percentage_score
    self.percentage_score = calculate_percentage_score
  end

  def calculate_percentage_score
    if total_rating_count == 0 || positive_rating_count == 0
      return 0
    end

    overall_score = positive_rating_count.to_f + (neutral_rating_count.to_f / 2)
    overall_score / total_rating_count.to_f * 100
  end

end
