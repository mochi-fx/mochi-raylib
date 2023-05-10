
## mochi-raylib
Static fork of the [raylib.zig](https://github.com/ryupold/raylib.zig) bindings (4.6-dev) for the mochi-fx project

## Why
Forked to make use of the official Zig package management for the mochi-fx project. 
This requires raylib to be included in the project. ie. not included as a git submodule. 

We also seek to make some alterations to raylib core:

- Use headless rendering hack (define GLFW visibility of window)
- Use EGL based true headless rendering (in the future)

Please see [raylib.zig](https://github.com/ryupold/raylib.zig) for your own binding solution for Zig.
