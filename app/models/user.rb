class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Instance Methods

  def update_user_profile(user_params)
    self.update(user_params)

    # This could be change to something like (try first)
    # self.update(user_params)
  end

end
