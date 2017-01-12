require 'test_helper'
require 'bundler'

class GemspecTest < Minitest::Test

  def test_valid
    spec_path = File.expand_path('../../rbsso.gemspec', __FILE__)
    spec = Bundler.load_gemspec(spec_path)
    spec.validate
  end

end
