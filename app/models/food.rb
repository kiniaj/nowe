#coding: UTF-8

class Food < ActiveRecord::Base
  belongs_to :animal
end