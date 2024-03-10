extends Node

@export var level_container: Node
@export var ip_line_edit: LineEdit
@export var host_button: Button
@export var start_button: Button
@export var join_button: Button
@export var status_label: Label
@export var level_scene: PackedScene
@export var ui: CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	multiplayer.connection_failed.connect(_on_connection_failed)
	multiplayer.connected_to_server.connect(_on_connected_to_server)


	
func _on_connection_failed():
	status_label.text = "Failed to connect"
	#not_connected_hbox.show()

func _on_connected_to_server():
	status_label.text = "Connected!"


func _on_host_pressed():
	host_button.hide()
	join_button.hide()
	ip_line_edit.hide()
	start_button.show()
	Lobby.create_game()
	status_label.text = "Hosting!"
	
func _on_join_pressed():
	host_button.hide()
	join_button.hide()
	ip_line_edit.hide()
	Lobby.join_game(ip_line_edit.text)
	status_label.text = "Connecting..."

	
func _on_start_pressed():
	hide_menu.rpc()
	change_level.call_deferred(level_scene)
	
func change_level(scene):
	for c in level_container.get_children():
		level_container.remove_child(c)
		c.queue_free()
	level_container.add_child(scene.instantiate())



func _on_quit_pressed():
	get_tree().quit()

@rpc("call_local", "authority", "reliable")
func hide_menu():
	ui.hide()





