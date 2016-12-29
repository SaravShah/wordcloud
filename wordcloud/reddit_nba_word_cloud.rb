require 'redd'
require 'magic_cloud'

# w = Redd.it(:web, "BCA2QYBYGw_4VQ", "CU9370wifdFiLBL4NT2UWbkwXgw", "http://www.google.com", user_agent: "TestSite v1.0.0")
# url = w.auth_url("random_state", ["identity", "read"], :temporary)
# puts "Please go to #{url} and enter the code below:"
# code = gets.chomp
# w.authorize!(code)

#put your info here
r = Redd.it(:script, "Secret ID", "Secret Key", "Username", "password", user_agent: "TestBot v1.0.0")
r.authorize!



def count_words(string)
  $array = []
  words = string.split(" ")
  frequency = Hash.new(0)
  words.each { |word| frequency[word.downcase] += 1 }
  $array = frequency.to_a
  cloud = MagicCloud::Cloud.new($array, rotate: :free, scale: :log)

  p cloud
end


sentence = ""
hot = r.get_hot("nba")
hot.each do |link| 
	# puts " |||||||| #{link.comments}"
	
	link.comments.each do |item|
		begin
			sentence << item.body
		rescue
			next
		end
	end
	
end
count_words(sentence)
# words = [
#   ["test", 50],
#   ["me", 40],
#   ["tenderly", 30]
 
# ]

# magic_cloud --textfile example.txt -f test.png --rotate free --scale log


