require 'matriz_lpp/matriz.rb'
require 'matriz_lpp/racional.rb'
class Matriz_Dispersa < Matriz

    attr_reader :matriz

    def initialize(array=nil)
        if array != nil
            raise ArgumentError, 'No puede pasar un conjunto vacío' unless array.length > 0
            @matriz = Array.new
            array.length.times do |i|
                array[i].length.times do |j|
                    if(array[i][j] != (array[i][j]-array[i][j]))
                        self.matriz << [array[i][j],i,j]
                    end
                end
            end
        end
    end

    def +(other)
        result = Array.new
        other.matriz.length.times do |i|
            aux = Array.new
            other.matriz[i].length.times do |j|
                k = 0
                check = false
                while(k < self.matriz.length)
                    if(self.matriz[k][1] == i && self.matriz[k][2] == j)
                        aux << other.matriz[i][j] + self.matriz[k][0]
                        check = true
                    end
                    k += 1          
                end
                if(!check)
                    aux << other.matriz[i][j]
                end
            end
            result << aux
        end
        Matriz.new(result)
    end

    def -(other)
        result = Array.new
        other.matriz.length.times do |i|
            aux = Array.new
            other.matriz[i].length.times do |j|
                k = 0
                check = false
                while(k < self.matriz.length)
                    if(self.matriz[k][1] == i && self.matriz[k][2] == j)
                        aux << (other.matriz[i][j] - self.matriz[k][0]) * (-1)
                        check = true
                    end
                    k += 1          
                end
                if(!check)
                    aux << other.matriz[i][j] * (-1)
                end
            end
            result << aux
        end
        Matriz.new(result)
    end

    def *(other)
        result = Array.new(other.matriz.length){|i| Array.new(other.matriz[i].length){0}}
        self.matriz.length.times do |i|
            other.matriz[i].length.times do |j|
                result[j][self.matriz[i][1]] += other.matriz[self.matriz[i][2]][j]*self.matriz[i][0]
            end
        end
        Matriz.new(result)
    end

    def max
        pivote = 0
        (1..self.matriz.length-1).each do |i|
            if(self.matriz[i][0] > self.matriz[pivote][0])
                pivote = i
            end
        end
        "\t#{self.matriz[pivote][0]} | (#{self.matriz[pivote][1]},#{self.matriz[pivote][2]})"
    end

    def min
        pivote = 0
        (1..self.matriz.length-1).each do |i|
            if(self.matriz[i][0] < self.matriz[pivote][0])
                pivote = i
            end
        end
        "\t#{self.matriz[pivote][0]} | (#{self.matriz[pivote][1]},#{self.matriz[pivote][2]})"
    end

    def eq(other)
        cont = 0
        max = self.matriz.length
        if(self.matriz.length == other.matriz.length)
            self.matriz.length.times do |i|
                if(self.matriz[i] == other.matriz[i])
                    cont += 1
                end
            end
        end
        if(max == cont)
            return true
        end
        return false
    end

    def to_s
        pr = ""
        self.matriz.length.times do |i|
            pr << "\t#{self.matriz[i][0]} | (#{self.matriz[i][1]},#{self.matriz[i][2]})\n"
        end
        pr << "\n"
        pr
    end

end

if __FILE__ == $0
=begin
    A = Matriz.new([[2,2,3],[0,7,7],[7,0,9]])
    B = Matriz_Dispersa.new([[0,3,0],[0,1,0],[7,0,0]])
    C = Matriz.new([[0,3,0],[0,1,0],[7,0,0]])
    puts B-A
    puts C-A
    i = Matriz.new([[1,1,1],[1,1,1],[1,1,1]])
    f1 = Fraccion.new(1,2)
    f2 = Fraccion.new(1,3)
    f3 = Fraccion.new(1,4)
    f4 = Fraccion.new(1,5)
    f5 = Fraccion.new(2,3)
    f6 = Fraccion.new(3,4)
    f7 = Fraccion.new(4,5)
    c1 = Fraccion.new(0,3)
    d3 = Matriz_Dispersa.new([[f1,c1,c1],[c1,f2,c1],[c1,c1,f3]])
    r=i*d3
    puts r
=end
    I = Matriz.new([[1,1],[1,1]])
    f = Fraccion.new(1,2)
    fn = Fraccion.new(0,1)
    M = Matriz_Dispersa.new([[f,fn],[fn,fn]])

    puts I
    puts M
    puts "Suma"
    puts I+M
    puts "Resta"
    puts I-M
    puts "Producto"
    puts M*I
    puts "Maximo y Minimo"
    puts "#{I.max}, #{I.min}"
    puts "Maximo y Minimo"
    puts "#{M.max}, #{M.min}"
end




