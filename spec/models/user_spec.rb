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

      it { should validate_length_of(:password).is_at_least(3)}

    end

    describe '.authenticate_with_credentials' do
      subject {
          described_class.create(first_name: 'testname', last_name: 'testlastname', email: 'testemail@a.com', password: 'bdc', password_confirmation: 'bdc') }

        it 'should return user when password does match email' do
          expect(subject.authenticate_with_credentials('testemail@a.com','bdc')).to eq (subject)
        end

        it 'should return nil when password does not match email' do
          expect(subject.authenticate_with_credentials('testemail@a.com','bdca')).to eq nil
        end

          it 'should return nil when email does not exist' do
          expect(subject.authenticate_with_credentials('testemail2@a.com','bdc')).to eq nil
        end

        it 'should return user when password contains spaces in front or at the end' do
          expect(subject.authenticate_with_credentials('  testemail@a.com  ','bdc')).to eq (subject)
        end

        it 'should return user when password has upper and lower case mixed' do
          expect(subject.authenticate_with_credentials('TesteMail@a.com','bdc')).to eq (subject)
        end

    end

end
