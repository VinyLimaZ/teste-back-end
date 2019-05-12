require 'rails_helper'

describe User do
  describe 'validation' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }
  end

  describe '#create' do
    describe 'validate email attribute' do
      context 'return true if email is valid' do
        subject { build(:user) }
        it { is_expected.to be_valid }
      end
      context 'return false if email is not valid' do
        subject { build(:user, email: 'test.com.br') }
        it { is_expected.not_to be_valid }
      end
    end
  end
end
