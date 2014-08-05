class AddSecurityQuestionToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :security_question, :string
  end
end
