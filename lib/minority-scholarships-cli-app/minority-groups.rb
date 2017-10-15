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

end ## class END
