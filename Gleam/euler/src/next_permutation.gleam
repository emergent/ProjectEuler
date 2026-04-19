import gleam/io
import gleam/list
import gleam/result

pub fn next_permutation(xs: List(Int)) -> Result(List(Int), Nil) {
  use pivot_index <- result.try(find_pivot(xs))
  io.debug(pivot_index)
  let assert #(left, [pivot, ..right]) = list.split(xs, pivot_index)
  io.debug(left)
  io.debug(pivot)
  io.debug(right)

  let assert #(less, [next, ..greater]) =
    right
    |> list.reverse()
    |> list.split_while(fn(x) { x <= pivot })

  Ok(list.concat([left, [next], list.reverse(greater), [pivot], less]))
}

fn find_pivot(xs: List(Int)) -> Result(Int, Nil) {
  io.debug(xs)
  use tail <- result.try(
    xs
    |> list.rest()
    |> io.debug(),
  )

  let pivot =
    xs
    |> list.zip(tail)
    |> io.debug()
    |> list.index_map(fn(x, i) { #(i, x) })
    |> io.debug()
    |> list.reverse()
    |> io.debug()
    |> list.drop_while(fn(x) {
      let #(_, #(f, s)) = x
      f > s
    })
    |> io.debug()
    |> list.first()

  case pivot {
    Ok(#(x, _)) -> Ok(x)
    _ -> Error(Nil)
  }
}

pub fn main() {
  //let xs = [1, 2, 3]
  //let xs = [1, 3, 2]
  //xs
  //|> next_permutation()
  //|> io.debug()

  [1, 2, 3]
  |> list.permutations()
  |> io.debug()

  [2, 1, 3]
  |> list.permutations()
  |> io.debug()

  [3, 1, 2]
  |> list.permutations()
  |> io.debug()
}
