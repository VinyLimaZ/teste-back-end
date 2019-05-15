describe AccessReportSerializers do
  describe '.call' do
    context 'return a valid json' do
      let(:user) { create(:user) }
      let!(:access_one) do
        travel(1.minute) do
          Access.new(attributes_for(:access, user_id: user.id)).tap(&:save)
        end
      end
      let!(:access_two) do
        travel(1.day) do
          Access.new(attributes_for(:access, user_id: user.id)).tap(&:save)
        end
      end

      let(:json_result) do
        [access_two.as_json.merge("user": 1),
         access_one.as_json.merge("user": 2)].as_json
      end
      subject { described_class.call }

      it { expect(subject.first['uuid']).to match json_result.first['uuid'] }
      it { expect(subject.first['user']).to match json_result.first['user'] }
    end
  end
end
