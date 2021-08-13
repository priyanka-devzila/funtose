module MoviePresenter
    extend ActiveSupport::Concern
  
    included do
      acts_as_api
  
      api_accessible :base do |t|
        t.add :id
        t.add :title
        t.add :director
        t.add :release_date
        t.add :movie_length
        t.add :language
        t.add :movie_release_country
        t.add :rating
        t.add :overview
        t.add :tagline
        t.add :genres
        t.add :actors
        t.add :created_at
        t.add :updated_at
      end

      api_accessible :index, extend: :base do |t|

      end

    
    end
  
  end
      