class Author < ActiveRecord::Base
  validates_presence_of :name, :password, :password_confirmation, :email, :security_question, :security_answer
  validates_confirmation_of :password
end