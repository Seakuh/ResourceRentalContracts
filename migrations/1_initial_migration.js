const Migrations = artifacts.require("Migrations");
const ResourceRentalSaveInformation = artifacts.require(
  "ResourceRentalSaveInformation"
);

module.exports = function (deployer) {
  deployer.deploy(Migrations);

  const resource = {
    resourceId: 345345,
    resourceName: "Laptop",
    loanable: false,
    loanInterval: 34552335,
    resourceElectricityCostPerHour: 34552335,
    resourceCosts: 34552335,
    computingPower: 34552335,
    buyOut: false,
    appraisedValue: 345,
  };

  const booking = {
    startBookingTime: 343535,
    endBookingTime: 343535,
    renter: 343535,
  };

  deployer.deploy(ResourceRentalSaveInformation, resource, booking);
};
