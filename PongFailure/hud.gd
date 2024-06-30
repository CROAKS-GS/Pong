extends CanvasLayer

signal start_game


# Called when the node enters the scene tree for the first time.
func _ready():
	$P1Score.hide()
	$P2Score.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_pressed():
	$Start.hide()
	$Title.hide()
	$P1Score.show()
	$P2Score.show()
	start_game.emit()
