require 'rails_helper'

#RSpec.describe Todo, type: :model do
#  describe "validations" do
#   it { is_expected.to validate_presence_of(:title) }
 #end
#end

describe Todo do
  describe "validation" do
    it "is invalid without a description" do
      todo = Todo.new(title: "")
      todo.valid?
      expect(todo.errors).to have_key(:title)
    end
  end
end
