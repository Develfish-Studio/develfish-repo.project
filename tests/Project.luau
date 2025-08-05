local describe = require("@develfish-repo.testing/lib/describe")
local Project = require("@root/lib/Project")

describe("Project Record") (
  function (it)
    it("should provide ability to construct project") (
      function (check)
        local project = Project:from("example_project")

        check.eq(project.__type, "Project")
        check.eq(project.name, "example_project")

        local unwrapped = project:unwrap()

        check.eq(unwrapped.project.name, "example_project")
      end
    )
  end
)

return {}