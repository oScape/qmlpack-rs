use std::process::Command;
use std::io::{Write};
use std::fs::File;

fn main() {
    let output = Command::new("./bin/qml-parser")
        .arg("./sandbox/new.qml")
        .output()
        .expect("bin command failed to start");

    File::create("./sandbox/data.json")
        .expect("Impossible to create json file")
        .write(&output.stdout)
        .expect("Impossible to write in the file");
}