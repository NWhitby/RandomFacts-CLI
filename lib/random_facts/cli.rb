class RandomFacts::CLI  
  
  def call  
    @scraper = RandomFacts::Scraper.new
    @scraper.scrape_page  
    welcome
    list_facts
    menu_selection
  end

  def welcome
    puts ""
    puts "- - - - - - - - - - - - - - - - - -"
    puts ""
    puts "Welcome to Random Facts!!".colorize(:yellow)
    puts ""
    puts "Listed below are the titles to fun facts.".colorize(:yellow)
    puts ""
    puts "To view more information enter the associated number.".colorize(:yellow)
    puts ""  
    puts "- - - - - - - - - - - - - - - - - -"
    puts ""   
  end

  def list_facts
    @facts = RandomFacts::Fact.all    
    @facts.each_with_index do |fact, index|
      puts "#{index+1}. #{fact.intro}"
    end
  end  

  def menu_selection

		input = ''

		while input != 'exit'
			puts ''
			puts 'Enter a fun fact number for more details, "list" to see the menu again or "exit".'

			input = gets.strip.downcase

			if input.to_i > 0 && input.to_i < RandomFacts::Fact.all.size+1
        puts "FACT: #{RandomFacts::Fact.all[input.to_i - 1].intro}".colorize(:red)	
        puts ""
				puts RandomFacts::Fact.all[input.to_i - 1].summary.colorize(:red)	
			elsif input == 'list'
				list_facts
			elsif input == 'exit'
        goodbye
			else
				puts 'Invalid selection!'.colorize(:red)
				menu_selection
			end	
    end
    
  end 

  def goodbye
    puts ""
    puts "- - - - - - - - - - - - - - - - - -"
    puts ""
    puts "Thanks for viewing Random Facts!!".colorize(:yellow)	 
    puts ""
    puts "- - - - - - - - - - - - - - - - - -"
    puts ""      
    exit
  end

end