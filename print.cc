
extern "C" void print(char a);
extern "C" void printf(char* a);
namespace Genode
{
	bool printf(char* array)
	{
		int i = 0;
		while(array[i] != '\0')
		{
		print(array[i]);
		i++;
		}
	}
	bool print(char* array)
	{
                printf(array);
                return true;
        }
	bool putChar(char a)
	{
                print(a);                
		return true;
        }
}