require 'test_helper'

class CvCompetencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cv_competences_index_url
    assert_response :success
  end

end
