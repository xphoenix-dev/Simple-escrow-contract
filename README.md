# Simple Escrow Contract

This smart contract acts as an escrow service between a buyer and a seller, holding funds until both parties approve the transaction.

## Features

- Buyer deposits funds into the escrow.
- Both buyer and seller must approve the transaction to release the funds.
- The buyer can request a refund if the seller has not approved the transaction.

## How to Use

1. Deploy the contract with the seller's address and send the payment amount.
2. The buyer and seller both use `approveByBuyer()` and `approveBySeller()` respectively to approve the transaction.
3. If both parties approve, the funds are released to the seller.
4. If necessary, the buyer can call `refund()` to get their funds back if the seller hasn't approved.

## Security Considerations

- Ensure both parties understand the contract's terms before using it.
- The buyer must trust that the seller will approve the transaction after providing the goods or services.

