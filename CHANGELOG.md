#### API Changes

Server#ticket now takes an arguments hash instead of order arguments.

Replace:
  server.ticket user, service, domain
With:
  server.ticket user: user, service: service, domain: domain

This allows us to introduce nounce as an option without introducing a
fourth argument.

<a name="0.2.2"></a>
### 0.2.2 (2017-01-13)


#### Features

* Check ticket expiry and raise if expired	 ([b0d1bf5](/../commit/b0d1bf5))


<a name="0.2.2"></a>
### 0.2.1 (2017-01-13)


#### Bug Fixes

* fix homepage url in gemspec	 ([0439785f](/../commit/0439785f))

<a name="0.2.0"></a>
### 0.2.0 (2017-01-13)


#### Features

* Raise error on ticket version mismatch	 ([49a3cb7](/../commit/49a3cb7))
* Verify correct service in tickets	 ([379921c](/../commit/379921c))


#### Bug Fixes

* require rbnacl in server	 ([009e84a](/../commit/009e84a))


<a name="0.1.0"></a>
### 0.1.0 (2017-01-13)

Initial release with basic functionality. Lacking some checks and validations
