arr_of_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

numbers_impars = []
numbers_pars = []


def main():
    for number in arr_of_numbers:
        if number % 2 == 0:
            numbers_pars.append(number)
        else:
            numbers_impars.append(number)

    print(numbers_pars)
    print(numbers_impars)

if __name__ == "__main__":
    main()
