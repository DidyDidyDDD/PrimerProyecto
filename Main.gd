extends Node


var screen_size

var x = 126
var y = 0
var i = 1
var ii = 1
var Enemy = load("res://Enemy.tscn")

func _ready():
	screen_size = 1021
	add_to_group('Universal')
	NewEnemy()

func NewEnemy():
	x = 80
	while ii <= 6:
		while i <= 7:
			var MultiEnemigos = Enemy.instance()
			MultiEnemigos.position = Vector2(x, y)
			x += 126
			add_child(MultiEnemigos)
			i = i + 1
			
		get_tree().call_group('GrupoEnemigos', 'CambioDeNave')
		i = 1
		ii = ii + 1
		y = y - 84
		x = 80

func _on_Player_area_entered(_area):
	print("Game Over")
	$Player.hide()
	$Enemy.hide()
	#pass # Replace with function body.


func _on_Timer_timeout():
	get_tree().call_group('GrupoEnemigos', 'mover')
	#pass # Replace with function body.
