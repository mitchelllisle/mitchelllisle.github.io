## 🧟 Monstermash: A Simple CLI Tool for Data Encryption

### Introduction

In today's digital landscape, data privacy is a growing concern. While there are many tools available for data encryption,
Monstermash offers a straightforward command-line interface (CLI) solution for those who prefer simplicity. 
Let's explore its basic functionalities: encrypting and decrypting data.

To read more about Monstermash and install it, see my GitHub profile [here](https://github.com/mitchelllisle/monstermash)

`pip install monstermash`

### Getting Started: Generating Keys

Before Alice and Bob can exchange encrypted messages, they each need a set of keys. Monstermash provides a basic command
to generate these.

For Alice:

```shell
monstermash generate
```

Output:

```text
-----------------
Private Key (Alice's)
a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b2
Public Key (Alice's)
0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
-----------------
```

For Bob:

```shell
monstermash generate
```

Output:

```text
-----------------
Private Key (Bob's)
abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890
Public Key (Bob's)
fedcba0987654321fedcba0987654321fedcba0987654321fedcba0987654321
-----------------
```

### Encrypting Data

Suppose Alice wants to send Bob a line from the song "Monster Mash". She can use her private key and Bob's public key to
encrypt the message.

```shell
monstermash encrypt \
  --private-key a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0c1d2e3f4a5b6c7d8e9f0a1b2 \
  --public-key fedcba0987654321fedcba0987654321fedcba0987654321fedcba0987654321 \
  --data "They did the mash, they did the Monster Mash!"
```

Output:

```text
Encrypted Data: 0123abcd4567ef890123abcd4567ef890123abcd4567ef890123abcd4567ef89
```

### Decrypting Data

Upon receiving the encrypted message, Bob can decrypt it using his private key.

```shell
monstermash decrypt \
  --private-key abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890 \
  --data 0123abcd4567ef890123abcd4567ef890123abcd4567ef890123abcd4567ef89
```

Output:

```text
Decrypted Data: They did the mash, they did the Monster Mash!
```

### Conclusion

Monstermash is a simple CLI tool designed for basic encryption tasks. It doesn't claim to revolutionize the encryption 
landscape but offers a simple solution for those familiar with the command line. If you're looking for a no-frills way 
to encrypt and decrypt data, Monstermash might be worth a try.