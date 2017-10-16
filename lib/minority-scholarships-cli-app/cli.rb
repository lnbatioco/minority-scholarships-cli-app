class MinorityScholarshipsCliApp::CLI

  def call
    puts ""
    puts "preparing scholarships...".colorize(:blue)
    puts ""
    load_data
    welcome
    menu
  end

  def welcome
    puts "Welcome!"
    puts "Here is a list of scholarships offered to minority students."
    puts "Scholarship providers encourage ALL minority students to apply."
    puts ""
  end

  def load_data
    MinorityScholarshipsCliApp::Scraper.make_minority_groups
    MinorityScholarshipsCliApp::Scraper.scrape_scholarships
  end

  def print_minority_groups(input = nil)
    MinorityScholarshipsCliApp::MinorityGroups.all.each.with_index(1) do |ethnicity, index|
      if input != nil
        if index == input.to_i
          puts "[x] ".colorize(:green) + "#{ethnicity.name} - #{ethnicity.awards} Awards Available - #{ethnicity.total} Total".colorize(:green)
        else
          puts "[#{index}] #{ethnicity.name}"
        end
      else
        puts "[#{index}] ".colorize(:green) + "#{ethnicity.name}"
      end
    end
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

  def display_error(input)
    if input.to_i >= 6 && input != "exit" && input != nil
      puts "[!] INPUT ERROR. Please enter a different command.".colorize(:red)
      puts ""
    end
  end

  def display_next_page(input)
    if input.to_i > 0 && input.to_i < 6
      MinorityScholarshipsCliApp::MinorityGroups.all.each.with_index(1) do |ethnicity, index|
        if index == input.to_i
          puts "view more #{ethnicity.name} at:".colorize(:red)
          puts "#{ethnicity.url}".colorize(:blue)
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

  def menu
    input = nil
    while input != "exit"
        display_next_page(input)
        puts "------------------------------------------------------------------------".bold
        print_minority_groups(input)
        puts ""
        display_error(input)
        puts "enter the number of the category you would like to view.".colorize(:blue)
        puts "enter 'exit' to end the program.".colorize(:blue)
      puts "------------------------------------------------------------------------".bold

      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 6
        print_scholarships(input)
      elsif input == "exit"
        goodbye
      end
    end
  end

end
