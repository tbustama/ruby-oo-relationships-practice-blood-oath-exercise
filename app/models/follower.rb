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
   
    def cults
        BloodOath.all.select{|oath| oath.follower == self}
    end

    def join_cult(cult)
        BloodOath.new(self, cult)
    end

    def self.of_a_certain_age(age)
        self.all.select{|follower| follower.age >= age}
    end

    def my_cults_slogans
        self.cults.each{ |oath| puts oath.cult.slogan }
    end

    def self.most_active
        followers = BloodOath.all.map{|oath| oath.follower}
        followers.max_by {|follower| followers.count(follower)}
    end

    def self.top_ten
        followers = BloodOath.all.map{|oath| oath.follower}
        followers.sort_by {|follower| followers.count(follower)}.uniq.reverse[0,9]
    end
end