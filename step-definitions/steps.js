// spec.js

module.exports = function () {

  this.Given(/^transaction data$/, function (table) {
    console.log('Background: transaction data');
    //    transactionData is defined in ".\node_modules\selenium-cucumber-js\runtime\world.js"
    this.transactionData = table.hashes()[0];

    console.log('this:', JSON.stringify(this));

  });

  this.Given(/^the api is available$/, function () {
    console.log('Given: the api is available');

  });

  this.When(/^the user creates a payment order with (.*) and (.*) from a different domain$/, function (description, header) {
    console.log('When: the user creates a payment order with <description> and <header> from a different domain');
    console.log('transaction data:');
    console.log(this.transactionData.debtorAccountNumber);
    console.log(this.transactionData['instructedAmount']);
    console.log(description, header);

  });

  this.Then(/^a valid response code is returned with code (.*)$/, function (http_code) {
    console.log('Then: valid response code:', http_code);
  });

  this.Then(/^an invalid response code is returned with code (.*)$/, function (http_code) {
    console.log('Then: invalid response code:', http_code);
  });

}
