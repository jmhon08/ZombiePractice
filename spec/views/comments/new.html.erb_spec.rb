require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :body => "MyText",
      :article => nil,
      :zombie => nil
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "textarea#comment_body[name=?]", "comment[body]"

      assert_select "input#comment_article_id[name=?]", "comment[article_id]"

      assert_select "input#comment_zombie_id[name=?]", "comment[zombie_id]"
    end
  end
end
