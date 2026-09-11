use std::io::stdin;
use std::net::IpAddr;

fn main() {
    loop{
        let mut adress = String::new();

        println!("what is the ip adress that is going to be scanned?");
        stdin().read_line(&mut adress).expect("error");
        let adress_scan = adress.trim().to_string();

        check_ip(adress_scan);
        match check_ip(adress_scan) {
            Some(ip) => scanner(),
            None => println!("invalid ip adress"); Break,
        }

    }
}

fn check_ip(adress_scan:String) -> Option<IpAddr> {
    let ip: Result<IpAddr, _> = adress_scan.parse();
    match ip {
        Ok(ip) => {
            println!("ip adress is valid: {}", ip);
            Some(ip)
        }
        Err(_) => {
            println!("invalid ip adress");
            None
        }
    }

}
fn scanner(){
    
}
