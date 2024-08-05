extends Node2D


@onready var sprites = []
@export var fire_folder: String
@export var frame_num: int
@onready var animation = $animation
@onready var sprite = $sprite

func _ready():
	randomize()
	sprites = read_folder(fire_folder)
	sprite.hframes = frame_num
	var file = randi() % sprites.size()
	sprite.texture = sprites[file]
	animation.play("fire")
	var scale = randf_range(0.8,1)
	self.scale = Vector2(scale,scale)
func read_folder(path):
	var files = []
	var dir = DirAccess.open(path)
	#dir.open(path)
	dir.list_dir_begin() # TODOConverter3To4 fill missing arguments https://github.com/godotengine/godot/pull/40547
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			if file.ends_with(".png"):
				var image = load(path + file)
				files.append(image)
	dir.list_dir_end()
	return files

func _on_animation_animation_finished(anim_name):
	self.queue_free()
