module ActorPresenter
    extend ActiveSupport::Concern
  
    included do
      acts_as_api
  
      api_accessible :base do |t|
        t.add :id
        t.add :name
        t.add :gender
        t.add :date_of_birth
        t.add :created_at
        t.add :updated_at
      end

      api_accessible :show, extend: :base do |t|
        t.add :movies, template: :base

      end
    end
  
  end
      