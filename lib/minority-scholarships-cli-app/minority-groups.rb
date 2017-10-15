class MinorityScholarshipsCliApp::MinorityGroups

  attr_accessor :name, :awards, :total, :description, :url, :scholarship

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

  def self.print_minority_groups
    self.all
    @@all.each.with_index(1) do |ethnicity, index|
      puts "[#{index}] #{ethnicity.name} - #{ethnicity.awards} Awards - #{ethnicity.total} Available"
    end
  end

  def add_scholarship(scholarship)
    @scholarships << scholarship
    scholarship.ethnicity = self
  end

  def scholarships
    @scholarships.each.with_index(1) do |scholarship, index|
      puts "[#{index}]"
      puts "Name: #{scholarship.name.upcase}"
      puts "Amount: #{scholarship.amount}"
      puts "Deadline: #{scholarship.deadline}"
      puts "Info: #{scholarship.description}"
      puts "Link: #{scholarship.url}"
    end
  end

end
