module.exports = (sequelize, Sequelize) => {
    const Task = sequelize.define("task", {
      task_name: {
        type: Sequelize.STRING,
      },
      task_class: {
        type: Sequelize.STRING,
      },
      task_class_id: {
        type: Sequelize.INTEGER,
      },
      status: {
        type: Sequelize.STRING
      },
      priority: {
        type: Sequelize.STRING
      },
      frequency: {
        type: Sequelize.STRING
      },
      occurance_days: {
        type: Sequelize.STRING
      },
      occurance_hours: {
        type: Sequelize.STRING
      },
      duration: {
        type: Sequelize.STRING
      },
      task_start_time: {
        type: Sequelize.DATE
      },
      next_run_time: {
        type: Sequelize.DATE
      },
      last_run_time: {
        type: Sequelize.DATE
      },
      enabled: {
        type: Sequelize.BOOLEAN
      },
      health: {
        type: Sequelize.STRING
      },
      fail_count: {
        type: Sequelize.INTEGER,
        default:0
      },
      success_count: {
        type: Sequelize.INTEGER,
        default:0
      },
      reset_count:{
        type: Sequelize.INTEGER,
        default:0
      }
    });
  
    return Task;
  };
  