class BloodOath
    attr_reader :initiation_date
    attr_accessor :cult, :follower
    @@all = []
    def initialize(follower, cult)
        @follower = follower
        @cult = cult
        time = Time.now
        @initiation_date = Time.now.to_s.split(/ /)[0]
        @@all << self
    end
    def self.all
        @@all
    end
    
    def self.first_oath
        self.all.first.follower
    end
end