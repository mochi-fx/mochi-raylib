const std = @import("std");
const raylib = @import("src/build.zig");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = raylib.addRaylib(b, target, optimize);
    lib.installHeader("src/raylib.h", "raylib.h");
    lib.install();
}