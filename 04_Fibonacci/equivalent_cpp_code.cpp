int main() {

    int n = 8;
    int count = 1;
    int previousFib = 0;
    int lastFib = 1;

    while (count < n) {
        // calculate the next fibonacci number
        int newFib = previousFib + lastFib;

        // remember the last two values
        previousFib = lastFib;
        lastFib = newFib;

        count++;
    }

    printf("The %d fibonacci number is %d.\n", n, lastFib);

    return 0;
}