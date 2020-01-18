*** Settings ***

Resource          ../resource/Resource.robot
Test Setup        Open navigator
Test Teardown     Close navigator


*** Test Case ***

Scenario 01: Search existing product
      Given that I'm on the home page of the site
      When I search for "Printed Chiffon Dress"
      And click on the Search button
      Then the product "Printed Chiffon Dress" should be listed on the search result page

Scenario 02: Search for non-existent product
      Given that I'm on the home page of the site
      When I search for the product "ProductNonExistent"
      And click on the Search button
      Then the page should display the message "No results were found for your search "ProductNonExistent""

Scenario 03: Add Products to Cart
      Given that I'm on the home page of the site
      When I search for the product "t-shirt"
      And add the product to the cart
      Then the cart screen should be shown together with the product data and values
