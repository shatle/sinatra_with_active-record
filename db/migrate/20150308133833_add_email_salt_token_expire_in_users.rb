class AddEmailSaltTokenExpireInUsers < ActiveRecord::Migration
  def change
    add_column(:users, :email, :string)
    add_column(:users, :salt, :string)
    add_column(:users, :token, :string)
    add_column(:users, :expired, :datetime)
  end
end
