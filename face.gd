extends MeshInstance3D

var mat := get_active_material(0)

var mainSceneLight

var light_direction

func _ready() -> void:
	mainSceneLight = get_node("/root/Demo_scene/DirectionalLight3D")

func _process(delta):
	if mat is ShaderMaterial:
		var material_basis = global_transform.basis
		mat.set_shader_parameter("head_forward", -material_basis.z.normalized())
		mat.set_shader_parameter("head_right", material_basis.x.normalized())
		mat.set_shader_parameter("light_direction",
		 -mainSceneLight.global_transform.basis.z.normalized())
