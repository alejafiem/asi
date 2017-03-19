class SongPolicy
  attr_reader :user

  def initialize(user, song)
    @user = user
  end

  def update?
    user.admin?
  end
end