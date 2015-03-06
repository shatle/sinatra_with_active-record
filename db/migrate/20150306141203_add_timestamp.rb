class AddTimestamp < ActiveRecord::Migration
  def change
    # users
    add_column(:users, :created_at, :datetime)
    add_column(:users, :updated_at, :datetime)
    # teams
    add_column(:teams, :created_at, :datetime)
    add_column(:teams, :updated_at, :datetime)
  end
end
