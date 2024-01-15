class Contestant < ApplicationRecord
  belongs_to :bachelorette
  has_many :contestant_outings
  has_many :outings, through: :contestant_outings

  def season_number
    bachelorette.season_number
  end

  def season_description
    bachelorette.season_description
  end
end
