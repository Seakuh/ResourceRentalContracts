const Migrations = artifacts.require("Migrations");
const ResourceRentalBackendOracle = artifacts.require(
  "ResourceRentalBackendOracle"
);

module.exports = function (deployer) {
  deployer.deploy(ResourceRentalBackendOracle);
};
