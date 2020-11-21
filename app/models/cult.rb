class Cult
    attr_reader :name, :location, :founding_year, :slogan
    @@all = []
    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end
    def self.all
        @@all
    end

    def recruit_follower(follower)
        if follower.age >= self.minimum_age
            BloodOath.new(follower, self)
        else  
            "Sorry kiddo, no cult for you"
        end
    end

    def cult_population
        BloodOath.all.sum{|oath| oath.cult == self ? 1 : 0 }
    end

    def self.find_by_name(name)
        self.all.find{|cult| cult.name == name}
    end

    def self.find_by_location(location)
        self.all.select{|cult| cult.location == location}
    end

    def self.find_by_founding_year(year)
        self.all.select{|cult| cult.founding_year == year}
    end

    def average_age
        self.get_followers.sum{|follower| follower.age}.to_f / get_followers.length
    end

    def my_followers_mottos
        self.get_oaths.each{|oath| puts oath.follower.life_motto}
    end

    def self.least_popular
        self.all.sort_by{|cult| cult.cult_population}.first
    end

    def self.most_common_location
        locations = self.all.map{|cult| cult.location}
        locations.max_by {|location| locations.count(location)}
    end

    def get_followers
        self.get_oaths.map{|oath| oath.follower}.uniq
    end

    def get_oaths
        BloodOath.all.select{|oath| oath.cult == self}
    end

    def minimum_age
        21
    end
    
end