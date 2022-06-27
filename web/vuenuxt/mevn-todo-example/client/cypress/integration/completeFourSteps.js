describe("Test Add 4 todos page", () => {
  //
  // This is a quick smoke test, checks the full CRUD operations
  // by creating, reading, updating and deleting 4 todo items.
  // run the Cypress app from the commandline ->   ./node_modules/.bin/cypress open
  //
  it("Should be able to create 4 steps, check as completed, delete all 4", () => {
   cy.visit(Cypress.env('CLIENT_URL'))
   cy.get('#input-32').type('Step 1{enter}')
   cy.get('#input-32').type('Step 2{enter}')
   cy.get('#input-32').type('Step 3{enter}')
   cy.get('#input-32').type('Step 4{enter}')

   cy.get('.v-card > .v-list > :nth-child(1) > .v-list-item__content > .v-list-item__title').should('have.text', 'Step 1')
   cy.get('.v-card > .v-list > :nth-child(2) > .v-list-item__content > .v-list-item__title').should('have.text', 'Step 2')
   cy.get('.v-card > .v-list > :nth-child(3) > .v-list-item__content > .v-list-item__title').should('have.text', 'Step 3')
   cy.get('.v-card > .v-list > :nth-child(4) > .v-list-item__content > .v-list-item__title').should('have.text', 'Step 4')

   cy.get(':nth-child(1) > .v-list-item__action > .v-input > .v-input__control > .v-input__slot > .v-input--selection-controls__input > .v-input--selection-controls__ripple').click()
   cy.get(':nth-child(2) > .v-list-item__action > .v-input > .v-input__control > .v-input__slot > .v-input--selection-controls__input > .v-input--selection-controls__ripple').click()
   cy.get(':nth-child(3) > .v-list-item__action > .v-input > .v-input__control > .v-input__slot > .v-input--selection-controls__input > .v-input--selection-controls__ripple').click()
   cy.get(':nth-child(4) > .v-list-item__action > .v-input > .v-input__control > .v-input__slot > .v-input--selection-controls__input > .v-input--selection-controls__ripple').click()
   cy.get(':nth-child(4) > .v-list-item__icon > .v-icon').click()
   cy.get(':nth-child(3) > .v-list-item__icon > .v-icon').click()
   cy.get(':nth-child(2) > .v-list-item__icon > .v-icon').click()
   cy.get(':nth-child(1) > .v-list-item__icon > .v-icon').click()
  })
})
