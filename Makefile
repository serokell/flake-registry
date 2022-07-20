update-haskell-nix:
	nix registry pin --registry ./flake-registry.json haskell-nix github:input-output-hk/haskell.nix
	git diff ./flake-registry.json
