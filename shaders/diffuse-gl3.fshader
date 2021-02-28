#version 150

uniform vec3 uLight, uLight2, uColor; //notes: underlying color of the surface

in vec3 vNormal;      //notes: intended normal at the point
in vec3 vPosition;    //notes: eye coordinate of the object

out vec4 fragColor;

void main() {
    vec3 tolight = normalize(uLight - vPosition);
    vec3 tolight2 = normalize(uLight2 - vPosition);
    vec3 normal = normalize(vNormal);

    float diffuse = max(0.0, dot(normal, tolight));
    diffuse += max(0.0, dot(normal, tolight2));
    vec3 intensity = uColor * diffuse;

    fragColor = vec4(intensity, 1.0);
}
