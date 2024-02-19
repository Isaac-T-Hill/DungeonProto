extends Node2D


var weapons = []

func _ready():
	var scene = load("res://Items/Weapons/sword.tscn")
	var instance = scene.instantiate()
	weapons.append(instance)
