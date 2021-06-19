extends Area2D


var screen_size
var mob_types
# ---- n y nn son varible que incrementan ----
var n = 2
var nn = 1
#---------------------------------------------
var speed = 20
var i = 1

func _ready():
	add_to_group('GrupoEnemigos')
	screen_size = get_viewport_rect().size

#func _process(delta):
#
#	pass
	
#------Movimiento unitario de las naves------
func mover():

		match(i):
			1:	
				if((position.x + 88) < screen_size.x):
					position.x += 1
				else:
#					if(position.y + 88 < screen_size.y):
						get_tree().call_group('GrupoEnemigos', 'CambiarMovimiento_x_Negativo')
#					else:
#						print("Game over")
#						get_node("../Timer").stop()
			2:	
				if((position.x) > 0):
					position.x -= 1
				else:
					get_tree().call_group('GrupoEnemigos', 'CambiarMovimiento_y')

			3: 		
				if(position.y + 152 < screen_size.y):
					position.y += 84
					get_tree().call_group('GrupoEnemigos', 'CambiarMovimiento_x_Positivo')
#					if(position.y + 252 < screen_size.y):
#						get_tree().call_group('GrupoEnemigos', 'CambiarMovimiento_x_Positivo')
#					else:
#						print("Game over")
#						get_node("../Timer").stop()

func CambiarMovimiento_x_Negativo():
	i=2
		
func CambiarMovimiento_y():
	i=3

func CambiarMovimiento_x_Positivo():
	i=1

var e = 0
func CambioDeNave():
		mob_types = $AnimatedSprite.frames.get_animation_names()

#		$AnimatedSprite.animation = mob_types[2]
		# n es la posicioń del arreglo de naves 
		#Arreglo va de 0 a 2
		match(nn):
			1:
				$AnimatedSprite.animation = mob_types[n]
				n = n - 1
				nn = 2
			2:
				$AnimatedSprite.animation = mob_types[n]
				n = n - 1
				nn = 3
			3:
				$AnimatedSprite.animation = mob_types[n]
				n = 2
				nn = 1
