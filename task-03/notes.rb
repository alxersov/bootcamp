FILE_NAME = 'notes.txt'

def help_command
    puts %{
        Available commands:

        -a or --add     adds an item into the list
        -l or --list    displays the list
        -r or --remove  removes the n-th note from the list
        -c or --clear   clears the list
        -h or --help    shows list of available commands
    }
end

def add_command(params)
    open(FILE_NAME, 'a') do |file|
        params.each do |note|
            file.write(note)
            file.write("\n")
        end
    end
end

def list_command
    open(FILE_NAME) do |file|
        n = 0
        file.each do |line|
            puts "<#{n}>: #{line}"
            n += 1
        end
    end
end

def remove_command(params)
    index = params.first.to_i

    open(FILE_NAME, 'r+') do |file|
        notes = file.inject([]) { |notes, note| notes.push(note) }
        notes.delete_at(index)
        file.truncate(0)
        notes.each { |note| file.write(note) }
    end
end

def clear_command
    open(FILE_NAME, 'w') { |file| file.truncate(0) }
end

command, *params = ARGV

case command
when '-a', '--add'
    add_command(params)
when '-l', '--list'
    list_command
when '-r', '--remove'
    remove_command(params)
when '-c', '--clear'
    clear_command
else
    help_command
end
