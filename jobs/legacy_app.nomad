job "legacy" {
	datacenters = ["dc1"]

	group "nginx" {

		network {
			port "http" { to = 80 }
		}

		task "nginx" {
			driver = "docker"

			config {
				image = "nginx:latest"
				
				ports = [
					"http"
				]

				mount {
					type = "volume"
					target = "/usr/share/nginx/html"
					source = "${NOMAD_JOB_NAME}"
					readonly = false
				}
			}

		} # END task nginx
	} # END group
} # END job
