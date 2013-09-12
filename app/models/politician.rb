require_relative '../../db/config'
require 'date'

class Politician < ActiveRecord::Base

  validates :twitter_id, :uniqueness => true
  #validates :email, :format => { :with => /\w+[@]\w+[.]\w.+/ }
  #validates :age, :numericality => { :greater_than => 4}
  validates :phone, :format => { :with => /\d{3}.*\d{3}.*\d{4}/ }

  def name
    self.firstname + " " + self.lastname
  end

  def age
    now = Date.today
    now.year - self.birthdate.year - ((now.month > self.birthdate.month || (now.month == self.birthdate.month && now.day >= self.birthdate.day)) ? 0 : 1)
  end
end
