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
mokikun examples/hello.moji
```

`.moji` is the preferred file ending for Mojikun.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
