{
  inputs = {
    nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay";
    nixpkgs.follows = "nix-ros-overlay/nixpkgs";  # IMPORTANT!!!
  };
  outputs = { self, nix-ros-overlay, nixpkgs }:
    nix-ros-overlay.inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ nix-ros-overlay.overlays.default ];
        };
      in {
        devShells.default = pkgs.mkShell {
          name = "Nix Shell";
		packages = with pkgs; [
		rosPackages.iron.ignition-cmake2-vendor
            rosPackages.noetic.turtlesim
            rosPackages.noetic.ros-core
            rosPackages.noetic.gazebo
            rosPackages.noetic.gazebo-ros
            rosPackages.noetic.urdf
            rosPackages.noetic.actionlib
            rosPackages.noetic.interactive-markers
            rosPackages.noetic.tf
            rosPackages.noetic.xacro
          ];
        };
      });
  nixConfig = {
    extra-substituters = [ "https://ros.cachix.org" ];
    extra-trusted-public-keys = [ "ros.cachix.org-1:dSyZxI8geDCJrwgvCOHDoAfOm5sV1wCPjBkKL+38Rvo=" ];
  };
}
