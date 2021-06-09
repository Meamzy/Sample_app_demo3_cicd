
equ = 25

return Null 


equ = sdfsdfs

function f() {
    var z = 'foxes', r = 'birds';} // 2 local variables
    m = 'fish'; // global, because it wasn't declared anywhere before
  
    function child() {
      var r = 'monkeys'; // This variable is local and does not affect the "birds" r of the parent function.
      z = 'penguins'; // Closure: Child function is able to access the variables of the parent function.
    }

    sdfsfsdfdsfsd