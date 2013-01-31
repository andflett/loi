class User < ActiveRecord::Base

  # User roles for CanCan
  ROLES = %w[admin member]
	delegate :can?, :cannot?, :to => :ability  
  scope :admins, where(:role => "admin")
  scope :members, where(:role => "member")
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :current_password,
                  :remember_me, :join_mailing_list, :name, :role

  has_many :posts  
  validates_presence_of :name
	
	def short_name
	  self.name.split(' ')[0]
	end
  
	def ability
	  @ability ||= Ability.new(self)
	end
  
  protected
     def password_required?
      !persisted? || password.present? || password_confirmation.present?
    end

end
