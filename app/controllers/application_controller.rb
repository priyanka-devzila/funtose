class ApplicationController < ActionController::API
    include JsonResponders
    include Renderer

    def current_page
        params[:page] || 1
      end
    
      def record_per_page
        params[:rpp] || params[:limit] || 20
      end
    
      def apply_pagination collection
        collection.page(current_page).per(record_per_page)
        #collection.page(params[:page]).per(params[:rpp])
      end
    
      def pagination(collection)
        {
            current_page:  collection&.current_page || 1,
            next_page:     collection&.next_page,
            previous_page: collection&.prev_page,
            total_pages:   collection&.total_pages || 1,
            per_page:      collection&.limit_value,
            total_entries: collection&.total_count
        }
      end
end
