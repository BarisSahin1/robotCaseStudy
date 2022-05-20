require 'pry'

class Robot
    # Getters and setters are defined
    attr_accessor :xloc, :yloc, :head, :key, :headHash

    # Initializer for Robot class
    def initialize(xloc,yloc,head,x,y)
        @xloc = xloc
        @yloc = yloc
        @head = head
        #Hash for head direction each key represent directions
        @headHash = {1 => "N",2 => "E",3 => "S",4 => "W"}
        @key = @headHash.key(@head)
        @@area =[[x][y]]
    end
    
    # Move method which change location of robot object according to rotation param 
    def move(rotation)
        p rotation
        chars = rotation.to_s.split("")  
        chars.each do |char|
            navigation(char)         
        end
    end
    
    # Method to calculate finish location of robot object 
    def navigation(char)
        
        if char == "L"
            @key = headCalc(char)
            @head = @headHash[@key]
        elsif char == "R"
            @key = headCalc(char)
            @head = @headHash[@key]
        elsif char == "M"
            if @head == "N" 
                @yloc = @yloc + 1
            elsif @head == "S"
                @yloc = @yloc - 1
            elsif @head == "W"
                 @xloc = @xloc - 1 
            elsif @head == "E"
               @xloc = @xloc + 1
            end
        end
=begin  p "Key: #{@key}" 
        p "Head : #{@head}"
        p "xloc : #{@xloc}"
        p "yloc : #{@yloc}"
=end
    end

    #headCalc method decide head direction with the help of headHash key value
    def headCalc(sign)
       if sign == "L"
           @key = @key.to_i - 1
           if @key == 0
            @key = 4     
            return @key
           end          
        return @key
       elsif sign == "R"
         @key = @key.to_i + 1
         if @key == 5
            @key = 1
            return @key
           end
        return @key
       end
    end

    def printLoc 
        p "Head : #{@head}"
        p "xloc : #{@xloc}"
        p "yloc : #{@yloc}"
    end
end


robot1 = Robot.new(1,2,"N",5,5)
robot1.move("LMLMLMLMM")
robot2 = Robot.new(3,3,"E",5,5)
robot2.move("MMRMMRMRRM")

robot1.printLoc
robot2.printLoc





