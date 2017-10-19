class MinorityScholarshipsCliApp::CLI

  def call
    load_data
    welcome
    menu
  end

  def load_data
    puts ""
    puts "loading scholarships...".colorize(:blue)
    puts ""
    MinorityScholarshipsCliApp::Scraper.make_minority_groups
    MinorityScholarshipsCliApp::Scraper.scrape_scholarships
  end

  def welcome
    puts "--------------------------------------------------------------------------"
    puts "                          MINORITY SCHOLARSHIPS                           ".bold
    puts "--------------------------------------------------------------------------"
    puts ""
    puts "Welcome!"
    puts "Here is a list of scholarships offered to minority students."
    puts "Scholarship providers encourage ALL minority students to apply."
    puts ""
  end

  def menu
    input = nil
    while input != "exit"
      view_more_scholarships(input)
      puts "``` MENU `````````````````````````````````````````````````````````````````"
        how_to_print_minority_groups(input)
        puts ""
        puts "Enter the number of the category you would like to view.".colorize(:blue)
        puts "Enter 'exit' to end the program.".colorize(:blue)
      puts "``````````````````````````````````````````````````````````````````````````"

      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 6
        print_scholarships(input)
      elsif input == "exit"
        goodbye
      end
    end
  end

  def how_to_print_minority_groups(input = nil)
    if input == nil
      print_minority_groups(input)
    elsif input.to_i > 0 && input.to_i < 6
      print_minority_groups_with_valid_input(input)
    else
      print_minority_groups(input)
      input_error
    end
  end

  def print_minority_groups(input)
    MinorityScholarshipsCliApp::MinorityGroups.all.each.with_index(1) do |minority_group, index|
      puts "[#{index}] ".bold.colorize(:green) + "#{minority_group.name}"
    end
  end

  def print_minority_groups_with_valid_input(input)
    MinorityScholarshipsCliApp::MinorityGroups.all.each.with_index(1) do |minority_group, index|
      if index == input.to_i
        puts "[x] #{minority_group.name.upcase} - #{minority_group.awards} AWARDS - #{minority_group.total} TOTAL".bold.colorize(:green)
      else
        puts "[#{index}] #{minority_group.name}"
      end
    end
  end

  def input_error
    puts ""
    puts "[!] ".bold.colorize(:red) + "INVALID INPUT. Please try again.".colorize(:red)
  end

  def print_scholarships(input)
    MinorityScholarshipsCliApp::MinorityGroups.all[input.to_i - 1].scholarships.each.with_index(1) do |scholarship, index|
      puts " #{index} ".bold.colorize(:color => :white, :background => :blue) + " #{scholarship.name.upcase}".bold.colorize(:green)
      puts "Amount: #{scholarship.amount}"
      puts "Deadline: #{scholarship.deadline}"
      puts "Info: #{scholarship.description}"
      puts "Link: " + "#{scholarship.url}".colorize(:blue)
      puts ""
      puts ""
    end
  end

  def view_more_scholarships(input)
    if input.to_i > 0 && input.to_i < 6
      MinorityScholarshipsCliApp::MinorityGroups.all.each.with_index(1) do |minority_group, index|
        if index == input.to_i
          puts ""
          puts "View more #{minority_group.name} at:".colorize(:red)
          puts "#{minority_group.url}".colorize(:blue)
          puts ""
        end
      end
    end
  end

  def goodbye
    puts ""
    puts "Goodbye!! Thank you for using the Minority Scholarships app!".colorize(:red)
    puts ""
  end

end
