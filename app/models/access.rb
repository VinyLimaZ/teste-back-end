class Access < ApplicationRecord
  belongs_to :user, optional: true

  validates :uuid, :path, :date_time, presence: true

  def initialize(params)
    params[:date_time] = date_time_fixed(params[:date_time])
    super(params)
  end

  def self.uuid_uniqueness?(uuid)
    where(uuid: uuid).limit(1).blank?
  end

  def date_time_fixed(date_time)
    Time.zone.at(date_time.to_i / 1000)
  end
end
