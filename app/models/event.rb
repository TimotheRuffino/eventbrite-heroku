class Event < ApplicationRecord

  #def attend_to_event_send
   # UserMailer.attend_to_event_email(self).deliver_now
  #end

  #def self.event_to_att
  #end

  has_one_attached :avatar

  has_many :attendances
  has_many :users, through: :attendances

  belongs_to :admin, class_name: 'User' #, optional: true
  has_many :attendances
  has_many :users, through: :attendances

  

  validates :duration, presence: true
  #multiple de 5? 
  validates :description, presence: true, length: {minimum: 20, maximum: 1000}
  validates :price, presence: true
  validates :location, presence: true
end
