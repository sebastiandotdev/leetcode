fn main() {
    let x = 5;
    let y = 10;

    let message = String::from("Hello");

    println!("The value of x is: {}", x);
    println!("The value of y is: {}", y);

    send(&message);
}

fn send(message: &str) {
    println!("Sending message: {}", message);
}
