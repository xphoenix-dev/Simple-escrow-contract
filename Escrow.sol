// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {
    address public buyer;
    address public seller;
    uint256 public amount;
    bool public isBuyerApproved;
    bool public isSellerApproved;

    constructor(address _seller) payable {
        buyer = msg.sender;
        seller = _seller;
        amount = msg.value;
    }

    modifier onlyBuyer() {
        require(msg.sender == buyer, "Only the buyer can perform this action");
        _;
    }

    modifier onlySeller() {
        require(msg.sender == seller, "Only the seller can perform this action");
        _;
    }

    function approveByBuyer() external onlyBuyer {
        isBuyerApproved = true;
        releaseFunds();
    }

    function approveBySeller() external onlySeller {
        isSellerApproved = true;
        releaseFunds();
    }

    function releaseFunds() internal {
        if (isBuyerApproved && isSellerApproved) {
            payable(seller).transfer(amount);
        }
    }

    function refund() external onlyBuyer {
        require(!isSellerApproved, "Seller has already approved");
        payable(buyer).transfer(amount);
    }
}
