#include <gtest/gtest.h>
#include "../math_operations.h"

// Test case for adding two positive numbers
TEST(MathOperationsTest, AddPositiveNumbers) {
    EXPECT_EQ(add(2, 3), 5);
    EXPECT_EQ(add(10, 20), 30);
    EXPECT_EQ(add(100, 200), 300);
}

// Test case for adding two negative numbers
TEST(MathOperationsTest, AddNegativeNumbers) {
    EXPECT_EQ(add(-2, -3), -5);
    EXPECT_EQ(add(-10, -20), -30);
}

// Test case for adding positive and negative numbers
TEST(MathOperationsTest, AddMixedNumbers) {
    EXPECT_EQ(add(5, -3), 2);
    EXPECT_EQ(add(-5, 3), -2);
    EXPECT_EQ(add(10, -10), 0);
}

// Test case for adding zero
TEST(MathOperationsTest, AddWithZero) {
    EXPECT_EQ(add(0, 0), 0);
    EXPECT_EQ(add(5, 0), 5);
    EXPECT_EQ(add(0, 5), 5);
}

// Test case for adding large numbers
TEST(MathOperationsTest, AddLargeNumbers) {
    EXPECT_EQ(add(1000000, 2000000), 3000000);
    EXPECT_EQ(add(2147483647, 0), 2147483647); // Max int value
}

// Main function to run all tests
int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
