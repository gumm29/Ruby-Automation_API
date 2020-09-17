def yaml(file_yaml)
  YAML.load_file(File.dirname(__FILE__) + file_yaml)
end

def module_name(files)
  file = File.open(files)
  name_module = file.each_line.first.split(' ')
  Object.const_get(name_module[1])
end

def prepare_payload(payload = nil, token = nil, user_hash = nil)
  json = {}
  json[:body] = payload.to_json
  json[:headers] = simple(token) if user_hash.nil?
  json[:headers] = simple(token).merge(access_token(token)) if payload && token && user_hash.nil?
  json[:headers] = simple(token).merge(hash_json(user_hash)) if user_hash

  json
end

def simple(token = nil)
  json = {}
  json[:'Content-Type'] = token.nil? ? 'application/x-www-form-urlencoded' : 'application/json'
  json[:Accept] = '*/*'
  json[:Authorization] = token.nil? ? 'Basic token' : "bearer #{token}"

  json
end

def access_token(token)
  json = {}
  json[:access_token] = token

  json
end

def hash_json(user_hash)
  json = {}
  json[:hash] = user_hash

  json
end