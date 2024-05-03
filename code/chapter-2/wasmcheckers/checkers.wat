(module
    ;; Memory
    (memory $mem 1
    )

    ;; Global Variables
    (global $BLACK i32 (i32.const 1))
    (global $WHITE i32 (i32.const 2))
    (global $CROWN i32 (i32.const 4))

    ;; Function to get index for Position in 8 x 8 checkers board :: formula index = x + 8y
    (func $indexForPosition (param $x i32) (param $y i32) (result i32)
        (i32.add 
            (local.get $x)
            (i32.mul 
                (local.get $y)
                (i32.const  8)
            )
        )
    )
    ;; Function to get offset for Position in 8 x 8 checkers board formula  :: formula offset = (x + 8y) * 4 as i32 size is 4 bytes
    (func $offsetForPosition (param $x i32) (param $y i32) (result i32)
        (i32.mul 
            (i32.const 4)
            (call $indexForPosition (local.get $x) (local.get $y)
            )
        )
    )

    ;; Determine if a piece has been crowned
    (func $isCrowned (param $piece i32) (result i32)
        (i32.eq 
            (global.get $CROWN)
            (i32.and
                (local.get $piece)
                (global.get $CROWN)
            )
        )
    )

    ;; Determine if a piece has been White
    (func $isWhite (param $piece i32) (result i32)
        (i32.eq 
            (global.get $WHITE)
            (i32.and 
                (local.get $piece) 
                (global.get $WHITE)
            )
        )
    )

    ;; Determine if a piece has been Black
    (func $isWhite (param $piece i32) (result i32)
        (i32.eq 
            (global.get $BLACK)
            (i32.and 
                (local.get $piece)
                (global.get $BLACK)
            )
        )
    )

    ;; Add Crown to a given piece (no mutation)
    (func $withCrown (param $piece i32) (result i32)
        (i32.or 
            (local.get $piece)
            (global.get $CROWN)
        )
    )

    ;; Removes a crown from a given piece (no mutation)
    (func $withoutCrown (param $piece i32) (result i32)
        (i32.and 
            (get_local $piece) 
            (i32.const 3)
        )
    )

    ;; Sets a piece on the board.
    (func $setPiece (param $x i32) (param $y i32) (param $piece i32)
        (i32.store 
            (call $offsetForPosition 
                (local.get $x)
                (local.get $y)
            )
            (local.get $piece)
        )
    )

    ;; Gets a piece from the board. Out of range causes a trap
    (func $getPiece (param $x i32) (param $y i32) (result i32)
        
    )
)