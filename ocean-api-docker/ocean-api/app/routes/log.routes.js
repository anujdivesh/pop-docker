
const { authJwt } = require("../middleware/index.js");
const controller = require("../controllers/log.controller.js");
module.exports = app => {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });
  
  const log = require("../controllers/log.controller.js");

  var router = require("express").Router();

  // Retrieve all Tutorials
  router.get("/", log.findAll);

  app.use('/api/logs', router);


  app.post(
    "/api/log/add",
    controller.findOrCreate
  );
  app.get(
    "/api/log/:id",
    controller.findOne
  );
  app.put(
    "/api/log/:id",
    controller.update
  );
  app.delete(
    "/api/log/:id",
    controller.destroy
  );
};