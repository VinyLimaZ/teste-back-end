class JoinUserWithAccessService
  def self.call(user, accesses)
    user.accesses << accesses
    user.save
  end
end
