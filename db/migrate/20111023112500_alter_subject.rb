class AlterSubject < ActiveRecord::Migration
  def self.up
	  change_column("subjects", "visible", :boolean, :default => true)
  end

  def self.down
	  change_column("subjects", "visible", :boolean, :default => false)
  end
end

