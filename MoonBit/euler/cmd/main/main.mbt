///|
/// Default entry point for the first Project Euler problem.
/// Run specific problems with `moon run cmd/p0001`, `moon run cmd/p0002`, etc.
fn main {
  println(@euler.render_answer(1, @euler.problem_0001().to_string()))
}
