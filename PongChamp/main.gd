extends Node

var player1score
var player2score


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func new_game():
	$player1.start($Player1Position.position)
	$player2.start($Player2Position.position)
	player1score = 0
	player2score = 0

func game_over():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
