module MoviePresenter
    extend ActiveSupport::Concern
  
    included do
      acts_as_api
  
      api_accessible :base do |t|
        t.add :id
        t.add :name
        t.add :title
        t.add :release_date
        t.add :movie_length
        t.add :language
        t.add :movie_release_country
        t.add :rating
        t.add :overview
        t.add :tagline
        t.add :created_at
        t.add :updated_at
      end
    
    end
  
  end
      