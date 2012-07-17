class User
  include MongoMapper::Document
  include ActiveModel::Validations

  authenticates_with_sorcery!

  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
end
