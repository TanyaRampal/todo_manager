class Users < ActiveRecord::Base
  def to_displayable_string
    "\nID:#{id}, \nFirst Name: #{first_name}, \nLast Name: #{last_name}, \nEmail: #{email} \nPassword: #{password_digest} \n"
  end
end
