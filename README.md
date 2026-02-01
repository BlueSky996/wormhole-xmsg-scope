# Wormhole Cross-Chain Messaging Scope

## Overview

This project is a minimal, production-style scope demonstrating **Wormhole cross-chain messaging** using real guardian verification. It shows how a message can be published on one chain, verified by Wormhole guardians, and securely consumed on another chain.

The goal of this repository is not to build a full application, but to provide a **clear, verifiable, end-to-end working example** of Wormhole core messaging using Foundry.

---

## What This Project Proves

* A message is published on **Ethereum Sepolia** using the Wormhole Core contract
* Wormhole guardians observe and sign the message
* A signed **VAA (Verified Action Approval)** is fetched off-chain
* The VAA is submitted to **Base Sepolia**
* The target contract verifies the VAA **on-chain** using `parseAndVerifyVM`
* The payload is accepted only if guardian verification succeeds

This confirms that the cross-chain message flow is real, secure, and end-to-end.

---

## Architecture

### Source Chain (Ethereum Sepolia)

* `SourceMessenger.sol`
* Publishes a message via `IWormhole.publishMessage`
* Emits a Wormhole message that guardians can observe

### Off-chain (Wormhole SDK)

* Fetches the signed VAA from Wormhole guardians
* Parses and extracts the verified payload
* Acts as the bridge between chains

### Target Chain (Base Sepolia)

* `TargetMessenger.sol`
* Receives the encoded VAA
* Calls `parseAndVerifyVM` on the Wormhole Core contract
* Accepts the payload only if guardian verification succeeds

---

## Contracts

### SourceMessenger

* Publishes cross-chain messages
* Uses the Wormhole Core contract directly
* Does not trust off-chain input

### TargetMessenger

* Verifies guardian signatures on-chain
* Rejects invalid or unverified messages
* Stores the verified payload as state

---

## Tooling

* Solidity ^0.8.20
* Foundry (forge, cast)
* Wormhole SDK (JavaScript)
* Ethereum Sepolia (source chain)
* Base Sepolia (target chain)

---

## Message Flow

### 1. Publish Message (Source Chain)

* Message is sent using `SourceMessenger.sendMessage`
* Wormhole Core emits a message event

### 2. Guardian Signing

* Wormhole guardians observe the event
* Guardians sign the message
* A VAA is produced

### 3. Fetch VAA (Off-chain)

* Wormhole SDK fetches the signed VAA
* Payload is parsed and extracted

### 4. Verify and Consume (Target Chain)

* VAA is submitted to `TargetMessenger`
* Contract calls `parseAndVerifyVM`
* If valid, payload is accepted and stored

---

## Verification and Proof

This project proves correctness by:

* Successful message publication on Ethereum Sepolia
* Successful VAA retrieval from Wormhole guardians
* Successful on-chain verification on Base Sepolia
* State change on the target contract (`lastMessage`)

If the transaction on Base Sepolia does not revert, the message is verified and accepted.

---

## Scope Notes

* This is a **scope / reference implementation**, not a full application
* Relayer logic is intentionally omitted
* Replay protection and emitter checks can be added as extensions
* Frontend integration is planned separately

---



## This repository demonstrates:

* Real cross-chain messaging
* Real guardian verification
* Correct Wormhole Core usage
* Production-aligned architecture

It is suitable as:

* A learning reference
* A portfolio project
* A base for more advanced Wormhole integrations

---

## License

MIT
