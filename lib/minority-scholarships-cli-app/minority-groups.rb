class MinorityScholarshipsCliApp::MinorityGroups

  attr_accessor :name, :awards, :total, :description, :url

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    self.delete_ads
  end

  def self.delete_ads
    @@all.each do |ethnicity|
      if ethnicity.name == ""
        @@all.delete(ethnicity)
      end
    end
    @@all
  end

  def self.print_minority_groups
    self.all
    @@all.each.with_index(1) do |ethnicity, index|
      puts "[#{index}] #{ethnicity.name} - #{ethnicity.awards} Awards - #{ethnicity.total} Available"
    end
  end
end ## class END
