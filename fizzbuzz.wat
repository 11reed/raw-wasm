(module
  (import "env" "print_i32" (func $print_i32 (param i32)))
  (import "env" "print_fizz" (func $print_fizz))
  (import "env" "print_buzz" (func $print_buzz))
  (import "env" "print_fizzbuzz" (func $print_fizzbuzz))
  
  (func $fizzbuzz (param $n i32)
    (local $mod3 i32)
    (local $mod5 i32)
    
    local.get $n
    i32.const 3
    i32.rem_s
    local.set $mod3
    
    local.get $n
    i32.const 5
    i32.rem_s
    local.set $mod5
    
    local.get $mod3
    i32.const 0
    i32.eq
    local.get $mod5
    i32.const 0
    i32.eq
    i32.and
    if
      call $print_fizzbuzz
    else
      local.get $mod3
      i32.const 0
      i32.eq
      if
        call $print_fizz
      else
        local.get $mod5
        i32.const 0
        i32.eq
        if
          call $print_buzz
        else
          local.get $n
          call $print_i32
        end
      end
    end
  )
  
  (func (export "run_fizzbuzz")
    (local $i i32)
    (local.set $i (i32.const 1))
    block
      loop
        local.get $i
        call $fizzbuzz
        local.get $i
        i32.const 1
        i32.add
        local.tee $i
        i32.const 100
        i32.le_s
        br_if 1
        br 0
      end
    end
  )
)
