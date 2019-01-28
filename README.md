# README

Rales(Rails) Engine.  Lets play with some JSON!

## Setup

- Clone this repo using the link above
- Please use Ruby 2.4.1
- run 'bundle'
- rails db:{drop,create,migrate}
- rake setup:csv
- Test with rspec

## Endpoints

### Merchants
- /api/v1/merchants.json (gives a list of all merchants)
- /api/v1/merchants/1.json (gives one merchant)

### Invoices 
- /api/v1/invoices.json (gives a list of all invoices)
- /api/v1/invoices/1.json (gives one invoice)

### Invoice Items
- /api/v1/invoice_items.json (gives a list of all invoice_items)
- /api/v1/invoice_items/1.json (gives one invoice_item)

### Items
- /api/v1/items.json (gives a list of all items)
- /api/v1/items/1.json (gives one item)

### Transactions
- /api/v1/transactions.json (gives a list of all transactions)
- /api/v1/transactions/1.json (gives one transaction)

### Customers
- /api/v1/customers.json (gives a list of all customers)
- /api/v1/customers.json (gives one customer)

## Relationship Endpoints

### Merchants
- /api/v1/merchants/:id/items (returns a collection of items associated with that merchant)
- api/v1/merchants/:id/invoices (returns a collection of invoices associated with that merchant from their known orders)

### Invoices
- /api/v1/invoices/:id/transactions (returns a collection of associated transactions)
- /api/v1/invoices/:id/invoice_items (returns a collection of associated invoice items)
- /api/v1/invoices/:id/items (returns a collection of associated items)
- /api/v1/invoices/:id/customer (returns the associated customer)
- /api/v1/invoices/:id/merchant (returns the associated merchant)

### Invoice Items
- /api/v1/invoice_items/:id/invoice (returns the associated invoice)
- /api/v1/invoice_items/:id/item (returns the associated item)

### Items
- /api/v1/items/:id/invoice_items (returns a collection of associated invoice items)
- /api/v1/items/:id/merchant (returns the associated merchant)

### Transactions
- /api/v1/transactions/:id/invoice (returns the associated invoice)

### Customers
- /api/v1/customers/:id/invoices (returns a collection of associated invoices)
- /api/v1/customers/:id/transactions (returns a collection of associated transactions)
