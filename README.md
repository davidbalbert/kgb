KGB
===

KGB spies on your classes and tells you what methods are being called. I wrote it to let me see what methods were being called on the `socket` library while writing [Eventless](http://github.com/davidbalbert/eventless).

##How it works

Tell KGB what you want it to watch, and it reports back after the program has run:

```ruby
# kgb_test.rb

require 'kgb'

class Winston
  def pretend_to_be_a_sheep
    puts "Big Brother knows best"
  end

  def think_for_yourself!
    puts "Freedom is the freedom to say two plus two equals four"
  end
end

KGB.spy_on(Winston)

winston = Winston.new
winston.pretend_to_be_a_sheep
winston.pretend_to_be_a_sheep
winston.pretend_to_be_a_sheep
winston.think_for_yourself!
winston.pretend_to_be_a_sheep
```

```
$ ruby kgb_test.rb
Big Brother knows best
Big Brother knows best
Big Brother knows best
Freedom is the freedom to say two plus two equals four
Big Brother knows best

Winston:

method                    invocations
pretend_to_be_a_sheep     4
think_for_yourself!       1
```

KGB prints to standard error so you can isolate its output from the rest of the program:

```
$ ruby kgb_test.rb >/dev/null

Winston:

method                    invocations
pretend_to_be_a_sheep     4
think_for_yourself!       1
```

KGB can spy on multiple classes too!

```ruby
KGB.spy_on(Socket, File)
```

##Install

```
$ gem install kgb
```

##Contributing

1. Fork
2. Branch
3. Write code
4. Commit
5. Push
6. Create Pull Request
7. ...
8. Profit!

##License

KGB is licensed under the MIT License. See LICENSE for more information.
