require 'securerandom'
FactoryBot.define do
  factory :access do
    uuid { SecureRandom.uuid }
    date_time { Time.zone.now.to_f * 1000 }
    path { %w[/index /about /contact /contact].sample }
    user { nil }
  end
end
