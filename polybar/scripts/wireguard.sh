#!/bin/bash

# Check if WireGuard is enabled
if systemctl is-enabled wg-quick@wg0; then
  # If enabled, check the connection status
  if systemctl is-active wg-quick@wg0; then
    # If connected, display the WireGuard icon and IP address
    echo "WireGuard %F{#00ff00}$(wg show wg0 | grep " endpoint" | cut -d' ' -f2)%F{#ffffff}"
  else
    # If not connected, display a disconnected message
    echo "WireGuard %F{#ff0000}Disconnected%F{#ffffff}"
  fi
else
  # If not enabled, display a disabled message
  echo "WireGuard %F{#ff0000}Disabled%F{#ffffff}"
fi
