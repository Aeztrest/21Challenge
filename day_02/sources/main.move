/// DAY 2: Primitive Types & Simple Functions

module challenge::day_02 {
    #[test_only]
    use std::unit_test::assert_eq;

    // TODO: Write a function called 'sum' that takes two u64 numbers
    // and returns their sum
    public fun sum(a: u64, b: u64): u64 {
        a + b
    }

    // TODO: Write a test function that checks sum(1, 2) == 3
    #[test]
    fun test_sum() {
        assert_eq!(3, sum(1, 2));
    }
}

