{ pkgs, conf, ... }: {
  imports = [ ./zerotier.nix ];

  fileSystems = let
    nas-ip = (import ./credentials.nix).nas-ip;
  in {

    "/mnt/nas/backup" = {
      fsType = "nfs";
      device = "[${nas-ip}]:/mnt/naspool1/backup";
    };

    "/mnt/nas/data" = {
      fsType = "nfs";
      device = "[${nas-ip}]:/mnt/naspool1/data";
    };

  };
}
