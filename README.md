# 08-tokengate - Base Native Architecture

> **Built for the Base Superchain & Stacks Bitcoin L2**

This project is architected to be **Base-native**: prioritizing onchain identity, low-latency interactions, and indexer-friendly data structures.

## 🔵 Base Native Features
- **Smart Account Ready**: Compatible with ERC-4337 patterns.
- **Identity Integrated**: Designed to resolve Basenames and store social metadata.
- **Gas Optimized**: Uses custom errors and batched call patterns for L2 efficiency.
- **Indexer Friendly**: Emits rich, indexed events for Subgraph data availability.

## 🟠 Stacks Integration
- **Bitcoin Security**: Leverages Proof-of-Transfer (PoX) via Clarity contracts.
- **Post-Condition Security**: Strict asset movement checks.

---
# TokenGate

Access control registry with credential verification on Base and Stacks.

## Features

- Grant time-based access
- Revoke access
- Credential verification
- Expiration tracking

## Contract Functions

### Base (Solidity)
- `grantAccess(user, duration, credential)` - Grant access
- `revokeAccess(user)` - Revoke access
- `hasAccess(user)` - Check access status
- `getAccess(user)` - Get access details

### Stacks (Clarity)
- `grant-access` - Grant time-based access
- `revoke-access` - Revoke access
- `has-access` - Verify access
- `get-access` - Get access info

## Quick Start

```bash
pnpm install
pnpm dev
```

## Deploy

```bash
pnpm deploy:base
pnpm deploy:stacks
```

## License

MIT
