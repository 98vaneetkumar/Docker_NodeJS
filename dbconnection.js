const Sequelize = require("sequelize");
const env = process.env.NODE_ENV || "development";
const config=require("./config/config.json")[env]

let sequelize;
if (config.use_env_variable) {
  sequelize = new Sequelize(process.env[config.use_env_variable], config);
} else {
  sequelize = new Sequelize(
    config.database,
    config.username,
    config.password,
    {
      ...config,
      host: config.host,
      port:8081,
      dialect: "mysql",
      query: { raw: true }, // Place the query option here
    }
  );
}
var connectDB = () => {
  sequelize
    .authenticate()
    .then(() => {
      sequelize.sync({ alter: true });
      console.log("Connected Successfully");
    })
    .catch((err) => {
      console.log("Sequelize Connection Error:  ", err);
    });
};

module.exports = {
  sequelize: sequelize,
  connectDB: connectDB,
};