module ActorPresenter
    extend ActiveSupport::Concern
  
    included do
      acts_as_api
  
      api_accessible :base do |t|
        t.add :first_name
        t.add :last_name
        t.add :nationality
        t.add :date_of_birth
        t.add :created_at
        t.add :updated_at
      end
    end
  
  end
      