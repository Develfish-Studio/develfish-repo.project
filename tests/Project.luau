--!strict

local describe = require("@lorry.testing/lib/describe")
local Meta = require("@lorry.utils/lib/Meta")
local Project = require("@root/lib/Project")

return describe("Project Record") (
  function (it)
    it("should provide ability to construct project") (
      function (check)
        local project = Project:from("example_project")

        check.eq(Meta:typeof(project), "Project")

        local unwrapped = project:unwrap()

        check.eq(unwrapped.project.name, "example_project")
      end
    )
  end
)
