ActiveAdmin.register Movie do
  include ActiveAdmin::AjaxFilter
  collection_action :ns_filter, method: :get do
    nativeson_hash = Nativeson.fetch_json_by_rails_query(find_collection(except: [:pagination, :collection_decorator])
      .order(params[:order]).limit(params[:limit] || 10))
    render plain: nativeson_hash[:json]
  end
  collection_action :ams_filter, method: :get do
    collection = find_collection(except: [:pagination, :collection_decorator])
      .order(params[:order]).limit(params[:limit] || 10)
    render json: collection, each_serializer: MoviesSerializer, root: false
  end

  form do |f|
    f.input :title, as: :ajax_select, data: { 
      url: filter_admin_movies_path,
      search_fields: [:title, :description, :director], 
      static_ransack: { active_eq: true }, 
      ajax_search_fields: [:title, :description, :director]
    }
    f.input :description, as: :ajax_select, data: { 
      url: ns_filter_admin_movies_path,
      search_fields: [:title, :description, :director], 
      static_ransack: { active_eq: true }, 
      ajax_search_fields: [:title, :description, :director]
    }
    f.input :director, as: :ajax_select, data: { 
      url: ams_filter_admin_movies_path,
      search_fields: [:title, :description, :director], 
      static_ransack: { active_eq: true }, 
      ajax_search_fields: [:title, :description, :director]
    }
  end
end