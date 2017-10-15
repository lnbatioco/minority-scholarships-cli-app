class MinorityScholarshipsCliApp::CLI
  def call
    welcome
    print_minority_groups
  end

  def welcome
    puts "------------------------------- Welcome! -------------------------------"
    puts "Here is a list of scholarships offered to minority students."
    puts "Scholarship providers encourage ALL minority students to apply."
    puts ""
  end

  def print_minority_groups
    MinorityScholarshipsCliApp::Scraper.make_minority_groups
    MinorityScholarshipsCliApp::MinorityGroups.print_minority_groups
  end
end
