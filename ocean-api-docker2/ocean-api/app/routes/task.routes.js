
const { authJwt } = require("../middleware/index.js");
const controller = require("../controllers/task.controller.js");
module.exports = app => {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });
  
  const log = require("../controllers/task.controller.js");

  var router = require("express").Router();

  // Retrieve all Tutorials
  router.get("/", log.findAll);

  app.use('/api/tasks', router);


  app.post(
    "/api/task/add",
    controller.findOrCreate
  );
  app.get(
    "/api/task/:id",
    controller.findOne
  );
  app.put(
    "/api/task/:id",
    controller.update
  );
  app.delete(
    "/api/task/:id",
    controller.destroy
  );
};