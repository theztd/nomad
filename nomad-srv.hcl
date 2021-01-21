name = "dev1"
datacenter = "dc1"
bind_addr = "0.0.0.0"
enable_debug = true

data_dir = "/tmp/dev1/"

server {
    enabled = true
    bootstrap_expect = 1
    #encrypt = "+6NqVXEO8Vk/AjNt82pl8io55b9UJE55ZaxgH0o679A="
}

client {
    enabled = true

    node_class = "dev"

    meta = {
        "workload" = "persistent"
        "region" = "local"
        "env" = "dev"
    }

    reserved {
        cpu = 0
        memory = 0
        disk = 0
    }

    options = {
        "driver.blacklist" = "java"
    }
}

#acl {
#    enabled = true
#}

plugin "docker" {
  config {
    auth {
      config = "/home/marek/.docker/config.json"
    }

    allow_privileged = true
    pull_activity_timeout = "10m"

    volumes {
      enabled      = true
    }
  }
}
