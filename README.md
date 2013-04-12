# Endertromb

`Endertromb` is a [Minecraft](http://minecraft.net) mod that gives you an in-game [Ruby](http://ruby-lang.org) prompt. It allows you to conjure and control the various entities and blocks in the Minecraft world. For example, `pig = Pig.new` spawns a pig right before your eyes, and then `pig.jump` makes it jump.

"Endertromb" is the name of a planet that runs on Ruby, from [Why's (Poignant) Guide to Ruby](http://mislav.uniqpath.com/poignant-guide). On this planet, the flowers, apple blossoms, and sky are all low-resolution projections. The planet has both wish-granting and mind-reading capabilities, and the heroes of the story use Ruby to put these two things together, which allows them to conjure a floating whale to pursue The Originals back to Earth. So yeah, it's a perfectly appropriate name for this project.

And in the spirit of Why, this project's main goal is education. There are a lot of possibilities here:

* In-game lessons, à la [Try Ruby](http://tryruby.org) (but with much more exciting output)
* A game or map in Minecraft where you have to using programming skills to solve problems or just to help along the way (à la [CodeSpells](https://sites.google.com/a/eng.ucsd.edu/codespells))
* An easy way of making your own Minecraft mods using the same Ruby API that is provided in-game

For now, it will be simply a toy that you can mess around with, as I build up the API and work out some kinks.

## Install

At the moment, you basically need to set up a development environment to play this mod. In the near future, I will be looking into how to make it into an actual mod you can install like any other mod.

If you want to try it out now, though, here are the instructions:

1. Get MCP 7.44 for Minecraft 1.5.1 from [here](http://mcp.ocean-labs.de/index.php/MCP_Releases#Releases)
2. Unzip it, follow the instructions in `mcp744/docs/README-MCP.TXT`. Basically, first run `updatemcp.sh` or `updatemcp.bat`. Then download `server_minecraft.jar` from [here](https://minecraft.net/download) and put it into the `jars` folder, also copy your `bin` and `resources` folders from your Minecraft installation to the `jars` folder (make sure you're on Minecraft 1.5.1 and you probably shouldn't have any mods installed). Then run `decompile.sh` or `decompile.bat`. It'll take a little while.
3. Copy the `endertromb` folder in this repository into the `lib` folder of MCP.
4. Download JRuby from [here](http://www.jruby.org/download), get the "Complete .jar". Rename it `jruby.jar`, and put it in the `lib` folder of MCP.
5. Copy `CommandRuby.java` from this repository to `src/minecraft/net/minecraft/src/CommandRuby.java`.
6. In the file `src/minecraft/net/minecraft/src/ServerCommandManager.java`, add the line `this.registerCommand(new CommandRuby());` where all the other lines that start with `this.registerCommand(...` are.
7. Run `recompile.sh` or `recompile.bat` and hope it works. There may be an error that comes up that says a certain function isn't returning a value. I fixed that by going to the function and just making it `return true;`. Seems to work. After fixing the error, you'll have to run the recompile script again.
8. Run `startclient.sh` or `startclient.bat` and Minecraft should run, and you should be able to use the `/ruby` command.

## Example

Let's make a totem pole of animals. First, make an array of animals:

    animals = [Chicken.new, Ocelot.new, Wolf.new, Pig.new, Sheep.new, Cow.new]

![Screenshot of spawned animals.](http://viewsourcecode.org/images/endertromb/1.png)

Now loop through them, making each animal mount the next one in the array:

    (animals.length - 1).times { |i| animals[i].mount(animals[i+1]) }

![Screenshot of animal totem pole.](http://viewsourcecode.org/images/endertromb/2.png)

Unfortunately, in between spawning the animals and making them into a totem pole, the wolf ate the sheep, and so the resulting totem pole got got short a little. Oh well.

## Usage

In the future, you will be able to press `r` and a special Ruby prompt will come up.

For now, there is just a `/ruby` command. So to do simple math, type `/ruby 3 + 4` and the answer will come back to you as a chat message. To spawn a pig, do `/ruby pig = Pig.new`. And so on.

## Bugs

* Certain blocks such as fences, stairs, and dirt with wheat growing on it seem to be consistently invisible

## Todo

* Make it into an actual Minecraft mod that people can actually install easily
* Make an actual Ruby prompt that comes up, instead of having to use the `/ruby` command
* Flesh out the API

