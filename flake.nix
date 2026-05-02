{
  description = "fork of libfranka-common for franka robots not maintained anymore by franka";

  inputs.gepetto.url = "github:gepetto/nix";

  outputs =
    inputs:
    inputs.gepetto.lib.mkFlakoboros inputs (
      { lib, ... }:
      {
        rosOverrideAttrs.agimus-libfranka-common = {
          src = lib.fileset.toSource {
            root = ./.;
            fileset = lib.fileset.unions [
              ./CMakeLists.txt
              ./Config.cmake.in
              ./include
            ];
          };
        };
      }
    );
}
