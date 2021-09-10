shader_type canvas_item;

void fragment(){
	float intensity = texture(TEXTURE, UV).r;
	if(intensity>.1){
		COLOR = vec4(.25,.34,1.,1.05-.05/intensity);
	}else if(intensity>.085){
		COLOR = vec4(vec3(0.),50.*intensity-4.);
	}else{
		COLOR.a = 0.;
	}
}