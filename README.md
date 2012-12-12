# Mojikun

A Brainfuck based on Emoji.

Instructions:

👉  Move the pointer to the right  
👈  Move the pointer to the left  
👍  Increment the memory cell under the pointer  
👎  Decrement the memory cell under the pointer  
💻  Output the character signified by the cell at the pointer  
💾  Input a character and store it in the cell at the pointer  
🔃  Jump past the matching 🔙 if the cell under the pointer is 0  
🔙  Jump back to the matching 🔃 if the cell under the pointer is nonzero  

## Installation

Add this line to your application's Gemfile:

    gem 'mojikun'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mojikun

## Usage

A `mojikun` binary is provided to let you run programs. There is an examples
directory which has some examples. Use `mojikun` like any other interpreter:

```
mojikun examples/hello.moji
```

`.moji` is the preferred file ending for Mojikun.

## Structure

While Mojikun is a simple language that could be interpreted in a 40ish line
script, I wanted to make it more like a 'real langauge' that would have all
of the parts and design that a more full one has. I may use this foundation
later to build more complex things.

We can see these parts in motion by examining the binary:

```ruby
$ cat bin/mojikun 
#!/usr/bin/env ruby

require 'mojikun'

source_code = ARGF.read.chomp

tokens = Mojikun::Lexer.new(source_code).call

ast = Mojikun::Parser.new(tokens).call

runtime = Mojikun::Runtime.new
interpreter = Mojikun::Interpreter.new(runtime)

interpreter.evaluate(ast)
```

We have a Lexer, Parser, Runtime, and Interpreter. The Lexer turns the stream
of input into a series of tokens. The Parser takes those tokens and turns them
into an AST, which is more of a list than a tree, really. We generate a new
Rumtime, which has all of the internal state we need to make the language work:
the data array, the program counter, etc. Then, the Interpreter takes that
AST and evaluates it in the context of the Runtime.

Pretty simple!

## Testing

Mojikun is fully tested with MiniTest. I actually wrote it in a TDD fashion.
To run the tests, simply

```
$ rake test
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
