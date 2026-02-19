# Schema validation

We can use **AJV** (Another JSON Schema Validator) to validate the JSON schemas in this directory.

## Installation

```bash
npm install ajv
```

## Running

There's a small script that checks the top-level JSON schema (currently `lofar-common-metadata.json`), using **AJV**. It can simply be invoked with

```bash
./validate.sh
```
