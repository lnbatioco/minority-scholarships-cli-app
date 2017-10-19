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
    @@all.each do |minority_group|
      if minority_group.name == ""
        @@all.delete(minority_group)
      end
    end
    @@all
  end

  def add_scholarship(scholarship)
    @scholarships << scholarship
    scholarship.minority_group = self
  end

end
