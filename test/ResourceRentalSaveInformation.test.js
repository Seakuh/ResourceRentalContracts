const resourceRentalSaveInformationBase = artifacts.require(
  "./ResourceRentalSaveInformationBase.sol"
);

contract("ResourceRental", (accounts) => {
  it("should deploy successfully", async () => {
    const resourceRentalSaveInformationBaseInstance =
      await resourceRentalSaveInformationBase.deployed();
  });

  it("lists tasks", async () => {});
});
