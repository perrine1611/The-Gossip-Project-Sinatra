require 'csv'

class Gossip
	attr_accessor :author, :content

	def initialize (author, content)
	@author = author
	@content = content
	end

	# Enregistre les gossip dans le fichier CSV avec l'auteur et le contenu

	def save
  		CSV.open("./db/gossip.csv", "ab") do |csv|
    	csv << [@author, @content]
  		end
	end

	# Met tous les gossip dans un array

	def self.all
		all_gossips = []
		CSV.read("./db/gossip.csv").each do |csv_line|
		all_gossips << Gossip.new(csv_line[0], csv_line[1])
		end
		return all_gossips
	end

	# Trouver l'id du gossip

	def self.find (id)
    	all_gossips = self.all
    	return all_gossips[id.to_i]
	end
	
	end
end

