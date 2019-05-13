class Access < ApplicationRecord
  belongs_to :user, optional: true

  validates :uuid, :path, :date_time, presence: true

  def initialize(params)
    params[:date_time] = date_time_fixed(params[:date_time])
    user_id = Access.find_by_uuid(params[:uuid])&.user_id
    super(params.merge({user_id: user_id}))
  end

  def self.uuid_uniqueness?(uuid)
    where(uuid: uuid).limit(1).blank?
  end

  private

  def date_time_fixed(date_time)
    Time.zone.at(date_time.to_i / 1000)
  end
end
