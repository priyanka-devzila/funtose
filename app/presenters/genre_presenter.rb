module GenrePresenter
    extend ActiveSupport::Concern
  
    included do
      acts_as_api
  
      api_accessible :base do |t|
        t.add :name
        t.add :description
      end

      api_accessible :show, extend: :base do |t|
        t.add :movies

      end
    end
  
  end
      