require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  before(:each) do
    assign(:movie, Movie.new(
      :title => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input#movie_title[name=?]", "movie[title]"

      assert_select "textarea#movie_description[name=?]", "movie[description]"

      assert_select "input#movie_user_id[name=?]", "movie[user_id]"
    end
  end
end
