#include "Profiler.h"

#define MAX_SIZE 2000

Profiler profiler("demo-power");

/**
* a function that slowly computes x to the power n
*/
int slow_pow(int x, int n){
	int p = 1;
	int i;
	Operation o = profiler.createOperation("slow_pow", n);
	for(i=0; i<n; ++i){
		//count the multiplications
		o.count();
		p *= x;
	}
	return p;
}

/**
* also computes x to the power n but "a little" faster
*/
int fast_pow(int x, int n, int size){
	int y;
	if(n == 0){
		return 1;
	}else if(n == 1){
		return x;
	}else{
		y = fast_pow(x, n/2, size);
		if(n % 2 == 0){
			//count multiplications
			profiler.countOperation("fast_pow", size);
			return y * y;
		}else{
			//we can also count two multiplications at once
			profiler.countOperation("fast_pow", size);
			return y * y * x;
		}
	}
}

/**
* a naive function for finding duplicates in a vector
*/
bool hasDuplicates(int *v, int size){
	int i, j;
	bool dup = false;
	Operation o = profiler.createOperation("duplicates-comparation", size);
	for(i=0; i<size-1; ++i){
		for(j=i+1; j<size; ++j){
			o.count();
			if(v[i] == v[j]){
				dup = true;
			}
		}
	}
	return dup;
}

int main(void){
	//compute some powers of 5
	printf("Computing powers...\n");
	int x = 5, p1, p2;
	int n;
	//increase n with 1 if smaller than 10
	//increase with 10 otherwise
	for(n=0; n<100; n += (n<10?1:10)){
		p1 = slow_pow(x, n);
		p2 = fast_pow(x, n, n);
		if(p1 != p2){
			printf("[ERROR] invalid result\n");
		}
	}
	//we would like the two series to be displayed on the same chart
	profiler.createGroup("power", "slow_pow", "fast_pow");

	profiler.reset("demo-duplicates");
	//second example: find duplicates in a vector
	printf("Finding duplicates...\n");
	int v[MAX_SIZE];
	FillRandomArray(v, MAX_SIZE);
	for(n=100; n<MAX_SIZE; n += 100){
		hasDuplicates(v, n); //we're not actually interested in the result
	}

	profiler.showReport();
	return 0;
}
