extends CanvasLayer

var isPaused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_pressed():
	get_tree().quit()


func _on_main_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menus/main.tscn")


func _on_pause_button_pressed():
	get_tree().paused = true
	show()


func _on_play_pressed():
	get_tree().paused = false
	hide()
