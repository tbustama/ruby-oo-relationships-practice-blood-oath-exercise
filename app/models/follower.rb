class Follower
    attr_accessor :life_motto, :age, :name
    @@all = []
    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end
    def self.all
        @@all
    end
   
    def oaths
        BloodOath.all.select{|oath| oath.follower == self}
    end

    def cults 
        self.oaths.map{|oath| oath.cult}.uniq
    end

    def join_cult(cult)
        if self.age >= cult.minimum_age
            BloodOath.new(self, cult)
        else  
            "Sorry kiddo, no cult for you"
        end
    end

    def self.of_a_certain_age(age)
        self.all.select{|follower| follower.age >= age}
    end

    def my_cults_slogans
        self.oaths.each{ |oath| puts oath.cult.slogan }
    end

    def self.most_active
        followers = BloodOath.all.map{|oath| oath.follower}
        followers.max_by {|follower| followers.count(follower)}
    end

    def self.top_ten
        followers = BloodOath.all.map{|oath| oath.follower}
        followers.sort_by {|follower| followers.count(follower)}.uniq.reverse[0,9]
    end

    def fellow_cult_members
        self.cults.map{|cult| cult.get_followers}.flatten().select{|follower| follower != self}
    end
end