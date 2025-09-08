## Start an pyhton local server 
````Bash
python3 -m http.server 3000;
``````
This just start an simple http server from the directory you're in

## More advanced server
````Bash
pushd &lt;filename>.html;  python3 -m http.server 9999; popd;
``````

`pushd <filename>.html` is a command that is used to store the current working directory on the top of the directory stack and change to the directory specified by `<filename>.html`. This is often used in conjunction with the `popd` command, which is used to change back to the directory that was previously stored on the top of the stack.

`python3 -m http.server 9999` is a command that can be used to start a simple HTTP server using Python's built-in `http.server` module. When run, this command will start a server that listens on port 9999 and serves content from the current directory.

Together, the `pushd <filename>.html; python3 -m http.server 9999; popd;` command would change to the specified directory, start an HTTP server on port 9999, and then change back to the previous working directory. This could be useful for quickly starting a local server to test a specific website or web application without having to manually navigate to the directory where the files are located.