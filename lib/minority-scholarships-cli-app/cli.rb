class MinorityScholarshipsCliApp::CLI
  def call
    puts ""
    puts "preparing scholarships..."
    puts ""
    load_data
    welcome
    menu
  end

  def welcome
    puts "------------------------------- Welcome! -------------------------------"
    puts "Here is a list of scholarships offered to minority students."
    puts "Scholarship providers encourage ALL minority students to apply."
    puts ""
  end

  def load_data
    MinorityScholarshipsCliApp::Scraper.make_minority_groups
    MinorityScholarshipsCliApp::Scraper.scrape_scholarships
  end

  def print_minority_groups
    MinorityScholarshipsCliApp::MinorityGroups.print_minority_groups
  end

  def menu
    print_minority_groups
    puts ""
    puts "enter the number of the category you would like to view."
    puts "enter 'exit' to end the program."
    puts ""
  end
end
