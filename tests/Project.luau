local describe = require("@develfish-repo.testing/lib/describe")
local Meta = require("@develfish-repo.utils/lib/Meta")
local Project = require("@root/lib/Project")

describe("Project Record") (
  function (it)
    it("should provide ability to construct project") (
      function (check)
        local project = Project:from("example_project")

        check.eq(Meta:typeof(project), "Project")
        check.eq(project.name, "example_project")

        local unwrapped = project:unwrap()

        check.eq(unwrapped.project.name, "example_project")
      end
    )
  end
)

return {}