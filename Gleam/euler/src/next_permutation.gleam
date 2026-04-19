import gleam/list
import gleam/result

pub fn next_permutation(xs: List(Int)) -> Result(List(Int), Nil) {
  use pivot_index <- result.try(find_pivot(xs))
  echo pivot_index
  let assert #(left, [pivot, ..right]) = list.split(xs, pivot_index)
  echo left
  echo pivot
  echo right

  let assert #(less, [next, ..greater]) =
    right
    |> list.reverse()
    |> list.split_while(fn(x) { x <= pivot })

  // Ok(list.concat([left, [next], list.reverse(greater), [pivot], less]))
  Ok(list.flatten([left, [next], list.reverse(greater), [pivot], less]))
}

fn find_pivot(xs: List(Int)) -> Result(Int, Nil) {
  echo xs
  use tail <- result.try(
    xs
    |> list.rest()
    |> echo,
  )

  let pivot =
    xs
    |> list.zip(tail)
    |> echo
    |> list.index_map(fn(x, i) { #(i, x) })
    |> echo
    |> list.reverse()
    |> echo
    |> list.drop_while(fn(x) {
      let #(_, #(f, s)) = x
      f > s
    })
    |> echo
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
  //|> echo

  [1, 2, 3]
  |> list.permutations()
  |> echo

  [2, 1, 3]
  |> list.permutations()
  |> echo

  [3, 1, 2]
  |> list.permutations()
  |> echo
}
