require 'test_helper'
require 'rails/performance_test_help'

class FilterTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  self.profile_options = { runs: 50 }

  test "filter" do
    get '/admin/movies/filter?q%5Btitle_or_description_or_director_cont%5D=t&q%5Bactive_eq%5D=true&limit=5&order=title%20ASC'
  end

  test "ns_filter" do
    get '/admin/movies/ns_filter?q%5Btitle_or_description_or_director_cont%5D=t&q%5Bactive_eq%5D=true&limit=5&order=title%20ASC'
  end

  test "ams_filter" do
    get '/admin/movies/ams_filter?q%5Btitle_or_description_or_director_cont%5D=t&q%5Bactive_eq%5D=true&limit=5&order=title%20ASC'
  end
end

