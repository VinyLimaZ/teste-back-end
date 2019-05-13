require 'securerandom'
FactoryBot.define do
  factory :access do
    uuid { SecureRandom.uuid }
    date_time { Time.zone.now.to_f * 1000 }
    #date_time { 1557773771343 } # Mon, 13 May 2019 15:56:11 -03 -03:00
    path { %w[/index /about /contact /contact].sample }
    user { nil }
  end
end
