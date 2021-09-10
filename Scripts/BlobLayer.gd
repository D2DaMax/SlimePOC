extends CanvasLayer

var time;
var image;
var fluidity;

func _ready():
	time = 0.3;
	fluidity = 1.0;
	custom_viewport = get_node("../BlobEffectsView");
	image = custom_viewport.get_texture().get_data();

func _process(delta):
	time += delta;
	fluidity = 1.0;
	if(Input.is_action_pressed("LeftClick")): fluidity *= 2;
	if(Input.is_action_pressed("RightClick")): fluidity /= 2;
	if(time > .25):
		image = custom_viewport.get_texture().get_data();		#Godot is slow doing this, so it can't be done every call
		time = 0.0;
