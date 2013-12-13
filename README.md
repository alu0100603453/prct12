# Matriz

##Autores
+ Francisco Alderete González
+ Néstor Álvarez Díaz

##Finalidad
Esta gema está pensada para trabajar con matrices de una forma más cómoda, tal y como lo haríamos a lápiz y papel.

#Estructura y Ficheros

## Organización del trabajo

+ Se creará una clase Matriz tal y como se tenía en la práctica anterior
+ Se creará una clase hija de Matriz, clase Martiz_Dispersa

```ruby
	class Matriz_Dispersa < Matriz
``` 
+ En Matriz_Dispersa se redefinirán los métodos para trabajar con Matrices.

```ruby
	#Para operar
	def +(other)
	def -(other)
	def *(other)
	
	#Para mostrar
	def to_s
```
+ Crearlo en forma de Gema

## Creación de la estructura de la Gema

Comando para generar la jerarquía y ficheros de la gema:

`$ bundle gem Matriz`

###Estructura del repositorio inicial

```bash
$ tree

.
├── Gemfile
├── lib
│   ├── Matriz
│   │   └── version.rb
│   └── Matriz.rb
├── LICENSE.txt
├── Matriz.gemspec
├── Rakefile
└── README.md
```

###Primera ampliación

+ Guardfile
+ .travis.yml
+ Dependencias:

```gemspec
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
```
+ racional.rb
+ matriz.rb
+ dispersa.rb

###Estructura tras la primera ampliación

```bash
$ tree
.
├── Gemfile
├── Guardfile
├── lib
│   ├── Matriz
│   │   ├── dispersa.rb
│   │   ├── matriz.rb
│   │   ├── racional.rb
│   │   └── version.rb
│   └── Matriz.rb
├── LICENSE.txt
├── Matriz.gemspec
├── Rakefile
└── README.md
```
##Estructuras de Clases

###Estructura de la clase Fracción

####Variables y métodos básicos para que funcionen las especificaciones requeridas

```ruby
	def initialize(numerador,denominador)

	#recibe la fraccion de dos partes
	#numerador y denominador

	#Métodos necesarios para el funcionamiento: Suma, Resta y Producto
	def +(other)
	def -(other)
	def *(other)

	#reciben una fraccion y retorna una nueva fraccion con el resultado
```

###Estructura de la clase Matriz

####Variables y métodos

```ruby
	def initialize(array)

	#recibe un solamente un array

	def +(other)
	def -(other)
	def *(other)
	
	#reciben una matriz y retorna una nueva matriz con el resultado

	def coerce(something)

	#recibe un objeto y devuelve un array:
	#[something,self]
	
	def to_s
	
	#no recibe nada y devuelve un string con la matriz en forma normal
```

###Estructura de la clase Matriz_Dispersa

####Variables y métodos

```ruby
	def initialize(array)

	#recibe un solamente un array

	def +(other)
	def -(other)
	def *(other)
	
	#reciben una matriz y retorna una nueva matriz con el resultado
	
	def to_s
	
	#no recibe nada y devuelve un string con la matriz de la siguiente forma:
	#valor | (x,y)
```

#####Aclaración

Los métodos implementados solo funcionan para una ___Matriz x MatrizDispersa o viceversa___.

Ejemplo:

```ruby
    A = Matriz.new([[2,2,3],[0,7,7],[7,0,9]])
    B = Matriz_Dispersa.new([[0,3,0],[0,1,0],[7,0,0]])

    puts A-B
    puts B-A
```
 Para realizar las operaciones entre Matrices 'normales' se utilizan los métodos de la clase Matriz
 
## Instalación

Añade al Gemfile esta línea:

    gem 'Matriz'

y luego ejecuta:

    $ bundle

O puedes instalarla así:

    $ gem install Matriz

## Contribuye

1. Crea una rama (`git checkout -b my-new-feature`)
2. Haz 'Commit' con tus cambios  (`git commit -am 'Add some feature'`)
3. Haz 'Push' de la rama (`git push origin my-new-feature`)
4. Crea un nuevo 'Pull Request'
