def main():
    # Reviewing Python

    variable_simple = "Hello, world"
    print(variable_simple)

    DEFINE_A_CONSTANT = 3.14
    print(DEFINE_A_CONSTANT)

    # Types primitives
    my_string_in_python: str = "A variable with type defination."
    print(my_string_in_python)

    my_number_in_pyhon: int = "A variable with type defination."
    print(my_number_in_pyhon)

    my_float_in_python: float = "A variable with type defination."
    print(my_float_in_python)

    my_bool_in_python: bool = True
    print(my_bool_in_python)

    my_operator_ari = 2 * 2 + 2 - 2 / 2 // 2**2 % 2
    print(my_operator_ari)

    my_operator_compare = 2 > 2 or 2 >= 2 or 2 <= 2 or 2 == 2 and 2 != 2
    print(my_operator_compare)

    # Control Flow

    if 2 > 2:
        print(False)
    elif 2 == 2:
        print(True)
    else:
        print(True)

    for index in range(0, 10):
        if index == 5:
            continue
        else:
            print(index)
            break

    my_list_in_python = [1, 2, 3, 4, 5]
    print(my_list_in_python)

    my_tuple_in_python = (0, 1, 2)
    print(my_tuple_in_python)

    my_dict_in_python = {
        "review": True,
        "is_control": False,
        "description": "Lorem impsu dolor do re mi fa",
    }
    print(my_dict_in_python)
    print(my_dict_in_python.get("review"))

    my_set_in_python = set((1, 2, 3, 2, 2, 4))
    print(my_set_in_python)

    define_my_fun()
    sum(1, 3)
    sum(2, 2)


def define_my_fun():
    print(".exe")


def sum(number_one: int, number_two: int) -> int:
    return number_one + number_two


if __name__ == "__main__":
    main()
