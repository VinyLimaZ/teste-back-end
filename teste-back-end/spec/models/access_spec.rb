require 'rails_helper'

describe Access do
  describe '.new' do
    describe 'when date time is valid' do
      context 'fill the date_time attr' do
        let(:access_params) { attributes_for(:access) }
        let(:time) { Time.zone.at(1557773771343 / 1000) }
        subject { described_class.new(access_params).date_time }

        it { is_expected.to eq time }
      end
    end
  end

  describe '.create' do
    describe 'evokes new to normalize data' do
      context 'and returns a new access instance' do
        let(:access_params) { attributes_for(:access) }
        subject { described_class.create(access_params) }

        it { is_expected.to be_persisted }
        it { expect(subject.class).to eq(Access) }
      end
    end
  end

  describe '.uuid_uniq?' do
    describe 'if uuid is uniq' do
      context 'returns true' do
        subject { described_class.uuid_uniq?(SecureRandom.uuid) }
        it { is_expected.to be true }
      end
    end
    describe 'if uuid isnt uniq' do
      context 'returns false' do
        let(:uuid) { SecureRandom.uuid }
        before { described_class.create(attributes_for(:access, uuid: uuid)) }

        subject { described_class.uuid_uniq?(uuid) }

        it { is_expected.to be false }
      end
    end
  end
end
