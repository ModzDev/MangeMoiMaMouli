require 'colorize'

# Welcome Message
puts "\n\n"

######################
# puts String.colors
######################

def main
    searchFiles()
    verifyFileName()
end

def searchFiles
    puts "---------[".colorize(:light_black) + " 🛠️  Scanning Files 🛠️  ".colorize(:yellow) + "]---------".colorize(:light_black)
    # Get files in subdir
    sourcesFiles = Dir.glob("**/*.c")
    headerFiles = Dir.glob("**/*.h")
    makefile = Dir.glob("**/Makefile")
    forbiddenFiles = Dir.glob("**/*.{o,sh}")

    # Verify if files exists
    if sourcesFiles.any? || headerFiles.any? || makefile.any?
        # List found files
        puts "\n"
        for file in sourcesFiles
            puts "Source file found: ".colorize(:light_green) + file
        end
        for file in headerFiles
            puts "Header file found: ".colorize(:light_green) + file
        end
        for file in makefile
            puts "Makefile found: ".colorize(:light_green) + file
        end
        for file in forbiddenFiles
            puts "Probably forbidden file found: ".colorize(:light_red) + file
        end
    else
        puts "\n"
        puts "              No files found".colorize(:red)
    end
end

def verifyFileName()
    puts "\n"
    puts "---------[".colorize(:light_black) + " 🛠️  Verify Files Names 🛠️  ".colorize(:yellow) + "]---------".colorize(:light_black)
    puts "\n"

    # Get files in subdir
    sourcesFiles = Dir.glob("**/*.c")
    headerFiles = Dir.glob("**/*.h")

    for file in sourcesFiles do
        filename = File.basename(file)
        if !filename.match("^([a-z]*_*)*\.c$")
            puts "[O4] File Name Error: ".colorize(:red) + file.colorize(:blue) + " must follow the snake_case convention.".colorize(:white)
        end
    end
    for file in headerFiles do
        filename = File.basename(file)
        if !filename.match("^([a-z]*_*)*\.h$")
            puts "[O4] File Name Error: ".colorize(:red) + file.colorize(:blue) + " must follow the snake_case convention.".colorize(:white)
        end
    end
end


# Start program
main()