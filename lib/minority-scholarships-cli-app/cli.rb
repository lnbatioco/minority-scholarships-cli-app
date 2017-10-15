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
  end

  def load_data
    MinorityScholarshipsCliApp::Scraper.make_minority_groups
    MinorityScholarshipsCliApp::Scraper.scrape_scholarships
  end

  def print_minority_groups
    MinorityScholarshipsCliApp::MinorityGroups.print_minority_groups
  end

  def current_view(input)
    if input.to_i > 0 && input.to_i < 6
      puts "viewing: #{MinorityScholarshipsCliApp::MinorityGroups.all[input.to_i - 1].name.upcase}"
      puts ""
    elsif input.to_i >= 6
      puts "[!] INPUT ERROR. Please enter a different command."
      puts ""
    end
  end

  def goodbye
    puts ""
    puts "Goodbye!! Thank you for using the Minority Scholarships app!"
    puts ""
  end

  def menu
    input = nil
    while input != "exit"
      puts "------------------------------------------------------------------------"
        print_minority_groups
        puts ""
        current_view(input)
        puts "enter the number of the category you would like to view."
        puts "enter 'exit' to end the program."
      puts "------------------------------------------------------------------------"

      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 6
        MinorityScholarshipsCliApp::MinorityGroups.all[input.to_i - 1].scholarships
      elsif input == "exit"
        goodbye
      end
    end
  end

end
