class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :pins, dependent: :destroy # second part deletes dependent pins if user deletes account

  validates :firstname, presence: true
  validates :lastname, presence: true

	def fullname
	  [firstname, lastname].join(' ')
	end
end
