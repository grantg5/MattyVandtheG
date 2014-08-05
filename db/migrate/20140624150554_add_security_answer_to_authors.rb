class AddSecurityAnswerToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :security_answer, :string
  end
end
