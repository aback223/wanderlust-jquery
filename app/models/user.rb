class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  has_many :attendee_lists
  has_many :itineraries, through: :attendee_lists
end
