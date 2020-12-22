{ config, pkgs, ... }:

{
  services.matrix-synapse = {
    enable = true;
    app_service_config_files = [
      "/var/lib/matrix-synapse/telegram-registration.yaml"
    ]
  };
}
