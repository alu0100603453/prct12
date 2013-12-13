#Definicion de la clase matriz:
require 'matriz_lpp/racional.rb'

class Matriz

    attr_reader :matriz
    
    def initialize(array=nil)
        if array != nil
            raise ArgumentError, 'No puede pasar un conjunto vacío' unless array.length > 0
            @matriz = array
        end
    end

    def +(other)
        if(other.instance_of?Matriz)
            result = Array.new
            self.matriz.length.times do |i|
                aux = Array.new
                self.matriz[i].length.times do |j|
                    aux << self.matriz[i][j] + other.matriz[i][j]
                end
                result << aux
            end
            Matriz.new(result)
        else
            other+self
        end
    end

    def -(other)
        if(other.instance_of?Matriz)
            result = Array.new
            self.matriz.length.times do |i|
                aux = Array.new
                self.matriz[i].length.times do |j|
                    aux << self.matriz[i][j] - other.matriz[i][j]
                end
                result << aux
            end
            Matriz.new(result)
        else
            other-self
        end
    end

    def *(other)
        if(other.instance_of?Matriz)
            if(self.matriz.length != other.matriz[0].length)
                raise ArgumentError, 'Numero de filas de A tiene que ser igual al numero de columnas de B'
            elsif       
                result = Array.new
                self.matriz.length.times do |i|
                    aux = Array.new
                    other.matriz.length.times do |j|
                        partial = self.matriz[i][j] - self.matriz[i][j]
                        self.matriz[i].length.times do |k|
                            partial += self.matriz[i][k] * other.matriz[k][j]
                        end
                        aux << partial
                    end
                    result << aux
                end
                Matriz.new(result)
            end
        else
            other*self
        end
    end
    
    def max
        piv_i, piv_j = 0, 0
        (1..self.matriz.length-1).each do |i|
            self.matriz.length.times do |j|
                if(self.matriz[i][j] > self.matriz[piv_i][piv_j])
                    piv_i = i
                    piv_j = j
                end
            end
        end
        "\t#{self.matriz[piv_i][piv_j]} | (#{piv_i},#{piv_j})"
    end

    def min
        piv_i, piv_j = 0, 0
        (1..self.matriz.length-1).each do |i|
            self.matriz.length.times do |j|
                if(self.matriz[i][j] < self.matriz[piv_i][piv_j])
                    piv_i = i
                    piv_j = j
                end
            end
        end
        "\t#{self.matriz[piv_i][piv_j]} | (#{piv_i},#{piv_j})"
    end
    
    def to_s
        pr = ""
        self.matriz.length.times do |i|
            pr << "\t"
            self.matriz[i].length.times do |j|
                    pr << "#{self.matriz[i][j]} "
            end
            pr << "\n"
        end
        pr << "\n"
        pr
    end

    def eq(other)
        cont = 0
        max = self.matriz.length * self.matriz[0].length
        if(self.matriz.length == other.matriz.length)
            self.matriz.length.times do |i|
                if(self.matriz[i].length == other.matriz[i].length)
                    self.matriz[i].length.times do |j|
                        if(self.matriz[i][j] == other.matriz[i][j])
                            cont += 1
                        end
                    end
                end
            end
        end
        if(max == cont)
            return true
        end
        return false
    end

    def coerce(something)
        [something, self]
    end
end

if __FILE__ == $0
    F0 = Fraccion.new(1,2)
    F1 = Fraccion.new(3,7)
    F2 = Fraccion.new(1,2)
    F3 = Fraccion.new(3,7)
    A = Matriz.new([[F0,F2],[F2,F3]])
    B = Matriz.new([[F0,F1],[F2,F3]])
    puts A
    puts B
    puts "SUMA"
    puts A+B
    puts "RESTA"
    puts A-B
    puts "PRODUCTO"
    puts A*B
    puts A.eq(B)
end
