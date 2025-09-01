--!strict

local Meta = require('@lorry.utils/lib/Meta')

local Project = {}

export type Project = typeof(Project)

export type ProjectProps = {
  name: string,
}

export type UnwrappedProject = {
  name: string,
}

export type Unwrapped = {
  project: UnwrappedProject,
}

export type IHaveProject = {
  get_project: (self: IHaveProject) -> Project,
}

export type IHaveName = {
  get_name: (self: IHaveName) -> string,
}

export type ProjectImpl = Project & ProjectProps

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
  local this = self::ProjectImpl
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
