local Meta = require('@develfish-repo.utils/lib/Meta')
local Wrapper = require('./Wrapper')

export type Project = {
  name: string?,
  unwrap_project: (self: Project) -> UnwrappedProject,
} & Wrapper.Unwrappable<Unwrapped>

export type UnwrappedProject = {
  name: string?,
}

export type Unwrapped = {
  project: UnwrappedProject,
}

local Project = {
  name = nil,
}

function Project:new(o: any): Project
  return Meta:type(o, self, 'Project')
end

function Project:from(name: string): Project
  return Project:new({
    name = name,
  })
end

function Project.unwrap_project(self: Project): UnwrappedProject
  return {
    name = self.name
  }
end

function Project.unwrap(self: Project): Unwrapped
  return {
    project = self:unwrap_project(),
  }
end

return Project
