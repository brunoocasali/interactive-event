class Contact < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true,
                    format: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
end
