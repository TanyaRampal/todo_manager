class Users < ActiveRecord::Base
  def to_displayable_string
    "\nID:#{id}, \nName:#{name}, \nEmail:#{email} \nPassword#{password} \n"
  end
end
