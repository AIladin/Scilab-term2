// Copyright (C) 2018 - - Ailadin
//
// Date of creation: 22.03.2018
//
function r=to_trap(A)
    for i=1:min(size(A)(2),size(A)(1))
        if A(i,i)==0
            for j=i+1:size(A)(2)
                if abs(A(j,i))~=0
                    t=A(i,:)
                    A(i,:)=A(j,:)
                    A(j,:)=t
                    break
                end
            end
        end
        if A(i,i)==0
            break
        end
        
        A(i,:)=A(i,:)/A(i,i)
        for j=i+1:size(A)(1)
            A(j,:)=A(j,:)-A(i,:)*A(j,i)
        end
    end
    r=A
endfunction 

function B=get_minor(x,y,A)
    A(x,:)=0
    A(:,y)=0
    B=[]
    for i=1:size(A)(1)
        for j=1:size(A)(2)
            if A(i,j)~=0
                B($+1)=A(i,j)
            end
        end
    end
        B=matrix(B,size(A)(1)-1,size(A)(2)-1)'
endfunction


A=[1,2,3,4;4,1,2,3;3,4,1,2;2,3,4,1]
B=[1,2,3,4;5,2,6,8;1,2,6,2;7,9,2,4]
disp("№1")
disp((A+B)^2,"(A+B)^2:")
disp(A^2+2*A*B+B^2,"A^2+2*A*B+B^2:")
disp((A+B)^2==A^2+2*A*B+B^2)
disp("№2")

if det(A)~=0
    C=inv(A)
end

disp(C,"inv A:")

disp("№3")
C=to_trap(B)
disp(C,"трикутна B:")
disp("№4")
disp(rank(A),"rank A:")

disp(trace(A), "trace A:")

disp(det(B), "det B")
disp("№5")
disp(B,"B:")
disp(get_minor(1,3,B),"M_1^3:")

disp(get_minor(2,2,B),"M_2^2")

disp(get_minor(4,3,B),"M_4^3")

e=cos(2*%pi/3)+%i*sin(2*%pi/3)
Q=[1,e,e^2; e, e^2, 1; e^2, 1, e]
disp(det(Q),"№6")
disp("№7")
function f=fun(x)
    f=(0.5)^(x^2)*2^(2*x-6)-0.25*0.125
endfunction

clozest=0
for i=-1000:1000
    if abs(fun(i))<abs(fun(clozest))
        clozest=i
    end
end

disp(fsolve(clozest,fun),"x:")
