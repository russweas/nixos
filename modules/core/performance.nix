{ ... }:
{
  boot.kernel.sysctl = {
    # Swap/memory tuning (swappiness 180 is appropriate for zram)
    "vm.swappiness" = 180;
    "vm.dirty_ratio" = 10;
    "vm.dirty_background_ratio" = 5;
    "vm.vfs_cache_pressure" = 50;

    # Network performance (BBR congestion control)
    "net.core.default_qdisc" = "fq";
    "net.ipv4.tcp_congestion_control" = "bbr";
  };

  services.earlyoom = {
    enable = true;
    freeMemThreshold = 5;
    freeSwapThreshold = 10;
  };
}
