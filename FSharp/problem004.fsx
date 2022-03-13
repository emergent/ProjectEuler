// Problem 4 - Project Euler
// http://projecteuler.net/index.php?section=problems&id=4

let isPalindromic x =
    let s = sprintf "%i" x

    [ for i in [ 0 .. (s.Length / 2) ] -> s.Chars(i) = s.Chars(s.Length - i - 1) ]
    |> List.forall (fun x -> x = true)

let maxPalindromic =
    [ for x in [ 100..999 ] -> [ for y in [ 100..x ] -> x * y ] ]
    |> List.concat
    |> List.filter isPalindromic
    |> Seq.max

printfn "%i" maxPalindromic
