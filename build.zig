const std = @import("std");

fn current_file() []const u8 {
    return @src().file;
}

const cwd = std.fs.path.dirname(current_file()).?;
const sep = std.fs.path.sep_str;
const dir_raylib = cwd ++ sep ++ "raylib/src";

const raylib_build = @import("raylib/src/build.zig");

fn linkThisLibrary(b: *std.Build, target: std.zig.CrossTarget, optimize: std.builtin.Mode) *std.build.LibExeObjStep {
    const exe = b.addStaticLibrary(.{ .name = "raylib-zig", .target = target, .optimize = optimize });
    exe.addIncludePath(dir_raylib);
    exe.addIncludePath(cwd);
    exe.linkLibC();
    exe.addCSourceFile(cwd ++ sep ++ "marshal.c", &.{});
    // const lib_raylib = raylib_build.addRaylib(b, target);
    // exe.linkLibrary(lib_raylib);

    return exe;
}

/// add this package to exe
pub fn addTo(b: *std.Build, exe: *std.build.LibExeObjStep, target: std.zig.CrossTarget, optimize: std.builtin.Mode) void {
    exe.addAnonymousModule("raylib", .{ .source_file = .{ .path = cwd ++ sep ++ "raylib.zig" } });
    exe.addIncludePath(dir_raylib);
    exe.addIncludePath(cwd);
    const lib = linkThisLibrary(b, target, optimize);
    const lib_raylib = raylib_build.addRaylib(b, target, optimize);
    exe.linkLibrary(lib_raylib);
    exe.linkLibrary(lib);
}
