A=[215 193 124 117 237 442 218 935 347 235 320 804 522 417 345 229 601 723 835 133 124 248 202 277 433 207 263 257 359 464 504 528 516 716 871 182 461 441 426 656 863 560 380 171 923 381 348 573 533 447 632 387 176 975 449 223 711 445 645 245 543 931 532 937 541 444 330 131 333 928 377 733 017 778 839 168 197 197 131 171 522 137 217 224 291 413 528 520 227 229 928 223 626 034 683 839 053 627 310 713 999 629 817 410 121 924 622 911 233 325 139 721 218 253 223 107 233 230 124 233];
B=[1 8 4 2 6 9 8 5 9 3];

maxsum(A)                                %% Read the given sequence of the numbers and return the max sum of the triangle 
function m = maxsum(A)

    n=(-1+sqrt(1+8*length(A)))/2;        %% Dimension of the matrix calculated by quadratic formula

    triangle=zeros(n,n);                 %% create zero matrix 
    counter=1;
    for i = 1:n                          %% generate the required lower triangular matrix
        for j =1:i
            if (not(i==1 && j==1) && not(isprime(A(counter))))  %% Check the number is prime or not
                triangle(i,j) = A(counter);
            elseif (i==1 && j==1)
                triangle(i,j)=A(counter);

            end
            counter=counter+1;
        end
    end

    for i = n-1:-1:0                % dynamic programming algoirtm for the solution 
        for j= 1:i
            if triangle(i+1,j)>triangle(i+1,j+1)
                triangle(i,j)=triangle(i+1,j)+triangle(i,j);
            else
                triangle(i,j)=triangle(i+1,j+1)+triangle(i,j);
            end
        end
    end

    m= triangle(1,1);               %% return the answer
end
