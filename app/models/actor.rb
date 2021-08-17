class Actor < ApplicationRecord


    # ======================== MODULES INCLUSION ====================== #
    include ActorPresenter

    # ======================== Associations =========================== #

    has_and_belongs_to_many :movies

    accepts_nested_attributes_for :movies

    # ====================== Scopes ====================================== #

end
