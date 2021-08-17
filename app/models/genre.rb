class Genre < ApplicationRecord
    # ======================== MODULES INCLUSION ====================== #
    include GenrePresenter

    # ======================== Associations =========================== #

    has_and_belongs_to_many :movies

    # ====================== Scopes ====================================== #

    scope :search, ->(keyword){
        where("genres.name LIKE :search ", { search: "%#{keyword.downcase}%"})
        }
end
