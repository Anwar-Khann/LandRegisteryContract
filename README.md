# LandRegistry Smart Contract Documentation

## Overview

The LandRegistry smart contract provides a decentralized system for registering and managing land ownership. It allows users to register land properties, sellers, buyers, and land inspectors. It also provides verification mechanisms for sellers and buyers.

## Contract Details

- **Contract Name:** LandRegistry
- **SPDX-License-Identifier:** GPL-3.0
- **Solidity Version:** 0.8.7

## Structures

### Land Registry

- `struct LandRegistry`
  - `Owner`: Address of the landowner.
  - `Area`: Area of the land.
  - `City`: City where the land is located.
  - `State`: State where the land is located.
  - `LandPrice`: Price of the land.
  - `PropertyId`: Unique identifier for the land property.

### Buyer Details

- `struct BuyerDetails`
  - `Name`: Name of the buyer.
  - `Age`: Age of the buyer.
  - `City`: City of residence of the buyer.
  - `Cnic`: National identification number of the buyer.
  - `Email`: Email address of the buyer.

### Seller Details

- `struct SellerDetails`
  - `id`: Unique identifier for the seller.
  - `Name`: Name of the seller.
  - `Age`: Age of the seller.
  - `City`: City of residence of the seller.
  - `Cnic`: National identification number of the seller.
  - `Email`: Email address of the seller.

### Land Inspector

- `struct LandInspector`
  - `id`: Address of the land inspector.
  - `name`: Name of the land inspector.
  - `age`: Age of the land inspector.
  - `designation`: Designation of the land inspector.

## Constructor

### `constructor()`

- **Description:** Initializes the contract, setting the contract deployer as the land inspector.

## Modifiers

### `modifier LimitedRights`

- **Description:** Ensures that only the land inspector can execute the function.

## Functions

### `Landinspector(address _addr, string memory _name, uint _age, string memory _designation)`

- **Description:** Adds a new land inspector.
- **Parameters:**
  - `_addr`: Address of the land inspector.
  - `_name`: Name of the land inspector.
  - `_age`: Age of the land inspector.
  - `_designation`: Designation of the land inspector.

### `registerSeller(uint _id, string memory _Name, uint _Age, string memory _City, uint _Cnic, string memory _Email)`

- **Description:** Registers a seller.
- **Parameters:**
  - `_id`: Unique identifier for the seller.
  - `_Name`: Name of the seller.
  - `_Age`: Age of the seller.
  - `_City`: City of residence of the seller.
  - `_Cnic`: National identification number of the seller.
  - `_Email`: Email address of the seller.

### `VerifiySeller(address _addr)`

- **Description:** Verifies a seller.
- **Parameters:**
  - `_addr`: Address of the seller.

### `RejectSeller(address _addr)`

- **Description:** Rejects a seller.
- **Parameters:**
  - `_addr`: Address of the seller.

### `registerLand(uint _LandId, address, string memory _Area, string memory _City, string memory _State, uint _LandPrice, uint _PropertyId)`

- **Description:** Registers a land property.
- **Parameters:**
  - `_LandId`: Unique identifier for the land property.
  - `_Area`: Area of the land.
  - `_City`: City where the land is located.
  - `_State`: State where the land is located.
  - `_LandPrice`: Price of the land.
  - `_PropertyId`: Unique identifier for the land property.

### `VerifyingLand(uint _LandId)`

- **Description:** Verifies a land property.
- **Parameters:**
  - `_LandId`: Unique identifier for the land property.

### `RejectLand(uint _LandId)`

- **Description:** Rejects a land property.
- **Parameters:**
  - `_LandId`: Unique identifier for the land property.

### `updateSeller(address _addr, string memory _Name, uint _Age, string memory _City, uint _Cnic, string memory _Email)`

- **Description:** Updates seller information.
- **Parameters:**
  - `_addr`: Address of the seller.
  - `_Name`: Name of the seller.
  - `_Age`: Age of the seller.
  - `_City`: City of residence of the seller.
  - `_Cnic`: National identification number of the seller.
  - `_Email`: Email address of the seller.

### `getLandOwnerById(uint _id)`

- **Description:** Retrieves the owner of a land property by its unique identifier.
- **Parameters:**
  - `_id`: Unique identifier for the land property.
- **Returns:** Address of the landowner.

### `RegisterBuyer(address _key, string memory _Name, uint _Age, string memory _City, uint _Cnic, string memory _Email)`

- **Description:** Registers a buyer.
- **Parameters:**
  - `_key`: Address of the buyer.
  - `_Name`: Name of the buyer.
  - `_Age`: Age of the buyer.
  - `_City`: City of residence of the buyer.
  - `_Cnic`: National identification number of the buyer.
  - `_Email`: Email address of the buyer.

### `BuyerVerified(address _addr)`

- **Description:** Verifies a buyer.
- **Parameters:**
  - `_addr`: Address of the buyer.

### `BuyerReject(address _addr)`

- **Description:** Rejects a buyer.
- **Parameters:**
  - `_addr`: Address of the buyer.

### `UpdateBuyer(address _addr, string memory _Name, uint _Age, string memory _City, uint _Cnic, string memory _Email)`

- **Description:** Updates buyer information.
- **Parameters:**
  - `_addr`: Address of the buyer.
  - `_Name`: Name of the buyer.
  - `_Age`: Age of the buyer.
  - `_City`: City of residence of the buyer.
  - `_Cnic`: National identification number of the buyer.
  - `_Email`: Email address of the buyer.

### `GetCurrentOwner(uint _LandId)`

- **Description:** Retrieves the current owner of a land property by its unique identifier.
- **Parameters:**
  - `_LandId`: Unique identifier for the land property.
- **Returns:** Address of the current landowner.

### `GetLandCity(uint _LandId)`

- **Description:** Retrieves the city where a land property is located.
- **Parameters:**
  - `_LandId`: Unique identifier for the land property.
- **Returns:** City of the land.

### `GetLandPrice(uint _LandId)`

- **Description:** Retrieves the price of a land property.
- **Parameters:**
  - `_LandId`: Unique identifier for the land property.
- **Returns:** Price of the land.

### `GetLandArea(uint _LandId)`

- **Description:** Retrieves the area of a land property.
- **Parameters:**
  - `_LandId`: Unique identifier for the land property.
- **Returns:** Area of the land.

### `BuyLand(uint _LandId)`

- **Description:** Allows a buyer to purchase a land property.
- **Parameters:**
  - `_LandId`: Unique identifier for the land property.
- **Requires:**
  - Buyer must be verified.
  - Land property must be verified.
- **Effects:**
  - Transfers ownership of the land property to the buyer.
  - Transfers the payment to the seller.

## Usage

This smart contract provides a decentralized land registry system with features for registering land, buyers, sellers, and land inspectors. It also includes verification mechanisms for buyers and sellers, allowing for secure land transactions.

## Contributors

- [Your Name]
- [Your Email]

For questions or issues, please contact [Your Email].
