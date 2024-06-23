extends Node

var player1score
var player2score

signal bounce


# Called when the node enters the scene tree for the first time.
func _ready():
	$Background.visible = false

func new_game():
	$Background.visible = true
	$ColorRect.visible = false
	$player1.start($Player1Position.position)
	$player2.start($Player2Position.position)
	$Ball.start(0)
	player1score = 0
	player2score = 0

func game_over():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_playerhit():
	bounce.emit()
