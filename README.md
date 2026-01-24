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
