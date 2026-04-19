extends Node3D

# 正确的类型声明 - AnimationNodeStateMachinePlayback
@onready var move_state_machine: AnimationNodeStateMachinePlayback = $AnimationTree.get("parameters/StateMachine/playback")

func set_move_state(state_name: String) -> void:
	# 确保move_state_machine已经初始化
	if move_state_machine:
		move_state_machine.travel(state_name)

func attack():
	#$AnimationTree.set("parameters/OneShot/request",AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	#  两种方式都可以
	$AnimationTree.set("parameters/OneShot/request",true)  
	
func defend(forward: bool) -> void:
	var tween = create_tween()
	tween.tween_method(_defend_change, 1.0 - float(forward), float(forward), 0.25)

func _defend_change(value: float) -> void:
	$AnimationTree.set("parameters/ShieldBlend/blend_amount", value)
	
	
