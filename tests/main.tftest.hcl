# -----------------------------------------------------------------------------
# OPEN TOFU TEST
# -----------------------------------------------------------------------------

variables {
  networks = {
    test_net = {
      name   = "test-network"
      driver = "bridge"
    }
  }
  volumes = {
    test_vol = {
      name = "test-volume"
    }
  }
  containers = {
    test_cont = {
      name  = "test-container"
      image = "nginx:latest"
      networks_advanced = [{
        name = "test-network"
      }]
      ports = [{
        internal = 80
        external = 8080
      }]
    }
  }
}

run "validate_plan" {
  command = plan

  assert {
    condition     = length(module.network.networks) == 1
    error_message = "Should have 1 network"
  }

  assert {
    condition     = length(module.volume.volumes) == 1
    error_message = "Should have 1 volume"
  }

  assert {
    condition     = length(module.container.containers) == 1
    error_message = "Should have 1 container"
  }
}
