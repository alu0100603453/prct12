require 'matriz_lpp/matriz.rb'
require 'matriz_lpp/racional.rb'
require 'matriz_lpp/dispersa.rb'

class Matriz_dsl < Matriz
	attr_reader :operation, :mode, :types, :operands

	def initialize(mode, &block)
		@mode = mode.upcase
		@types = []
		@operands = []
		if block_given?
			if block.arity == 1
				yield self
			end
		end
	end

	def types(*types)
		types.length.times do |i|
			self.types << types[i].upcase
		end
	end
	
	def operands(*operands)
		operands.length.times do |i|
			if self.types[i] == "DENSA"
				self.operands << Matriz.new(operands[i])
			else
				self.operands << Matriz_Dispersa.new(operands[i])
			end
		end
	end

	def run
		if self.mode == "SUMA"
			puts self.operands[0] + self.operands[1]
		elsif self.mode == "RESTA"
			puts self.operands[0] - self.operands[1]
		elsif self.mode == "PRODUCTO"
			puts self.operands[0] * self.operands[1]
		end
	end

end

if __FILE__ == $0
	a = Matriz_dsl.new("suma") do
		types "densa","densa"
		operands [[1,2],[2,1]] , [[1,1],[2,2]]
		run
	end
end

