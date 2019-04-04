class RandomFacts::Fact

  attr_accessor :intro, :summary

  @@all = []

  def initialize(attr_hash)
    attr_hash.each {|key, value| send("#{key}=", value)}
    #@intro = attr_hash[:intro]
    #@summary = attr_hash[:summary] 
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end 

  
end