#include <stdio.h>
#include <stdlib.h>
#include <string.h>


void readline (char **buffer,int *stored, FILE *fp){
    for(int i = 0 ; i <200; ++i)
        buffer[i] = malloc(sizeof (char) * 6);       
    
    int i = 0;

    while(fgets(buffer[i],6,fp)){
        buffer[i] = strsep(&buffer[i],"\n");
        stored[i] = atoi(buffer[i]);
        i++;
    }
}

int part1 (int *stored){

    int ans = 0, result = 0;

    for(int i = 0; i < 200; i++){
        if(!ans){
            for(int j = i + 1; j <200; j++){                
                if (stored [i] + stored[j] == 2020) {
                    ans = 1; 
                    result = stored[i] * stored[j];
                    break;
                }
            }
        }  
    }

    return result;  
}
int part2(int *stored){

    int ans = 0, result = 0;

    for(int i = 0; i < 200; i++){
        if(!ans){
            for(int j = i + 1; j <200; j++){
                for(int z = j + 1; z < 200; z++){
                    if (stored [i] + stored[j] + stored[z] == 2020) {
                        ans = 1; 
                        result = stored[i] * stored[j] * stored[z];
                        break;
                    }
                }
            }  
        }
    }
    return result;
}

int main (int argc, char * argv[]){

    if(argc < 3){
        puts("Error, not enough arguments");
        return -1;
    }

    FILE *fp;    
    char *filename = argv[2];
    fp = fopen(filename,"r");

    char ** buffer = malloc(sizeof(char*)*200);
    int *stored = malloc(sizeof (int)*200);  
    int mode = atoi(argv[1]);

    readline(buffer,stored,fp); 

    switch(mode){
        case 1 :
            printf("Part 1 result : %d\n",part1(stored));
            break;
        case 2 : 
            printf("Part 2 result : %d\n", part2(stored));
            break;
        default :
            puts("Error");
    }

   

    return 0;
    
    


}