class MinorityScholarshipsCliApp::MinorityGroups

  attr_accessor :name, :awards, :total, :description, :url

  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end ## class END
