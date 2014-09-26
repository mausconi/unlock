class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :initiatives
  has_many :contributions

  before_save do
    self.name = self.email.match(/(.+)@/)[1] unless self.name.present?
    self.document = self.document.scan(/\d/).join('') if self.document
    self.phone_area_code = self.phone_area_code.scan(/\d/).join('') if self.phone_area_code
    self.phone_number = self.phone_number.scan(/\d/).join('') if self.phone_number
    self.address_zipcode = self.address_zipcode.scan(/\d/).join('') if self.address_zipcode
  end

end
