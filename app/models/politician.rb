require_relative '../../db/config'

class Politician < ActiveRecord::Base
  scope :all_actives, -> {where(in_office: '1')}
  scope :all_active_senators, -> {all_actives.where(title: "Sen")}
  scope :all_senators, -> {where}


  # validates :twitter_id, :uniqueness => true
  #validates :email, :format => { :with => /\w+[@]\w+[.]\w.+/ }
  #validates :age, :numericality => { :greater_than => 4}
  # validates :phone, :format => { :with => /\d{3}.*\d{3}.*\d{4}/ }

  def name
    self.firstname + " " + self.lastname
  end

  def age
    now = Date.today
    now.year - self.birthdate.year - ((now.month > self.birthdate.month || (now.month == self.birthdate.month && now.day >= self.birthdate.day)) ? 0 : 1)
  end

  def self.find_by_state(state)
      self.where("state = ?", state).each do |pol|
      p pol.name
    end
  end

  def self.find_all_senators
    senators = []
    self.where("title = ?", 'Sen').each do |pol|
       senators << pol
    end
    senators
  end

  def self.find_senators_by_state(state)
      puts "Senators:"
      self.where("state = ? AND title = ?", state, 'Sen').each do |pol|
      print pol.name
      puts " (" + pol.party + ")"
    end
  end

  def self.find_representatives_by_state(state)
      puts "Representativs:"
      self.where("state = ? AND title = ?", state, 'Rep').each do |pol|
      print pol.name
      puts " (" + pol.party + ")"
    end
  end
end
