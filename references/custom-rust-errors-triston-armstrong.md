---
date: 2026-06-08
tags: [ website, reference, rust ]
url: https://tristonarmstrong.com/blog/custom-rust-errors
---

# Custom Rust Errors | Triston Armstrong

A blog post about how custom error types in [[rust-lang]] can help [[rust-error-handling]], and especially with the `?` operator.

Instead of boxing each error, the post advocates for a `DomainError` enum, which wraps the actual error types, such that any external consumer only needs to handle the `DomainError`, instead of the actual error type.

Therefore, `Box<dyn std::error::Error>` becomes a `map_err(|e| DomainError(e) )`, and if you include the `impl From` trait for `DomainError`  than you can use the `?` operator to return your `DomainError` directly.

## Example

```rust
// Assume DomainError and DomainError::Io(io::Error) are defined
impl From<io::Error> for DomainError {
    fn from(err: io::Error) -> Self {
        // Direct mapping: External IO error becomes DomainError::Io
        DomainError::Io(err)
    }
}

// Function using the automatic conversion
fn read_data_file(path: &str) -> Result<(), DomainError> {
    // The '?' sees io::Error, checks for 'From' trait, finds it, 
    // and executes the block above, cleaning up the error type instantly.
    std::fs::read_to_string(path)?; 
    Ok(())
}
```

## References

<https://tristonarmstrong.com/blog/custom-rust-errors>
