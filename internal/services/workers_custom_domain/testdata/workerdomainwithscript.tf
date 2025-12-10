resource "cloudflare_workers_script" "%[1]s" {
  account_id  = "%[2]s"
  script_name = "%[1]s"
  content     = "addEventListener('fetch', event => {event.respondWith(new Response('test'))});"
}

resource "cloudflare_workers_custom_domain" "%[1]s" {
  account_id  = "%[2]s"
  zone_id     = "%[3]s"
  hostname    = "%[4]s"
  service     = cloudflare_workers_script.%[1]s.script_name
  environment = "production"
}
