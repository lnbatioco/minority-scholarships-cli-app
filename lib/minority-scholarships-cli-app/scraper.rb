class MinorityScholarshipsCliApp::Scraper

  def self.scrape_minority_groups
    doc = Nokogiri::HTML(open("https://www.unigo.com/scholarships/minority"))
  end

  def self.make_minority_groups
    self.scrape_minority_groups.css("#scholarshipWrap .scholarshipBrief.mainCat.brick").each do |brick|
      ethnicity = MinorityScholarshipsCliApp::MinorityGroups.new
      ethnicity.name = brick.css("h3").css("a").text
      ethnicity.awards = brick.css(".totalAvail").text.gsub("awards", "").strip
      ethnicity.total = brick.css(".totalValue").text.gsub("total", "").strip
      ethnicity.description = brick.css("p").text

      if ethnicity.name == ""
        ethnicity.url = nil
      else
        ethnicity.url = brick.css("h3").css("a").attribute("href").value
      end
    end
  end

  def self.scrape_scholarships
    MinorityScholarshipsCliApp::MinorityGroups.all.each do |ethnicity|
      doc = Nokogiri::HTML(open(ethnicity.url))
      doc.css("#scholarshipWrap .scholarshipBrief.brick").each do |brick|
        scholarship = MinorityScholarshipsCliApp::Scholarships.new
        scholarship.name = brick.css("h3").text.strip
        scholarship.deadline = brick.css(".deadline").text.strip
        scholarship.description = brick.css("p").text.strip
        scholarship.url = brick.css("h3").css("a").attribute("href").value
        scholarship.amount = Nokogiri::HTML(open(scholarship.url)).css(".totalValue").text.gsub("awarded", "").strip

        scholarship.ethnicity = ethnicity
        ethnicity.add_scholarship(scholarship)
      end
    end
  end

end ## class END
