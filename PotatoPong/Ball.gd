extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var prev_collision_counter = 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	handle_collision()
	
func handle_collision():
	#for i in get_slide_collision_count():
		#var collision = get_slide_collision(i)
		#print("Collided with: ", collision.get_collider().name)
	if prev_collision_counter == get_slide_collision_count():
		prev_collision_counter += 1
		gravity = gravity * -1
