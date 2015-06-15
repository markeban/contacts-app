class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :contact_groups
  has_many :groups, through: :contact_groups


  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def friendly_updated_at
    updated_at.strftime("%B %e, %Y %l:%m %p ")
  end

  def japan_area_code
    "+81 #{phone_number}"
  end

end
