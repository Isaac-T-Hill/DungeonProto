extends CharacterBody2D


func _ready():
	pass


func _on_player_detection_body_entered(body):
	if body.name == "Player":
		var battleMenu = get_node("../Battle")
		battleMenu.position = body.position
		battleMenu.show()
		battleMenu.get_node("Camera2D").enabled = true
		body.get_node("Camera2D").enabled = false
		
