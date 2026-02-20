# Tools

## [AJV](https://ajv.js.org/)

**AJV** (Another JSON Schema Validator) can be used to validate JSON Schemas. The best way to do so it to compile your schema. This will trigger any warning or error in your schema or in one of the schemas that your schema references (by using `$ref`).

### Install

    npm install -g ajv-cli

### Example usage

    ajv compile -s <source> [-r <requirement>] -spec=draft2020 --validate-formats=false

Every `$ref` in your `<source>` needs to be specified as `<requirement>`, because AJV will not resolve by itself. Since AJV cannot validate formats like `date-time`, it is best to disable validation of `format` fields.

## [JSON Schema](https://github.com/sourcemeta/jsonschema)

**JSON Schema** by Sourcemeta can be used for formatting and linting your JSON Schemas. It can also validate your schema, but it is much less strict than **AJV**.

### Install

    pip install sourcemeta_jsonschema

### Example usages

#### Formatting

To properly format your JSON Schema:

    jsonschema fmt <source>
    
#### Linting

To lint your JSON Schema:

    jsonschema lint <source>

Note that the linter is quite picky. You may want to ignore some reported issues.

#### Bundling

When you bundle your JSON Schema you embed all the schemas that you reference to (using `$ref`) as `$defs` in a new schema. This is ideal in situations where you do not want to follow a long chain of references.

    jsonschema bundle <source> [-r <requirement>]

You need to add `-r <requirement>` for every reference in your JSON Schema, because `jsonschema` will not resolve them.
