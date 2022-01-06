require 'test_helper'
require 'generators/view/view_generator'

class ViewGeneratorTest < Rails::Generators::TestCase
  tests ViewGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
