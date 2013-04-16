// Endertromb start
package net.minecraft.src;

import org.jruby.embed.ScriptingContainer;
import org.jruby.embed.LocalVariableBehavior;

public class CommandRuby extends CommandBase
{
    private ScriptingContainer container;

    public CommandRuby() {
        this.container = new ScriptingContainer(LocalVariableBehavior.PERSISTENT);
        this.container.runScriptlet("require 'endertromb/lib/endertromb'; include Endertromb");
    }

    public String getCommandName()
    {
        return "ruby";
    }

    public int getRequiredPermissionLevel()
    {
        return 0;
    }

    public void processCommand(ICommandSender commandSender, String[] args)
    {
        EntityPlayerMP player = getCommandSenderAsPlayer(commandSender);
        World world = player.worldObj;

        this.container.put("$player", player);
        this.container.put("$world", world);

        String script = CommandRuby.joinArgs(args);
        String output = this.container.runScriptlet("begin; (_ = (" + script + ")).inspect; rescue Exception => e; \"Error: #{e}\"; end").toString();
        commandSender.sendChatToPlayer("\u00A74ruby> \u00A7f" + script);
        if (output.startsWith("Error: ")) {
            commandSender.sendChatToPlayer("\u00A7c" + output);
        } else {
            commandSender.sendChatToPlayer("\u00A76= \u00A7b" + output);
        }
    }
    
    static private String joinArgs(String[] args) {
        if (args.length == 0) return "";
        StringBuilder sb = new StringBuilder();
        int i;
        for (i = 0; i < args.length - 1; i++) {
            sb.append(args[i] + " ");
        }
        return sb.toString() + args[i];
    }
}
// Endertromb end

