class RandomFacts::Scraper

  def scrape_page
    doc = Nokogiri::HTML(open('https://www.thefactsite.com/top-100-random-funny-facts/#'))

    doc.css("div .factlet").each do |fact|

      fact_attributes = {  	

       intro: fact.css("h2").text,
       summary: fact.css("p").text 
     }

     new_fact = RandomFacts::Fact.new(fact_attributes)

      new_fact.save
   end	   

  end

end
