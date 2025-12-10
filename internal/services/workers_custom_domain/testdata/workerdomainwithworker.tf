resource "cloudflare_worker" "%[1]s" {
  account_id = "%[2]s"
  name       = "%[1]s"

  subdomain = {
    enabled          = false
    previews_enabled = false
  }
}

resource "cloudflare_workers_custom_domain" "%[1]s" {
  account_id  = "%[2]s"
  zone_id     = "%[3]s"
  hostname    = "%[4]s"
  service     = cloudflare_worker.%[1]s.name
  environment = "production"
}
