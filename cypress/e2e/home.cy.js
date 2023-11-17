describe('home', () => {
  it("guest visits the page", () => {
    cy.visit('/');
    cy.get('section#opening-hours').within(() => {
      cy.get('h2').contains('Opening hours');
    });

    cy.get('section#ashraf').within(() => {
      cy.get('h2').contains('Man liest Ashraf Fayad');
    });

    cy.get('section#dejuner-sur-lherbe').within(() => {
      cy.get('h2').contains("Dejuner sur l'Herbe");
    });

    cy.get('section#history').within(() => {
      cy.get('h2').contains("History");
    });

    cy.get('section#contact').within(() => {
      cy.get('h2').contains("Contact");

      cy.get('address').within(() => {
        cy.contains('Bar Garage Aarau');
        cy.contains('Kirchgasse 6');
        cy.contains('CH-5000 Aarau');
        cy.get('a')
          .contains('+41 79 322 19 89')
          .should('have.attr', 'href', 'tel:+41793221989');

        cy.get('a')
          .contains('Email us')
          .should('have.attr', 'href', 'mailto:sterrrni@gmail.com');
      });

      cy.get('a')
        .contains('Follow us on Instagram')
        .should('have.attr', 'href', 'https://www.instagram.com/sterrrni/');
    });
  });

  it("highlights tuesday in opening hours", () => {
    // 2022-03-15 is a tuesday
    cy.clock(new Date(2022, 2, 15).getTime());
    cy.visit('/');
    cy.get('section#opening-hours').within(() => {
      cy.get('.weekday.mon').should('not.have.class', 'highlighted');
      cy.get('.weekday.tue').should('have.class', 'highlighted');
      cy.get('.weekday.wed').should('not.have.class', 'highlighted');
      cy.get('.weekday.thu').should('not.have.class', 'highlighted');
      cy.get('.weekday.fri').should('not.have.class', 'highlighted');
      cy.get('.weekday.sat').should('not.have.class', 'highlighted');
      cy.get('.weekday.sun').should('not.have.class', 'highlighted');
    });
  });

  it("highlights friday in opening hours", () => {
    // 2022-03-17 23:00:00 is a Thursday in UTC, but a Friday in Zurich
    cy.clock(new Date(Date.UTC(2022, 2, 17, 23, 0, 0)).getTime());
    cy.visit('/');
    cy.get('section#opening-hours').within(() => {
      cy.get('.weekday.mon').should('not.have.class', 'highlighted');
      cy.get('.weekday.tue').should('not.have.class', 'highlighted');
      cy.get('.weekday.wed').should('not.have.class', 'highlighted');
      cy.get('.weekday.thu').should('not.have.class', 'highlighted');
      cy.get('.weekday.fri').should('have.class', 'highlighted');
      cy.get('.weekday.sat').should('not.have.class', 'highlighted');
      cy.get('.weekday.sun').should('not.have.class', 'highlighted');
    });
  });
})
