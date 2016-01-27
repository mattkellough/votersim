# Voter Class
class Voters
  attr_accessor :namev, :politics
  def initialize (namev, politics)
    @namev = namev
    @politics = politics
  end
end


# Politician Class
class Politicians
  attr_accessor :namep, :party
  def initialize (namep, party)
    @namep = namep
    @party = party
  end
end

class World

  # Defining voter class
  def voterclass
    print "Name: " #voter name
    namev = gets.chomp.capitalize
    puts "Select political affiliation:
(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
    political_class = gets.chomp.downcase
    case political_class # expanding the political class name for the push array
    when "l"
      political_class = "Liberal"
    when "c"
      political_class = "Conservative"
    when "t"
      political_class = "Tea Party"
    when "s"
      political_class = "Socialist"
    when "n"
      political_class = "Neutral"
    end
    new_voter = Voters.new(namev, political_class)
    @voters.push(new_voter)
    main
  end

  #Create politician method
  def politicianclass
    print "Name: " #politician name
    namep = gets.chomp.capitalize
    puts "Select party:
(D)emocrat or (R)epublican"
    politician_party =  gets.chomp.downcase
    case politician_party
    when "d"
      politician_party = "Democrat"
    when "r"
      politician_party = "Republican"
    end
    new_politician = Politicians.new(namep, politician_party)
    @politicians.push(new_politician)
    main
  end


  #Create politician or voter
  def create
    puts "(V)oter or (P)olitician"
    options = gets.chomp.downcase  # voter or politician
    case(options)
    when "v"
      voterclass
    when "p"
      politicianclass
    end
  end


  #delete method
  def delete
    list
    puts "Would you like to delete (V)oter or (P)olitician"
    user_delete_choice = gets.chomp.capitalize

    case (user_delete_choice)
    when "V"
      puts "Which voter would you like to delete?"
      voter_delete = gets.chomp.capitalize!

      @voters.each do |instance|
        if instance.namev == voter_delete
          puts "Are you sure you wish to delete #{voter_delete}? (Y/N)"
          user_answer = gets.chomp.capitalize

          if user_answer == "Y"
            @voters.delete(instance)
            puts "You have removed #{voter_delete}"
          else user_answer == "N"
            puts "Returning you to the main menu"
            main
          end
        end
        puts "Did not recognize input, returning to main menu."
        main
      end

    when "P"
      list

      puts "Which politician would you like to delete?"
      politician_delete = gets.chomp.capitalize

      @politicians.each do |instance|
        if instance.namep == politician_delete
          puts "Are you sure wish to delete #{politician_delete}? (Y/N)"
          user_answer = gets.chomp.capitalize

          if user_answer == "Y"
            @politicians.delete(instance)
            puts "You have removed #{politician_delete}"
          else user_answer == "N"
            puts "Returning to the main menu"
            main
          end
        end
        main
      end
    end
  end

  def update
   puts "Would you like to update (V)oter or (P)olitician"
   user_update_choice = gets.chomp.capitalize

   # checks to see if user chose voter
   case(user_update_choice)
   when "V"
     list

     match = false
     puts "Which voter would you like to update?"
     user_update = gets.chomp.capitalize

     # loops over voters. if match is found then asks for affiliation update
     @voters.each do |instance|
       if instance.namev == user_update
         puts "Update #{user_update} to: "
         puts "Liberal, Conservative, Tea Party, Socialist, Neutral"
         affiliation_update = gets.chomp.capitalize
         # updates the voters affiliation choice
         instance.politics = affiliation_update
         puts "Updated #{user_update} to #{affiliation_update}"
         match = true
       end
     end
     if match != true
       puts "Person not found.  Returning to main menu."
     end
     main

   when "P"
     list


     match = false
     puts "Which politician would you like to update?"
     politician_update = gets.chomp.capitalize

     # loops over politicians. if match is found then asks for party update
     @politicians.each do |instance|
       if instance.namep == politician_update
         puts "Update #{politician_update} to: "
         puts "Republican or Democrat"
         party_update = gets.chomp.capitalize
         # updates the politicians party choice
         instance.party = party_update
         puts "Updated #{politician_update} to #{party_update}"
         match = true
       end
     end
     if match != true
       puts "Person not found.  Returning to main menu."
     end
     main
   end
 end

  def initialize
    @voters = []
    @politicians = []
  end


  #List method
  def list
    @voters.each do |v|
      puts "Voters: #{v.namev}, #{v.politics}"
    end
    @politicians.each do |s|
      puts "Politicians: #{s.namep}, #{s.party}"
    end
  end


  # Main Menu
  def main
    system("clear")
    puts "
#     #                                #####
#     #  ####  ##### ###### #####     #     # # #    #
#     # #    #   #   #      #    #    #       # ##  ##
#     # #    #   #   #####  #    #     #####  # # ## #
#   #  #    #   #   #      #####           # # #    #
# #   #    #   #   #      #   #     #     # # #    #
#     ####    #   ###### #    #     #####  # #    #"
    puts ""
    puts "What would you like to do?"
    puts "(C)reate, (L)ist, (U)pdate, or (D)elete"
    mainmenu = gets.chomp.downcase
    case mainmenu
    when "c" # create option
      create
    when "l"
      list
    when "u"
      update
    when "d"
      delete
    end
  end
end

world = World.new
world.main
