class MinorityScholarshipsCliApp::Scraper

  def self.scrape_minority_groups
    doc = Nokogiri::HTML(open("https://www.unigo.com/scholarships/minority"))
  end

  def self.make_minority_groups
    self.scrape_minority_groups.css("#scholarshipWrap .scholarshipBrief.mainCat.brick").each do |brick|
      minority_group = MinorityScholarshipsCliApp::MinorityGroups.new
      minority_group.name = brick.css("h3").css("a").text
      minority_group.awards = brick.css(".totalAvail").text.gsub("awards", "").strip
      minority_group.total = brick.css(".totalValue").text.gsub("total", "").strip
      minority_group.description = brick.css("p").text

      if minority_group.name == ""
        minority_group.url = nil
      else
        minority_group.url = brick.css("h3").css("a").attribute("href").value
      end
    end
  end

  def self.scrape_scholarships
    MinorityScholarshipsCliApp::MinorityGroups.all.each do |minority_group|
      doc = Nokogiri::HTML(open(minority_group.url))
      doc.css("#scholarshipWrap .scholarshipBrief.brick").each do |brick|
        scholarship = MinorityScholarshipsCliApp::Scholarships.new
        scholarship.name = brick.css("h3").text.strip
        scholarship.deadline = brick.css(".deadline").text.strip
        scholarship.description = brick.css("p").text.strip
        scholarship.url = brick.css("h3").css("a").attribute("href").value
        scholarship.amount = Nokogiri::HTML(open(scholarship.url)).css(".totalValue").text.gsub("awarded", "").strip

        scholarship.minority_group = minority_group
        minority_group.add_scholarship(scholarship)
      end
    end
  end

end
