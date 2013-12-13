require 'matriz_lpp/dispersa.rb'
require 'matriz_lpp/racional.rb'
require 'matriz_lpp/matriz.rb'
require 'matriz_lpp/matriz_dsl.rb'

describe Matriz_Dispersa do
        before :all do
        	@f_medio = Fraccion.new(1,2)
		@m_a = Matriz.new([[@f_medio,0],[0,@f_medio]])
		@m_b = Matriz.new([[1,2],[3,4]])
		@m_disp = Matriz_Dispersa.new([[0,0],[0,@f_medio]])
        end

	describe "#OPERACIONES CON MATRICES Y FRACCIONES" do
		it "SUMA" do
			r = @m_a + @m_b
			r_p = Matriz.new([[Fraccion.new(3,2),2],[3,Fraccion.new(9,2)]])
			r.eq(r_p).should eq(true)
		end
	end

	describe "#OPERACIONES CON MATRICES DISPERSAS, MATRICES Y FRACCIONES" do
		it "PRODUCTO" do
			r = @m_b * @m_disp
			r_p = Matriz.new([[0,@f_medio],[0,@f_medio]])
			r.eq(r_p).should eq(true)
		end
	end
end
      
