class JoinUserWithAccessService
  def self.join(user, uuid)
    user.tap { |u| u.accesses << accesses(uuid) }
  end

  private

  def self.accesses(uuid)
    Access.where(uuid: uuid, user_id: nil)
  end
end
