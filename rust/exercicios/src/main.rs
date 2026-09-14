use std::io::stdin;

fn media_aritmetica(numbers: Vec<u32>) -> f32{
    let mut sum = 0;

    for i in &numbers{
        sum += i;
    }

    sum as f32 / numbers.len() as f32
}

fn trocar_valores(a: &mut u8, b: &mut u8) {
    (*a, *b) = (*b, *a)

}

fn main() {
    //let mut a = String::new();
    //let mut b = String::new();

    //println!("Digite o primeiro valor");
    //stdin().read_line(&mut a).expect("error");
    //let mut a_numero: u8 = a.trim().parse().unwrap();

    //println!("Digite o segundo valor");
    //stdin().read_line(&mut b).expect("error");
    //let mut b_numero: u8 = b.trim().parse().unwrap();

    //println!("a é {}", a_numero);
    //println!("b é {}", b_numero);

    //trocar_valores(&mut a_numero, &mut b_numero);

    //println!("a é {}", a_numero);
    //println!("b é {}", b_numero);

    let mut var = String::new();
    let mut numbers: Vec::<u32> = Vec::new();
    let mut valores = String::new();

    println!("Quantos valores vão ser inseridos?");
    stdin().read_line(&mut valores).expect("error");
    let val_inseridos: u32 = valores.trim().parse().unwrap();

    for i in 0..val_inseridos{
        println!("insira um valor");
        stdin().read_line(&mut var).expect("error");
        let var_inserido: u32 = var.trim().parse().unwrap();
        numbers.push(var_inserido);
        var.clear()
    }

    println!("{}", media_aritmetica(numbers));

}
