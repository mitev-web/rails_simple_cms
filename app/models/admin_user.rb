class AdminUser < ActiveRecord::Base
has_and_belongs_to_many :pages
end
