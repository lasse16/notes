---
date: 2026-05-30
tags: [ todo, python, object-oriented-programming ]
---

# [[python]]: Interfaces and protocols

Should you find yourself in the situation to implement some inheritance and object relationships in Python, don't forget these classes from the standard library : [`Protocol`][typing-protocol] and [`ABC`][lib-abc].

These mimick interfaces in other programming languages.
Python does support [[duck-typing]], and as such these are not technically necessary, but any programmer you work with ( including your future self ) will thank you for more explicity.

So, please use the [typing module][typing-module].

## `typing.Protocol`

- implement a baseclass, which inherits from `Protocol` and anything with a method from the baseclass, becomes a valid subtype of the baseclass.
- this is dynamically typed, meaning the moment you call a function which takes a baseclass, typechecking validates that your argument has the necessary function.
- NO Compile-time help, like method generation or anything. You need to know that a `PaymentProcessor` needs a `process_payment` method and with which arguments.

### Example

```python
from typing import Protocol

class PaymentProcessor(Protocol):
    def process_payment(self, amount: float) -> None:
        pass

class StripeProcessor:
    def process_payment(self, amount: float) -> None:
        print(f"Processing ${amount} payment via Stripe.")

class PayPalProcessor:
    def process_payment(self, amount: float) -> None:
        print(f"Processing ${amount} payment via PayPal.")

class CryptoProcessor:
    def process_payment(self, amount: float) -> None:
        print(f"Processing ${amount} payment via Cryptocurrency.")

def handle_payment(processor: PaymentProcessor, amount: float) -> None:
    processor.process_payment(amount)

# Usage
stripe = StripeProcessor()
paypal = PayPalProcessor()
crypto = CryptoProcessor()

handle_payment(stripe, 100.0)  # Output: Processing $100.0 payment via Stripe.
handle_payment(paypal, 200.0)  # Output: Processing $200.0 payment via PayPal.
handle_payment(crypto, 300.0)  # Output: Processing $300.0 payment via Cryptocurrency.
```

## `ABC`

- must be inherited and use the `@abstractmethod` decorator

## References

- [typing-module]
- <https://medium.com/@kandemirozenc/understanding-interfaces-abc-protocol-and-duck-typing-in-python-866ca32ab2a0>

[typing-module]: <https://typing.python.org/en/latest/index.html>
[typing-protocol]: <https://typing.python.org/en/latest/spec/protocol.html>
[lib-abc]: <https://docs.python.org/3/library/abc.html>
