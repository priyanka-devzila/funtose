module MoviePresenter
    extend ActiveSupport::Concern
  
    included do
      acts_as_api
  
      api_accessible :base do |t|
        t.add :id
        t.add :title
        t.add :release_date
        t.add :movie_length_in_minutes
        t.add :rating
        t.add :overview
        t.add :actors
        t.add :genres
        t.add :created_at
        t.add :updated_at
      end

      api_accessible :show, extend: :base do |t|
        

      end

    
    end
  
  end
      