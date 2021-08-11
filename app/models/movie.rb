class Movie < ApplicationRecord

    # ======================== MODULES INCLUSION ====================== #
    include MoviePresenter

    # ======================== Associations =========================== #
    has_and_belongs_to_many :actors
    has_and_belongs_to_many :genres

    accepts_nested_attributes_for :actors, :genres
end
