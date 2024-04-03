# Commands
```
1. wat2wasm add1.wat -o add.wasm
2. wat2wasm add2.wat -o add_sexpr.wasm
3. wasm-objdump add.wasm -x
4. wasm-objdump add_sexpr.wasm -x
5. wasm2wat add_sexpr.wasm -o roundtrip.wat
6. wasmtime --invoke add add.wasm 22 30
7. wasmtime --invoke add add_sexpr.wasm 22 30
```