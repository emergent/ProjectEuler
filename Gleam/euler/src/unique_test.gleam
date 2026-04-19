import gleam/list

pub fn main() {
  let x = [1, 2, 3, 4, 5, 1, 1, 1, 1, 3, 2, 3, 4, 3, 4]
  x
  |> list.unique()
  |> echo

  [[1, 2, 3, 4, 5], [2, 3, 4, 5, 1]]
  |> list.flatten()
  |> list.unique()
  |> echo
}
