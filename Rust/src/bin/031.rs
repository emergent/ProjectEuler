/// Problem 31 - Project Euler
/// http://projecteuler.net/index.php?section=problems&id=31

fn main() {
    let lim = 200 + 1;
    /*
    let mut pat = 0;
    for a in (0..lim).step_by(100) {
        for b in (0..(lim-a)).step_by(50) {
            for c in (0..(lim-(a+b))).step_by(20) {
                for d in (0..(lim-(a+b+c))).step_by(10) {
                    for e in (0..(lim-(a+b+c+d))).step_by(5) {
                        for _ in (0..(lim-(a+b+c+d+e))).step_by(2) {
                            pat += 1; }}}}}}
     */
    let pat = (0..lim).step_by(100).map(|a|
                (0..(lim-a)).step_by(50).map(|b|
                    (0..(lim-(a+b))).step_by(20).map(|c|
                        (0..(lim-(a+b+c))).step_by(10).map(|d|
                            (0..(lim-(a+b+c+d))).step_by(5).map(|e|
                                (0..(lim-(a+b+c+d+e))).step_by(2).count()
                            ).fold(0,|s,x| s+x)
                        ).fold(0,|s,x| s+x)
                    ).fold(0,|s,x| s+x)
                ).fold(0,|s,x| s+x)
            ).fold(0,|s,x| s+x);
    println!("{}", pat + 1);
}
