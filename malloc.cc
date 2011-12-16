extern "C" void* mallocD(int size);
extern "C" void free(void* ptr, int size);
extern "C" void* initHeap();
namespace Genode
{
      void* malloc(int size)
	{
                return mallocD(size);
      }
	void free(void* ptr, int size)
	{
                free(ptr,size);
        
	}
	void* initHeap()
	{
                return initHeap();
       }
}