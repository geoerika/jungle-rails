require 'rails_helper'
require 'pp'

RSpec.describe Product, type: :model do
  subject{ described_class.new}

   it "is valid with valid attributes" do
    subject.name = "Product name"
    subject.price = 20.00
    subject.quantity = 10
    subject.category = Category.new(:name =>"furniture")
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    subject.price = 20.00
    subject.quantity = 10
    subject.category = Category.new(:name =>"shoes")
    expect(subject).to_not be_valid
  #   subject.valid?
  #   debugger
  #   subject.errors[:name].should_not include("is not valid without a name")
  end

   it "is not valid without a price" do
    subject.name = "Product name"
    subject.price = nil
    subject.quantity = 10
    subject.category = Category.new(:name =>"furniture")
    expect(subject).to_not be_valid
  end

   it "is valid with without a quantity" do
    subject.name = "Product name"
    subject.price = 20.00
    subject.quantity = nil
    subject.category = Category.new(:name =>"books")
    expect(subject).to_not be_valid
  end

   it "is valid without category" do
    subject.name = "Product name"
    subject.price = 20.00
    subject.quantity = 10
    subject.category = nil
    expect(subject).to_not be_valid
  end

  # let(:category) {Category.new(:name =>"furniture")}

  # subject {
  #   described_class.new(name: 'some name', price: 20.00, quantity: 10, category: category)}

  #   describe "Validations" do
  #     it "is valid with valid attributes" do
  #       expect(subject).to be_valid
  #     end

  #     it "is valid without a name" do
  #       subject.name = nil
  #       expect(subject).to_not be_valid
  #     end

  #     it "is valid without a price" do
  #       subject.price = nil
  #       expect(subject).to_not be_valid
  #     end

  #     it "is valid without a quantity" do
  #       subject.quantity = nil
  #       expect(subject).to_not be_valid
  #     end

  #     it "is valid without a category" do
  #       subject.category = nil
  #       expect(subject).to_not be_valid
  #     end
  #   end
end
