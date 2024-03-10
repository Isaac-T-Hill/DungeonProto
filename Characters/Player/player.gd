extends CharacterBody2D

@export var player_camera: PackedScene

const SPEED = 300.0
var owner_id = 1
var camera_instance

func _enter_tree():
	print("Entering Tree")
	owner_id = name.to_int()
	set_multiplayer_authority(owner_id)
	if owner_id != multiplayer.get_unique_id():
		return
		
	set_up_camera()


func _ready():
	var inventory = get_node("Inventory")
	inventory
	

func _process(delta):
	if multiplayer.multiplayer_peer == null:
		return
	if owner_id != multiplayer.get_unique_id():
		return
		
	update_camera_pos()

func _physics_process(delta):
	if owner_id != multiplayer.get_unique_id():
		return

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX = Input.get_axis("ui_left", "ui_right")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionY = Input.get_axis("ui_up", "ui_down")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func set_up_camera():
	camera_instance = player_camera.instantiate()
	#camera_instance.global_position.y = camera_height
	get_tree().current_scene.add_child.call_deferred(camera_instance)	

func update_camera_pos():
	camera_instance.global_position = global_position

