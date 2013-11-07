---
title: My Experience Making a Game
date: 2013-10-21
tags:
    - blog
ignore: true
---
In this post I'm gonna be going over my personal experience while making a game
using Clojure as the language and using an [ECS structure][1] for the code.

This will not be a "Hey I made Pong!" post. This is a real game that I will
develop and eventually (hopefully) make a profit from.

Some things to make clear. I did not know I was going to use Clojure for the
language or use an ECS structure for the code. This is what I arrived at after
lots of thinking and research.

I'm hoping this post will be of useful insight to those that are considering
making game, especially if they're making it using Clojure or the ECS
structure.

## Deciding on the language

Of course I didn't wake up and go "Clojure is the way to go." It was several
weeks of me considering all the options that I considered fit for my needs.

The languages I considered were Go, C, C++, Common Lisp, JavaScript, Python and
a couple of others I think.

So why did I choose Clojure? Several reasons but the most obvious are:

- It's Lisp. Can't argue with that.
- It compiles into JVM bytecode.
- Rich Hickey is smart.

Let's look at the second point.

### It compiles into JVM bytecode

So why is this a selling point?

It means my code is automatically cross platform (as long as the user has Java
installed on his computer).

It also means that I have access to all the libraries Java has.

Both of these reasons are big deciding factors. Write my code once with a huge
amount of libraries I can use if I wish.

Oh and I also have access to any help users have requested in the past for
Java.

## Deciding on the architecture

Once I decided I had to choose between OOP and ECS. This really wasn't really
a hard decision.

I just had to understand how both worked pros and cons and stuff. However for
me the pros are much better for ECS.

This really came to me listening to my gut. This wasn't a *really* logical
decision besides "go with it, you think better with it".

And so far it's been working pretty well. Onto more exciting stuff!

## Learning Clojure

Yes, I decided I wanted to use Clojure before being able to speak in it, deal
with it.

This wasn't a bad experience. I'm familiar with the concept of lists and I like
it. I'm not uncomfortable with parentheses and brackets either.

I'm also a fast learner so I can learn from guessing the code I'm reading, as
long as I know the language basics.

I used [Tim Robinson's Clojure tutorial for beginners][2] in order to learn how
to read and write Clojure.

[1]: https://en.wikipedia.org/wiki/Entity_component_system
[2]: http://blackstag.com/blog.posting?id=5
