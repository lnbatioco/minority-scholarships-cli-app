class MinorityScholarshipsCliApp::Scraper

  def self.scrape_minority_groups
    doc = Nokogiri::HTML(open("https://www.unigo.com/scholarships/minority"))
  end

  def self.make_minority_groups
    self.scrape_minority_groups.css("#scholarshipWrap .scholarshipBrief.mainCat.brick").each do |group|
      ethnicity = MinorityScholarshipsCliApp::MinorityGroups.new
      ethnicity.name = group.css("h3").css("a").text
      ethnicity.awards = group.css(".totalAvail").text.gsub("awards", "").strip
      ethnicity.total = group.css(".totalValue").text.gsub("total", "").strip
      ethnicity.description = group.css("p").text

      if ethnicity.name == ""
        ethnicity.url = nil
      else
        ethnicity.url = group.css("h3").css("a").attribute("href").value
      end
    end
  end

end ## class END
