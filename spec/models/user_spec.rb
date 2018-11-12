require 'rails_helper'

RSpec.describe User, type: :model do

   subject {
    described_class.new(first_name: 'some first name', last_name: 'some last name', email: 'alan@b.com', password: 'abc', password_confirmation: 'abc')}

    describe "Validations" do

      it "is valid with valid attributes" do
        expect(subject).to be_valid
      end

      it "is valid with valid password_confirmation" do
        subject.password = 'abc'
        subject.password_confirmation = 'abc'
        expect(subject).to be_valid
      end

      it "is not valid with password_confirmation not equal to password" do
        subject.password = 'pass'
        subject.password_confirmation = 'pass1'
        expect(subject).to_not be_valid
      end

      it "is not valid without a first_name" do
        subject.first_name = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a last_name" do
        subject.last_name = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without an email" do
        subject.email = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a password" do
        subject.password = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a password_confirmation" do
        subject.password_confirmation = nil
        expect(subject).to_not be_valid
      end

      context 'when email is not unique' do
        before { described_class.create!(first_name: 'foo', last_name: 'foo', email: 'alan@b.com', password: 'bdc', password_confirmation: 'bdc') }
        it {expect(subject).to_not be_valid}
      end

      context 'when email is not case sensitive' do
        before { described_class.create!(first_name: 'foo', last_name: 'foo', email: 'Alan@b.com', password: 'bdc', password_confirmation: 'bdc') }
        it {expect(subject).to_not be_valid}
      end
    end

end
