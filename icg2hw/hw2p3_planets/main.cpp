// glew must be before glfw
#include <GL/glew.h>
#include <GLFW/glfw3.h>

// contains helper functions such as shader compiler
#include "icg_helper.h"

#include "quad/quad.h"

Quad sun;
Quad moon;
Quad earth;

void Init() {
    // sets background color
    glClearColor(1.0,1.0,1.0 /*white*/, 1.0 /*solid*/);
    // {stuff}.Init(...);
}

void Display() {
    glClear(GL_COLOR_BUFFER_BIT);
    float time_s = glfwGetTime();
    sun.Init("sun.tga");
    earth.Init("earth.tga");
    moon.Init("moon.tga");

    //compute the transformation matrices
    float sun_scale_factor = 0.2f;
    float earth_scale_factor = 0.1f;
    float moon_scale_factor = 0.06f;
    float time_secs = glfwGetTime();
    float earth_orbit_radius = 0.6f;
    float moon_orbit_radius = 0.2f;
    float earth_rotationspeed_theta_per_second = 0.3f;
    float moon_rotationspeed_theta_per_second = 0.6f;
    float sun_rotationspeed_theta_per_second = 0.1f;
    float earth_revolutionspeed_theta_per_second = 0.2f;
    float moon_revolutionspeed_theta_per_second = 0.6f;

    float sun_rotation_theta = time_s * sun_rotationspeed_theta_per_second;
    glm::mat4 sun_T = glm::translate(glm::mat4(1.0f),
                                 glm::vec3(0.0f, 0.0f ,0.0f));
    glm::mat4 sun_R = glm::rotate(glm::mat4(1.0f), sun_rotation_theta,
                              glm::vec3(0.0f, 0.0f, 1.0f));
    glm::mat4 sun_S = glm::mat4(1.0f);
    sun_S[0][0] = sun_scale_factor;
    sun_S[1][1] = sun_scale_factor;
    sun.Draw(sun_T, sun_R, sun_S);

    float earth_revolution_theta = time_s * earth_revolutionspeed_theta_per_second;
    float earth_rotation_theta = time_s * earth_rotationspeed_theta_per_second;
    glm::mat4 earth_T = glm::translate(glm::mat4(1.0f),
                                 glm::vec3(earth_orbit_radius * cos(earth_revolution_theta) , -earth_orbit_radius * sin(earth_revolution_theta) ,0.0f));
    glm::mat4 earth_R = glm::rotate(glm::mat4(1.0f), earth_rotation_theta,
                              glm::vec3(0.0f, 0.0f, 1.0f));
    glm::mat4 earth_S = glm::mat4(1.0f);
    earth_S[0][0] = earth_scale_factor;
    earth_S[1][1] = earth_scale_factor;
    earth.Draw(earth_S, earth_R, earth_T);

    float moon_revolution_theta = time_s * moon_revolutionspeed_theta_per_second;
    float moon_rotation_theta = time_s * moon_rotationspeed_theta_per_second;
    glm::mat4 moon_T = glm::translate(glm::mat4(1.0f),
                                 glm::vec3(earth_orbit_radius * cos(earth_revolution_theta) + moon_orbit_radius * cos(moon_revolution_theta),
                                           -earth_orbit_radius * sin(earth_revolution_theta) + moon_orbit_radius * sin(moon_revolution_theta),0.0f));
    glm::mat4 moon_R = glm::rotate(glm::mat4(1.0f), moon_rotation_theta,
                              glm::vec3(0.0f, 0.0f, 1.0f));
    glm::mat4 moon_S = glm::mat4(1.0f);
    moon_S[0][0] = moon_scale_factor;
    moon_S[1][1] = moon_scale_factor;
    moon.Draw(moon_S, moon_R, moon_T);
}

void ErrorCallback(int error, const char* description) {
    fputs(description, stderr);
}

void KeyCallback(GLFWwindow* window, int key, int scancode, int action, int mods) {
    if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS) {
        glfwSetWindowShouldClose(window, GL_TRUE);
    }
}

int main(int argc, char *argv[]) {
    // GLFW Initialization
    if(!glfwInit()) {
        fprintf(stderr, "Failed to initialize GLFW\n");
        return EXIT_FAILURE;
    }

    glfwSetErrorCallback(ErrorCallback);

    // hint GLFW that we would like an OpenGL 3 context (at least)
    // http://www.glfw.org/faq.html#how-do-i-create-an-opengl-30-context
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
    glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
    glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);

    // attempt to open the window: fails if required version unavailable
    // note some Intel GPUs do not support OpenGL 3.2
    // note update the driver of your graphic card
    GLFWwindow* window = glfwCreateWindow(512, 512, "planets", NULL, NULL);
    if(!window) {
        glfwTerminate();
        return EXIT_FAILURE;
    }

    // makes the OpenGL context of window current on the calling thread
    glfwMakeContextCurrent(window);

    // set the callback for escape key
    glfwSetKeyCallback(window, KeyCallback);

    // GLEW Initialization (must have a context)
    // https://www.opengl.org/wiki/OpenGL_Loading_Library
    glewExperimental = GL_TRUE; // fixes glew error (see above link)
    if(glewInit() != GLEW_NO_ERROR) {
        fprintf( stderr, "Failed to initialize GLEW\n");
        return EXIT_FAILURE;
    }

    cout << "OpenGL" << glGetString(GL_VERSION) << endl;

    // initialize our OpenGL program
    Init();

    // render loop
    while(!glfwWindowShouldClose(window)) {
        Display();
        glfwSwapBuffers(window);
        glfwPollEvents();
    }

    // {stuff}.Cleanup()

    // close OpenGL window and terminate GLFW
    glfwDestroyWindow(window);
    glfwTerminate();
    return EXIT_SUCCESS;
}
