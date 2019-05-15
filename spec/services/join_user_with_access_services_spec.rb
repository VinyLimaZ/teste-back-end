describe JoinUserWithAccessServices do
  describe '.call' do
    context 'if the contact is valid' do
      let(:uuid) { SecureRandom.uuid }
      let(:user) { build(:user, uuid: uuid) }
      before do
        5.times do |t|
          travel(t.minute) do
            Access.create(attributes_for(:access, uuid: uuid))
          end
        end
        described_class.join(user).save
      end

      it 'join all previous access to it' do
        expect(user.accesses.size).to eq(5)
        expect(Access.where(user_id: nil)).to be_empty
      end
    end
  end
end
