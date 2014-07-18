#coding: UTF-8

class Animal < ActiveRecord::Base
  before_create :zero_friends

  # :name, :age, :color
  validates :name, presence: true

  scope :old, ->{where("age>10")}

  has_many :foods
  
  belongs_to :user

  protected
    def zero_friends
      self.friends=0
    end
end