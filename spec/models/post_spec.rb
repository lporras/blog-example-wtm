require 'rails_helper'

RSpec.describe Post, type: :model do

  describe "Validations" do

    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }

    it { should validate_presence_of(:body) }

    it { should belong_to(:user) }
    it { should belong_to(:category) }
    it { should have_many(:comments) }
  end

  describe "category_name method" do
    it "return name of the category" do
      category = Category.create(name: "categoria 1")
      post = Post.create(title: "mi post", body: "el contenido del post", category_id: category.id)
      expect(post.category_name).to eql(category.name)
    end
  end

end
