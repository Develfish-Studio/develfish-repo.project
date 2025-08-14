--!strict

local Meta = require('@develfish-repo.utils/lib/Meta')
local Case = require('@develfish-repo.utils/lib/Case')
local String = require('@develfish-repo.utils/lib/String')

local Wrapper = {}

export type Wrapper = typeof(Wrapper)

export type Unwrappable<T> = {
  unwrap: (self: Unwrappable<T>) -> T
}

export type Copy<T> = {
  copy: (self: Copy<T>) -> T
}

export type UnwrappedSegment = {
  name: string,
  snake_name: string,
  camel_name: string,
  pascal_name: string,
  kebab_name: string,
}

export type UnwrappedPath = {UnwrappedSegment}

export type UnwrappedName = {
  name: string,
  snake_name: string,
  camel_name: string,
  pascal_name: string,
  kebab_name: string,
}

function Wrapper:unwrap_array<T>(array: {Unwrappable<T>}): {T}
  local result = Meta:array {}
  for _, item in array do
    result[#result + 1] = item:unwrap()
  end
  return result
end

function Wrapper:unwrap_array_or_nil<T>(array: {Unwrappable<T>}): {T}?
  local result = Meta:array {}
  for _, item in array do
    result[#result + 1] = item:unwrap()
  end
  return #result > 0 and result or nil
end

function Wrapper:unwrap_path(path: string?): UnwrappedPath?
  if path ~= nil then
    local array = Meta:array {}
    local segments = String:split(path, String.EXPR_DOT)
    for _, name in segments do
      local segment = {
        name = name,
        snake_name = name,
        camel_name = Case:snake_to_camel(name),
        pascal_name = Case:snake_to_pascal(name),
        kebab_name = Case:snake_to_kebab(name),
      }
      array[#array + 1] = segment
    end
    return array
  end
  return nil
end

function Wrapper:unwrap_name(name: string): UnwrappedName
  return {
    name = name,
    snake_name = name,
    camel_name = Case:snake_to_camel(name),
    pascal_name = Case:snake_to_pascal(name),
    kebab_name = Case:snake_to_kebab(name),
  }
end

function Wrapper:unwrap_name_or_nil(name: string?): UnwrappedName?
  if name == nil then
    return nil
  end
  return Wrapper:unwrap_name(name)
end

function Wrapper:array_or_nil<T>(array: {T}?): {T}?
  if (array ~= nil and #array > 0) then
    return array
  end
  return nil
end

function Wrapper:map<T, R>(array: {T}, convert: (T) -> R): {R}
  local result = Meta:array {}
  for _, v in array do
    result[#result + 1] = convert(v)
  end
  return result
end

function Wrapper:map_to_prop<T, R>(array: {T}, key: string): {R}
  local result = Meta:array {}
  for _, v in array do
    if (typeof(v) == 'table') then
      result[#result + 1] = v[key]
    end
  end
  return result
end

function Wrapper:associate_by_prop<T, K, R>(array: {T}, key: string, convert: (T) -> R): {[K]: R}
  local result = Meta:table {}
  for _, v in array do
    if typeof(v) == 'table' then
      result[v[key]] = convert(v)
    end
  end
  return result
end

return Wrapper