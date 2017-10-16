class MinorityScholarshipsCliApp::MinorityGroups

  attr_accessor :name, :awards, :total, :description, :url, :scholarships

  @@all = []

  def initialize
    @@all << self
    @scholarships = []
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

  def add_scholarship(scholarship)
    @scholarships << scholarship
    scholarship.ethnicity = self
  end

end
