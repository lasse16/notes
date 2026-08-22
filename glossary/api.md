---
type: GlossaryEntry
date: 2026-08-22
tags: [ glossary, webdev ]
aliases: ["API"]
---

# Application programming interface (API)

An application programming interface is any boundary that lets one program interact with another, whether through a local library, an operating system, or a remote service over a network.
Web APIs are the most common form today: clients send [[http]] requests to endpoints using methods like GET or POST, and servers reply with data—usually JSON—and an HTTP status code.
REST is a widely used style for designing these interactions around resources and stateless requests, while [[graphql|graphQL]] lets clients query exactly the fields they need in a single request.
Other styles include SOAP, gRPC, and WebSockets; real-world APIs also require authentication, rate limiting, and documentation such as OpenAPI.
