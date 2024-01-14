class UsersGrid < BaseGrid

  scope do
    User
  end

  filter(:id, :integer)
  filter(:created_at, :date, range: true)

  column(:id)
  column(:first_name)
  date_column(:created_at)
end
