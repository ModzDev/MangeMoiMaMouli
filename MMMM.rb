require 'colorize'

# List files
sources_files = Dir.glob("**/*.c")
header_files = Dir.glob("**/*.c")

for file in sources_files
    puts("Source file: " + file)
end