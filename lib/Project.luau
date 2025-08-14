--!strict

local Meta = require('@develfish-repo.utils/lib/Meta')

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

function Project:new(o: ProjectProps): Project
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
