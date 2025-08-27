--!strict

local WithBundle = {}

export type WithBundle = {
  bundle: BundleData
}

export type BundleData = {
  name: string,
}

export type MinioRemote = {
  target_server: string,
  access_key: string,
  secret_key: string,
}

export type OpenidRemote = {
  url: string,
  client_id: string,
  client_secret: string,
  issuer_uri: string,
  redirect_uri: string,
}

export type Datasource = {
  url: string,
  username: string,
  password: string,
}

export type KafkaRemote = {
  bootstrap_servers: string,
}

export type Credentials = {
  username: string,
  password: string,
}

return WithBundle
