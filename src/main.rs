use serde_json::error::Error as SerdeError;
use serde_json::{from_str, Error, Value};
use std::process::Command;
use std::string::FromUtf8Error;

#[derive(Debug)]
enum MyError {
    Utf8Error(FromUtf8Error),
    JsonError(SerdeError),
}

impl From<FromUtf8Error> for MyError {
    fn from(err: FromUtf8Error) -> Self {
        MyError::Utf8Error(err)
    }
}

impl From<SerdeError> for MyError {
    fn from(err: SerdeError) -> Self {
        MyError::JsonError(err)
    }
}

fn main() -> Result<(), MyError> {
    let output = Command::new("./bin/qml-parser")
        .arg("./sandbox/1/new.qml")
        .output()
        .expect("bin command failed to start");

    let json_result = untyped_json(String::from_utf8(output.stdout)?)?;

    println!("Json: \n {:#}", json_result);

    Ok(())
}

fn untyped_json(output: String) -> Result<Value, Error> {
    let v = from_str(&output)?;
    Ok(v)
}
