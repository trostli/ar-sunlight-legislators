require_relative '../../db/config'

class Politician < ActiveRecord::Base
  scope :all_actives, -> {where(in_office: '1')}
  scope :all_active_senators, -> {all_actives.where(title: "Sen")}
  scope :all_active_representatives, -> {all_actives.where(title: "Rep")}
  scope :all_senators, -> {where(title: "Sen")}


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

  def self.senate_count
    sen_count = self.all_active_senators.count
    puts "Senators: " + sen_count.to_s
  end  

  def self.rep_count
    rep_count = self.all_active_representatives.count
    puts "Representatives: " + rep_count.to_s
  end

  def self.count_by_state(state)
    sen_count = self.where("state = ?", state).all_active_senators.count
    rep_count = self.where("state = ?", state).all_active_representatives.count
    puts state + ": " + sen_count.to_s + " Senators, " + rep_count.to_s + " Representatives"
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
      puts "Representatives:"
      self.where("state = ? AND title = ?", state, 'Rep').each do |pol|
      print pol.name
      puts " (" + pol.party + ")"
    end
  end

  def self.count_sen_by_gender(gender)
    if gender == 'M' 
      print 'Male Senators: '
    else
      print 'Female Senators: '
    end
    puts (self.all_active_senators.where("gender = ?", gender).count.to_f / self.all_active_senators.count.to_f * 100).to_s + "%"
  end

  def self.count_rep_by_gender(gender)
    if gender == 'M' 
      print 'Male Representatives: '
    else
      print 'Female Representatives: '
    end
    puts (self.all_active_representatives.where("gender = ?", gender).count.to_f / self.all_active_representatives.count.to_f * 100).to_s + "%"
  end

end
