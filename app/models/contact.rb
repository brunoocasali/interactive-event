class Contact < ActiveRecord::Base
  paginates_per 80

  validates :email, presence: true, uniqueness: true,
                    format: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
end
