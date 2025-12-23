# Spell Checker

---

## Library Information

This library provides **spell-checking enabled DataFlex UI controls** that extend the standard:

- `cTextEdit`
- `cDbTextEdit`

Spell checking is implemented via a lightweight **Windows DLL wrapper** that uses the native Windows Spell Checking API (`ISpellCheckerFactory`).  
No dictionaries are bundled; spelling behaviour and language support are provided by the underlying Windows installation.

This approach provides:
- Native Windows spelling behaviour
- OS-managed language support
- No third-party dictionary dependencies
- Minimal runtime overhead

---

## General Information

| Product  | Version           |
| -------- | ----------------- |
| DataFlex | 23.0, 24.0, 25.0  |

**Platform**
- Windows only
- 32-bit and 64-bit supported (matching application architecture)

---

## Architecture (32-bit / 64-bit)

The wrapper DLL **must match the application architecture**:

| Application Type | DLL Location |
| ---------------- | ------------ |
| 32-bit EXE       | `Bin\SpellCheckWrapper.dll` |
| 64-bit EXE       | `Bin64\SpellCheckWrapper.dll` |

For deployment or testing, **copy the appropriate DLL to the same folder as your application EXE**.

## Contributors

This project was developed with collaboration and input from members of the DataFlex community.  
See [CONTRIBUTORS.md](CONTRIBUTORS.md) for details.

## Licence

This project is distributed under the terms of the included licence file.

The wrapper DLL interfaces with the Windows Spell Checking API and does not bundle or redistribute Microsoft dictionaries.
