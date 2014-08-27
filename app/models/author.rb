class Author < ActiveRecord::Base
  validates_presence_of :name, :password, :password_confirmation, :email, :security_question, :security_answer
  validates_confirmation_of :password
  
  before_save :encrypt
  
  def self.authenticate name, password
    @author = find_by_name(name)
	
	if @author && @author.password == BCrypt::Engine.hash_secret(password, @author.password_salt)
	  return @author
	end
	return false
  end
  
  def encrypt
	if password.present?
	  self.password_salt = BCrypt::Engine.generate_salt
	  self.password = BCrypt::Engine.hash_secret(password, password_salt)
	
	  self.security_salt = BCrypt::Engine.generate_salt
	  self.security_answer = BCrypt::Engine.hash_secret(security_answer, security_salt)
	end
  end
end