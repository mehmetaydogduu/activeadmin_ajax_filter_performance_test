ActiveAdmin.register Person do
  include ActiveAdmin::AjaxFilter

  collection_action :ns_filter, method: :get do
    nativeson_hash = Nativeson.fetch_json_by_rails_query(find_collection(except: [:pagination, :collection_decorator])
      .order(params[:order]).limit(params[:limit] || 10))

    render plain: nativeson_hash[:json]
  end

  collection_action :ams_filter, method: :get do
    collection = find_collection(except: [:pagination, :collection_decorator])
      .order(params[:order]).limit(params[:limit] || 10)

    render json: collection, each_serializer: PersonSerializer, root: false
  end

  collection_action :oj_filter, method: :get do
    collection = find_collection(except: [:pagination, :collection_decorator])
      .order(params[:order]).limit(params[:limit] || 10)

    render plain: Oj.dump(collection, mode: :rails)
  end

  collection_action :as_json_filter, method: :get do
    collection = find_collection(except: [:pagination, :collection_decorator])
      .order(params[:order]).limit(params[:limit] || 10)

    render plain: collection.as_json
  end

  form do |f|
  end
end
