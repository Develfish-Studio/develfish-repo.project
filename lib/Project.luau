--!strict

local Meta = require('@lorry.utils/lib/Meta')

local Project = {}

export type Project = typeof(Project) & ProjectProps

export type ProjectProps = {
  name: string,
}

export type UnwrappedProject = {
  name: string,
}

export type Unwrapped = {
  project: UnwrappedProject,
}

--- Creates an instance of Project
--- @param o Project properties
function Project:new(o: ProjectProps): Project
  return Meta:type(o, self, 'Project')
end

--- Creates an instance of Project
--- @param name The name of the project in **snake_case**
function Project:from(name: string): Project
  return Project:new({
    name = name,
  })
end

function Project:unwrap_project(): UnwrappedProject
  local this = self::Project
  return {
    name = this.name
  }
end

function Project:unwrap(): Unwrapped
  local this = self::Project
  return {
    project = this:unwrap_project(),
  }
end

return Project
