# Commands
```
rustc src/main.rs --target wasm32-wasi

wasmtime --invoke add_one main.wasm 22 
```