require 'test_helper'
require 'rails/performance_test_help'

{
  'movies' => 'q%5Btitle_or_description_or_director_cont%5D=t&q%5Bactive_eq%5D=true&limit=50&order=title%20ASC',
  # 'people' => 'q%5Bname_cont=a&limit=100&order=name%20ASC'
  'people' => 'limit=100&order=name%20ASC'
}.each do |kind, query|
  klass = Class.new(ActionDispatch::PerformanceTest) do
    # Refer to the documentation for all available options
    self.profile_options = { runs: 100, formats: [] }#, :graph_html] }

    def self.test_order
      :sorted
    end

    test "#{kind} filter" do
      get "/admin/#{kind}/filter?#{query}"
    end

    test "#{kind} ns_filter" do
      get "/admin/#{kind}/ns_filter?q#{query}"
    end

    # test "#{kind} ams_filter" do
    #   get "/admin/#{kind}/ams_filter?q#{query}"
    # end

    test "#{kind} oj_filter" do
      get "/admin/#{kind}/oj_filter?q#{query}"
    end

    # test "#{kind} as_json_filter" do
    #   get "/admin/#{kind}/as_json_filter?q#{query}"
    # end
  end
end
