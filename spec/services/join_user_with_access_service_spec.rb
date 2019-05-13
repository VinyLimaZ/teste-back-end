describe JoinUserWithAccessService do
  include ActiveSupport::Testing::TimeHelpers
  describe '.call' do
    context 'if the contact is valid' do
      let(:user) { build(:user) }
      let(:uuid) { SecureRandom.uuid }
      before do
        5.times do |t|
          travel(t.minute) do
            Access.create(attributes_for(:access, uuid: uuid))
          end
        end
        described_class.join(user, uuid).save
      end

      it 'join all previous access to it' do
        expect(user.accesses.size).to eq(5)
        expect(Access.where(user_id: nil)).to be_empty
      end
    end
  end
end
