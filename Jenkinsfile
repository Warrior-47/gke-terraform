pipeline {
  agent any
  stages {
    stage('get creds') {
      steps {
        sh 'echo $cred > cred.json'
      }
    }

    stage('terraform plan') {
      steps {
        sh '''
terraform init
terraform validate
terraform plan -out a.plan'''
      }
    }

  }
  environment {
    cred = '{   "type": "service_account",   "project_id": "playground-s-11-27117915",   "private_key_id": "c02621d4829a6aeac1e27b16641df045c0691517",   "private_key": "-----BEGIN PRIVATE KEY-----\\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCLMDoFxmE+I4U9\\n1fCynmNvH7oH7wIcim0b6IctJOfWMwoAKdogmH1qsEnlY2xm0JxML54fO8+8ZRen\\nV+89qfhXvz3I0pefjvfzAB/r7R2fzUJtq/GBzSMl3fH2afiGNIRGdFoox6fk0N97\\nYtIyN4NOxKcZOa64hK9k1Fx9cJMAxfKc41Lq7A4rEl4bTAq9Iab9Co3FWbix8jEa\\n2X6lrUwcwkXQDKxcxiYKT9ednPId7R2+tmwM6ch+8ZxU7LwIal2xm+KEDrAs6izD\\n2coVJpYATeWi263nujlMt9p4JaN7p95trmvMM6gBdQvporsTKMyoax0TBrwTNt0H\\nwMwHbYi/AgMBAAECggEAD82k+NziU5zS1weAcbdcENToWVhAxB7PbpjDKFQFYqOe\\n4g/ebU8DBmcHrNzSBQZwiJHrgR5YYsqTmfN4/WZcBRJ4oGGQx5QDAPslpLLiZy91\\n+F/KZvN0pysA+vpjNlGmJx200uaAYJF6nlbFCOCWrw3S7yFGfjrKc0dNTQzIFBE6\\nqL8krDtpEdgrt2Szy6L2iLT9l85qo0mzAzZ0/mz8tNfWcsw3wvkakmpyo4kgv3pw\\nxXQJDUQq889SjVtLLxDo6CNXYqEQpaqMsPpoQsw+MRQJ5sL870FoEx5ndQ6s/DqG\\nIgBh71O26UWL+fM9YnJ5v2DUjtphpoSNzEHrKHeYYQKBgQDExUWA7Ez1yyoZouwG\\nagr2ZjBOSJbsFNySgouuyTbTtaIfdmcz11C/hxEwDfOCKKoLp4uQR5BuqfnnBhGV\\nVI/g+dusnmj6mo681tsxAOZxTy4Q8E55kZcAVRPUIda9+KqSMKkg+crHScNENjNS\\nIq5Z4HGw6mDjHacefOsS+lBtDwKBgQC1FcqQwHNbfO+cUY2PrvSfvh+zBdxG/6y2\\nIVpuXUWctHJvIIwYhxSI1HjLnftguwtCQn0Z3BUey6J6JOxECWm2PVU7BjZeVRyA\\nAjfoIeRAK2wsiaYoY9GSDjpIETht5HA6o81RtnOI60jfsqLvgQxzv96W7w7DJou1\\nS0zrGIKJUQKBgHJf8IyFzh45H5mTN/pqfUDIGWAHlaJYZfXLaAIK95GLzFbZbheW\\nGluZ2QXDtj18AYuQsfEFiBCrQJVm06WnZ5Jv6Z6m3YJ9gGaHxRTw3wIR8kbqR9Mm\\nK02IJmRx3u7BsfQT0NtYFuRMHfJyRtaBTjLz4WHierrJK7DvD30SftlFAoGBAK12\\n6WtOH3MFNBae/Kcl5klbe8wnEgKlCpIRUyojiPp61J/lIq6gPyhvuCL8+/+GTVu0\\ni1gJPeYZFVRCKF1oUu5yxEFdSxmEGF/7QAjK5nYd4mqrlRJdxDRQEr5UWKTUTjmu\\nDZF34CbJlC5NVc1t5jq/En+tEowYUX5iWpVeDjVxAoGBAJu2Jl4ci9N/0ZWkgbs2\\nryJC0MNKr7ahhNcE6v7RuDS1zllzz0spEAFhyk8NnKv0asvj5fHbFfzuI9OK+pLH\\nTlQ6PnaktVN7xQAp+Dpfxo19jaM+1kP4tj93E3RjKtc+JzyFcFlleZ6HcU6+ksCm\\nJkVj1is3COBKMF9KLbsZXwFG\\n-----END PRIVATE KEY-----\\n",   "client_email": "cli-service-account-1@playground-s-11-27117915.iam.gserviceaccount.com",   "client_id": "113546490052374150530",   "auth_uri": "https://accounts.google.com/o/oauth2/auth",   "token_uri": "https://oauth2.googleapis.com/token",   "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",   "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/cli-service-account-1%40playground-s-11-27117915.iam.gserviceaccount.com" }'
  }
}