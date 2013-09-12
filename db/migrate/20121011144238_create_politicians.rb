https://github.com/muchness/ar-student-schemarequire_relative '../config'

class CreatePoliticians < ActiveRecord::Migration

def change
   create_table :politicians do |row|
      row.string :title
      row.string :firstname
      row.string :middlename
      row.string :lastname
      row.string :name_suffix
      row.string :nickname
      row.string :party
      row.string :state
      row.string :district
      row.binary :in_office
      row.string :gender
      row.string :phone
      row.string :fax
      row.string :website
      row.string :webform
      row.string :congress_office
      row.string :bioguide_id
      row.string :votesmart_id
      row.string :fec_id
      row.string :govtrack_id
      row.string :crp_id
      row.string :twitter_id
      row.string :congresspedia_url
      row.string :youtube_url
      row.string :facebook_id
      row.string :official_rss
      row.string :senate_class
      row.date   :birthdate
    end
end


