class Subject < ActiveRecord::Base
has_one :pages

scope :invisible, where(:visible => false)
scope :visible, where(:visible => true)
#lambda expr scope with sql escape
scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

#pass 2 or more parameters
scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}

end
