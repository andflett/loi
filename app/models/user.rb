class User < ActiveRecord::Base

  # User roles for CanCan
  ROLES = %w[admin member]
	delegate :can?, :cannot?, :to => :ability

  scope :active, where(:activated => true)
  
  scope :admins, where(:role => "admin")
  scope :members, where(:role => "member")
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :current_password,
                  :remember_me, :join_mailing_list, :name, :role,
                  :gender, :age, :url, :location, :twitter_handle, :activated, :subscribed, 
                  :avatar, :reasons_for_joining

  has_many :posts
  
  validates_presence_of :name
  before_save :check_url_scheme

  mount_uploader :avatar, AvatarUploader
	
	extend FriendlyId
  friendly_id :name, use: :slugged
	
	def short_name
	  self.name.split(' ')[0]
	end
  
  def active_for_authentication? 
    super && activated? 
  end 

  def inactive_message 
    if !activated? 
      :not_approved
    else 
      super
    end 
  end
 
	def ability
	  @ability ||= Ability.new(self)
	end
  
  protected
     def password_required?
      !persisted? || password.present? || password_confirmation.present?
    end

end
