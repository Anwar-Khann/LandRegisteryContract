 # Land Registry Smart Contract

## Description:
The Land Registry Smart Contract is a decentralized application (Dapp) built on the Ethereum blockchain that allows landowners, sellers, buyers, and land inspectors to transact in a secure and transparent manner. This smart contract has the following features:

It allows the registration of land with unique IDs and stores the owner's address, land details (area, city, state), land price, and property ID in a struct called landregistry.
It allows the registration of sellers with unique IDs and stores their details (ID, name, age, city, CNIC, and email) in a struct called SellerDetails.
It allows the registration of buyers with unique IDs and stores their details (name, age, city, CNIC, and email) in a struct called BuyerDetails.
It allows the registration of land inspectors with unique IDs and stores their details (address, name, age, and designation) in a struct called 
# Structs:

## LandInspector.

It provides functions to verify and reject sellers, buyers, and land ownership.
It allows the updating of seller details.
It provides a function to get the landowner's address by land ID.

## landregistry: 

Stores the owner's address, land details (area, city, state), land price, and property ID.
SellerDetails: Stores the seller's ID, name, age, city, CNIC, and email.
## BuyerDetails:
Stores the buyer's name, age, city, CNIC, and email.
## LandInspector:
Stores the land inspector's address, name, age, and designation.
Modifiers:

# Modifiers

## LimitedRights: 

It is a modifier that restricts access to certain functions to only the land inspector.
Functions:

# Functions

## constructor():
 Initializes the smart contract and sets the address of the land inspector as the owner.
## registerSeller(): 
 Allows the registration of sellers and stores their details in the struct SellerDetails.
## VerifiySeller(): 
Allows the land inspector to verify a seller by setting the value of VerifiedSeller to true.
## RejectSeller(): 
Allows the land inspector to reject a seller by setting the value of VerifiedSeller to false.
## registerLand():
 Allows the registration of land and stores the land details in the struct landregistry.
## VerifyingLand(): 
Allows the land inspector to verify the land ownership by setting the value of VerifyLand to true.
## RejectLand(): 
Allows the land inspector to reject the land ownership by setting the value of VerifyLand to false.
## updateSeller(): 
Allows the seller to update their details.
## getLandOwnerById():
 Allows anyone to get the landowner's address by land ID.
RegisterBuyer(): Allows the registration of buyers and stores their details in the struct BuyerDetails.
## BuyerVerified(): 
Allows the land inspector to verify a buyer by setting the value of VerifiedBuyer to true.
## BuyerReject(): 
Allows the land inspector to reject a buyer by setting the value of VerifiedBuyer to false.
## Landinspector(): 
Allows the registration of land inspectors and stores their details in the struct LandInspector.

# Mappings:

## land: 
Stores the land details with unique IDs.
## seller: 
Stores the seller details with unique addresses.
## buyer: 
Stores the buyer details with unique addresses.
## landInspector: 
Stores the land inspector details with unique addresses.
## VerifiedSeller: 
Stores the verification status of sellers with unique addresses.
## VerifiedBuyer: 
Stores the verification status of buyers with unique addresses.
## VerifyLand: 
Stores the verification status of land with unique IDs.
