extends RigidBody2D

var impulse;
var layer;

func _ready():
	impulse = 0.0;
	layer = get_node("../..");

func _physics_process(delta):
	rotation_degrees = 0;
	var gripForce: Vector2;
	if(position.x >= 0 && position.x < 1920 && position.y >= 0 && position.y < 1080):
		layer.image.lock();
		var color = layer.image.get_pixel(position.x, 1079-position.y);
		layer.image.unlock();
		if(color.a != 0):
			color += Color(0, .5/255, .5/255, 0);				#correction for int color on ColorRect
			gripForce = 4*Vector2(.5-color.g, color.b-.5);
			apply_central_impulse(5*gripForce/layer.fluidity/layer.fluidity);
		if(gripForce.length_squared() > 4):
			var mousePos = get_local_mouse_position().clamped(300);
			apply_central_impulse(mousePos/15);
