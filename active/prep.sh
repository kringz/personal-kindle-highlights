# make windows file unix file
sudo sh -c "tr -d '\15\32' < 0.txt > 1.txt"
#sudo sh -c "sed -e 's/^M$//' 0.txt > 1.txt"

# remove apostrophy
#sudo sh -c "sed 's/\’/\ /g' 1.txt > 1a.txt"

# remove all leading spaces
sudo sh -c "sed 's/^[ \t]*//;s/[ \t]*$//' 1.txt > 1.2.txt"
# remove all lowercase chars unless the char is in the word 'Location'
sudo sh -c "sed -e 's/\([^Location].*\)/\L\1/' 1.2.txt > 1.3.txt"
# remove location number
sudo sh -c "sed -r 's/^Location....../Location-Start/g' 1.3.txt > 1.4.txt"
# remove first instance
sudo sh -c "sed '0,/Location-Start/s// /' 1.4.txt > 1.5.txt"
# add Location-End
sudo sh -c "sed '/\Location/i Location-End' 1.5.txt > 1.6.txt"
# insert Location-Start at beginning of file
sudo sh -c "sed '1s/^/Location-Start /' 1.6.txt > 1.7.txt"
# insert Location-End at end of file
# sudo sh -c "sed 's/$/Location-End/' 1.5.txt > 1.done.txt"
sudo sh -c "echo Location-End >> 1.7.txt"
# remove end line periods
sudo sh -c "sed 's/\.$//g' 1.7.txt > 1.8.txt"
# copy to seperate phrases and single words
sudo cp ./1.8.txt ./1.8b.txt
#
sudo sh -c "sed '/[[:space:]]/!d' 1.8b.txt > 1.9b.txt"
# remove Location Start, save
sudo sh -c "sed '0,/Location-Start/s///' 1.9b.txt > 1.10b.txt"
# sudo sh -c "sed '0,/Location-End/s///' 1.10b.txt > 1.11b.txt"

#sudo sh -c "sed ':begin;$!N;/^state-text: {[[:space:]]\n/s/\n//;tbegin;P;D' 1.10b.txt > phrases.1.txt"
#sudo sh -c "sed ':begin;$!N;s/\n//;tbegin' 1.10b.txt > phrases.1.txt"

# replace Location-Start and Location-End with t x1
#sudo sh -c "sed -r 's/^Location-Start/t x1/g' 1.9b.txt > 1.10b.txt"
#sudo sh -c "sed -r 's/^Location-End/t x2/g' 1.10b.txt > 1.11b.txt"

# remove empty lines
#sudo sh -c "sed '/^$/d' 1.10b.txt > 1.12b.txt"
# remove muli word lines
#sudo sh -c "sed '/[[:space:]]/!d' 1.12b.txt > phrases.1.txt"

# remove multi word lines
sudo sh -c "sed '/[[:space:]]/d' 1.8.txt > single-words.1.txt"
# remove Location-Start and Location-End, leaving behind single words
sudo sh -c "sed '/\Location-Start/d' single-words.1.txt > single-words.2.txt"
sudo sh -c "sed '/\Location-End/d' single-words.2.txt > single-words.3.txt"
# remove empty lines
sudo sh -c "sed '/^$/d' single-words.3.txt > single-words.4.txt"


