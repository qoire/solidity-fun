const A = artifacts.require('A1');
const B = artifacts.require('B1');
const C = artifacts.require('C1');

const A2 = artifacts.require('A2');
const B2 = artifacts.require('B2');
const C2 = artifacts.require('C2');

contract('Shadowing Scenarios', (accs) => {

  describe("Scenario 1", () => {
    it("what should C return?", async () => {
      const c = await C.new();
      console.log((await c.variable()).toString()); //2
    });

    it("what should C getVariable() return?", async() => {
      const c = await C.new();
      const variable = await c.getVariable();
      console.log((await c.getVariable()).toString()); //1
    });
  });

  describe("Scenario 2", () => {
    it("what should C2 return?", async () => {
      const c = await C2.new();
      console.log((await c.variable()).toString()); //3
      console.log((await c.getB2Variable()).toString()); //3
      console.log((await c.getA2Variable()).toString()) //1
      
      /**
       * Dangerous! C2 the main contract is using variable referenced from
       * B2. Effectively the variables from A2 remain untouched.
       * 
       * This may be catastrophic if say a contract that inherited Owner
       * overrode one of the properties.
       */
    });
  });
});