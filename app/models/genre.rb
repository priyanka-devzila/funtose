class Genre < ApplicationRecord
    # ======================== MODULES INCLUSION ====================== #
    include GenrePresenter

    # ======================== Associations =========================== #

    has_and_belongs_to_many :movies
end
