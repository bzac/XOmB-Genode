module print;
import console;
// requied by entry.
import libos.keyboard;
import libos.libdeepmajik.threadscheduler;
extern (C) void print(char a)
{
	char temp[1];
	temp[0] = a;
	Console.putString(temp);
}
extern (C) void printf(char[] array)
{
        Console.putString(array);
}