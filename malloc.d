module malloc;
import console;
// requied by entry.
import libos.keyboard;
import libos.libdeepmajik.umm;
const uint pageSize = 4096;
/*
Malloc- Calls the getPage function
Allocates more pages if needed based of the pageSize
*/
extern (C)void*  mallocD(int size)
{
        void* first = null;
	while (size >= 0)
	{
                first = UserspaceMemoryManager.getPage(true);
		size -= 4096;
        }
	return first;
}
/*
Free- Calls the freePage function in D
This is a very round about way because of using the void *
TODO: Make sure that the values actually work correctly
because we are using ubyte and void, might be problem with large numbers
Have to pass it size because as of now we do not know how many pages we allocated
*/
extern (C)void free(void* free, int size)
{
        Console.putString("This better not break");
	int num = size/pageSize;
	if (size % pageSize != 0)
                num++;
        Console.putString("Hope this works\n");
        ubyte* cur = UserspaceMemoryManager.getPage(true);
	void * curVoid = cur;
	ubyte dif = curVoid - free;        char[] a;
	a[0] = num;
	Console.putString(a);
	Console.putString("\n");
        for(ubyte i = 0; i < num; i++)
	{
                ubyte* pos = cur - dif - i;
                UserspaceMemoryManager.freePage(pos);
        }
	UserspaceMemoryManager.freePage(cur);
}
/*
InitHeap- This just calls the D function that initilizes a heap
        - Allows us to access it from Genode
        (Not sure if required but might be useful)
*/
extern (C) void[] initHeap()
{
        return UserspaceMemoryManager.initHeap();
}