shader_type canvas_item;

uniform float amount : hint_range(0.0, 2.0, 0.01) = 1.0;

void fragment() {
	vec4 c = COLOR;
	float a = (amount - 1.0);
	COLOR.rgb = vec3(mix(c.r, 1.0, a), mix(c.g, 1.0, a), mix(c.b, 1.0, a));
}
