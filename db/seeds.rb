# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

5.times do |x|
Page.create(:name => "Page #{x}", :position => x, :visible => "true" )
Subject.create(:name => "Subject #{x}", :position => x, :visible => "true" )
Section.create(:name => "Subject #{x}", :position => x, :visible => "true" )
end

a = AdminUser.create(:first_name => 'pero', :last_name => 'perev', :username =>'tt17')
p = Page.first
p.editors << a
Section.create(:name =>"Section One", :position => 1)
