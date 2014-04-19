class User < ActiveRecord::Base

  include DeviseTokenAuthenticable::Model
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, :rememberable, :async

  mount_uploader :profile_image, ProfileImageUploader

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def name
    [first_name, last_name].join(' ').strip
  end

  def super_admin?
    role == 'super_admin'
  end

  def as_json( options = {} )
    new_options = options.merge({ only: [:email, :first_name, :last_name, :current_sign_in_at] })

    super new_options
  end

end
