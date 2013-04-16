# Endertromb

`Endertromb` is a [Minecraft](http://minecraft.net) mod that gives you an in-game [Ruby](http://ruby-lang.org) prompt. It allows you to conjure and control the various entities and blocks in the Minecraft world. For example, `pig = Pig.new` spawns a pig right before your eyes, and then `pig.jump` makes it jump.

"Endertromb" is the name of a planet that runs on Ruby, from [Why's (Poignant) Guide to Ruby](http://mislav.uniqpath.com/poignant-guide). On this planet, the flowers, apple blossoms, and sky are all low-resolution projections. The planet has both wish-granting and mind-reading capabilities, and the heroes of the story use Ruby to put these two things together, which allows them to conjure a floating whale to pursue The Originals back to Earth. So yeah, it's a perfectly appropriate name for this project.

And in the spirit of Why, this project's main goal is education. There are a lot of possibilities here:

* In-game lessons, à la [Try Ruby](http://tryruby.org) (but with much more exciting output)
* A game or map in Minecraft where you have to use programming skills to solve problems or just help you along the way (à la [CodeSpells](https://sites.google.com/a/eng.ucsd.edu/codespells))
* An easy way of making your own Minecraft mods using the same Ruby API that is provided in-game

For now, it will be simply a toy that you can mess around with, as I build up the API and work out some kinks.

## Install

At the moment, you basically need to set up a development environment to play this mod. In the near future, I will be looking into how to make it into an actual mod you can install like any other mod.

If you want to try it out now, though, here are the instructions:

1. Get MCP 7.44 for Minecraft 1.5.1 from [here](http://mcp.ocean-labs.de/index.php/MCP_Releases#Releases).
2. Unzip it, follow the instructions in `mcp744/docs/README-MCP.TXT`. Basically, first run `updatemcp.sh` or `updatemcp.bat`. Then download `server_minecraft.jar` from [here](https://minecraft.net/download) and put it into the `jars` folder, also copy your `bin` and `resources` folders from your Minecraft installation to the `jars` folder (make sure you're on Minecraft 1.5.1 and you probably shouldn't have any mods installed). Then run `decompile.sh` or `decompile.bat`. It'll take a little while.
3. Copy the `endertromb` folder in this repository into the `lib` folder of MCP.
4. Download JRuby from [here](http://www.jruby.org/download), get the "Complete .jar". Rename it `jruby.jar`, and put it in the `lib` folder of MCP.
5. Copy the files in the `modsrc` folder of this repository to their respective folders in the `src` folder of MCP.
6. Run `recompile.sh` or `recompile.bat` and hope it works. There may be an error that comes up that says a certain function isn't returning a value. I fixed that by going to the function and just making it `return true;`. Seems to work. After fixing the error, you'll have to run the recompile script again.
7. Run `startclient.sh` or `startclient.bat` and Minecraft should run, and you should be able to use the `/ruby` command.

**Warning:** Please don't run this in multiplayer unless you know it's safe. I don't know enough about Minecraft yet to know if this is a problem, but if someone could join your game and run the `/ruby` command, they may or may not be able to execute arbitrary Ruby code on your computer, which means they could do whatever they want with your computer. So I would stay away from multiplayer for now.

## Example

Let's make a totem pole of animals. First, make an array of animals:

    animals = [Chicken.new, Ocelot.new, Wolf.new, Pig.new, Sheep.new, Cow.new]

![Screenshot of spawned animals.](http://viewsourcecode.org/images/endertromb/1.png)

Now loop through them, making each animal mount the next one in the array:

    (animals.length - 1).times { |i| animals[i].mount(animals[i+1]) }

![Screenshot of animal totem pole.](http://viewsourcecode.org/images/endertromb/2.png)

Unfortunately, in between spawning the animals and making them into a totem pole, the wolf ate the sheep, and so the resulting totem pole got cut short a little. Oh well.

## Usage

Create a new world with cheats enabled. (For now, you need to have permission to run the `/ruby` command in order to execute Ruby code, even from the special prompt.)

Press `r` to open the Ruby prompt. Type in some Ruby code, and the result will be printed in the chat. The prompt will stay open even after pressing enter, ready for you to type some more. Press escape to close the prompt.

## Bugs

* Certain blocks such as fences, stairs, and dirt with wheat growing on it seem to be consistently invisible

## Todo

* Make it into an actual Minecraft mod that people can actually install easily
* Flesh out the API
* Better prompt:
  * Friendly error messages, maybe steal Hackety Hack's
  * Continued lines

## Ideas

* Allow programming zombies' AI and getting them to fight each other and stuff
* Make a Ruby block that executes an embedded Ruby script when sent a redstone signal
  * Use said block to make traps involving lightning bolts and/or exploding pigs
* Programming puzzle where you have to stack up a bunch of animals to escape out of prison, over the wall
* Represent an Array as a stack of animals, and restack the animals in real-time whenever a change is made to the Array, e.g. `ary.sort!`
* Make a buffalo jump, but with pigs

## Thanks

Here are some of this project's dependencies that I'm grateful for and thought I should give credit to:

* [JRuby](http://jruby.org)
* [MCP](http://mcp.ocean-labs.de)
* [Minecraft](http://minecraft.net)

