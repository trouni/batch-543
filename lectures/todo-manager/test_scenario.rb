require_relative 'repository'
require_relative 'controller'
require_relative 'view'
require_relative 'router'

view = View.new
repository = Repository.new
controller = Controller.new(view, repository)

router = Router.new(controller)
router.run