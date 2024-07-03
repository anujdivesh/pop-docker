
const { authJwt } = require("../middleware");
const controller = require("../controllers/dataset.controller");
module.exports = app => {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });
  
  const dataset = require("../controllers/dataset.controller.js");

  var router = require("express").Router();

  // Retrieve all Tutorials
  router.get("/", dataset.findAll);

  app.use('/api/datasets', router);


  app.post(
    "/api/dataset/add",
    controller.findOrCreate
  );
  app.get(
    "/api/dataset/:id",
    controller.findOne
  );
  app.put(
    "/api/dataset/:id",
    controller.update
  );
  app.delete(
    "/api/dataset/:id",
    controller.destroy
  );
};