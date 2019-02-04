
load('ddh_dataset_cap.dat');
load('Real_rc_nn_cap.dat');
load('BM_panel.dat');

x=ddh_dataset_cap;
G=Real_rc_nn_cap(:,1:3);
R=Real_rc_nn_cap;
G_UC=BM_panel;
block=[10 5 4];
nd=[3 3 3];
ival=0;
nk=2;
nk_uc=50;
rad=99999;
ntok=1;
avg=mean(ddh_dataset_cap(:,4));
smu=[10 5 4];
panneau=[200 40 20];
vc=[0 0.05:0.01:1.5];

%cas=1 Base case (using cokrioct)
%cas=2 Without octant division (cokri with nk=3)
%cas=3 Intermediate case (cokri with nk=7 for ok and ck and cokri with nk=100 for uc)

%Robustness analysis
%cas=4 Remove nugget
%cas=5 Increase nugget effect 30%
%cas=6 Increase range 30%
%cas=7 Reduce range 30%
%cas=8 Reduce sill 30%
%cas=9 Increase sill 10%


for cas=1:1
    cas
    switch cas
        case 1
            model=[ 1 1; 4 30; 4 60];
            c=[ 0.05; 0.9 ; 0.1];
            typ=1;
            [stat,x0s_ok,x0s_ck,ton_uc,mean_uc]=okckuc(x,G,R,model,c,block,nd,ival,nk,nk_uc,rad,ntok,avg,smu,panneau,vc,G_UC,cas,typ);
            s_OK=latex(vpa(sym(stat.OK),5))
            s_CK=latex(vpa(sym(stat.CK),5))
            
        case 2
            typ=2;
            model=[ 1 1; 4 30; 4 60];
            c=[ 0.05; 0.9 ; 0.1];
            [stat,x0s_ok,x0s_ck,ton_uc,mean_uc]=okckuc(x,G,R,model,c,block,nd,ival,nk,nk_uc,rad,ntok,avg,smu,panneau,vc,G_UC,cas,typ);
            s_OK=latex(vpa(sym(stat.OK),5))
            s_CK=latex(vpa(sym(stat.CK),5))
            
        case 3
            typ=2;
            model=[ 1 1; 4 30; 4 60];
            c=[ 0.05; 0.9 ; 0.1];
            nk=7;
            nk_uc=100;
            [stat,x0s_ok,x0s_ck,ton_uc,mean_uc]=okckuc(x,G,R,model,c,block,nd,ival,nk,nk_uc,rad,ntok,avg,smu,panneau,vc,G_UC,cas,typ);
            s_OK=latex(vpa(sym(stat.OK),5))
            s_CK=latex(vpa(sym(stat.CK),5))
            
        case 4
            model=[ 4 30; 4 60];
            c=[1 ; 0.1];
            typ=1;
            [stat,x0s_ok,x0s_ck,ton_uc,mean_uc]=okckuc(x,G,R,model,c,block,nd,ival,nk,nk_uc,rad,ntok,avg,smu,panneau,vc,G_UC,cas,typ);
            s_OK=latex(vpa(sym(stat.OK),5))
            s_CK=latex(vpa(sym(stat.CK),5))
            
        case 5
            model=[ 1 1; 4 30; 4 60];
            c=[ 0.065; 0.9 ; 0.085];
            typ=1;
            [stat,x0s_ok,x0s_ck,ton_uc,mean_uc]=okckuc(x,G,R,model,c,block,nd,ival,nk,nk_uc,rad,ntok,avg,smu,panneau,vc,G_UC,cas,typ);
            s_OK=latex(vpa(sym(stat.OK),5))
            s_CK=latex(vpa(sym(stat.CK),5))
            
            
        case 6
            model=[ 1 1; 4 39; 4 78];
            c=[ 0.05; 0.9 ; 0.1];
            typ=1;
            [stat,x0s_ok,x0s_ck,ton_uc,mean_uc]=okckuc(x,G,R,model,c,block,nd,ival,nk,nk_uc,rad,ntok,avg,smu,panneau,vc,G_UC,cas,typ);
            s_OK=latex(vpa(sym(stat.OK),5))
            s_CK=latex(vpa(sym(stat.CK),5))
            
        case 7
            model=[ 1 1; 4 21; 4 42];
            c=[ 0.05; 0.9 ; 0.1];
            typ=1;
            [stat,x0s_ok,x0s_ck,ton_uc,mean_uc]=okckuc(x,G,R,model,c,block,nd,ival,nk,nk_uc,rad,ntok,avg,smu,panneau,vc,G_UC,cas,typ);
            s_OK=latex(vpa(sym(stat.OK),5))
            s_CK=latex(vpa(sym(stat.CK),5))
            
        case 8
            model=[ 1 1; 4 30; 4 60];
            c=[ 0.05; 0.6 ; 0.1];
            typ=1;
            [stat,x0s_ok,x0s_ck,ton_uc,mean_uc]=okckuc(x,G,R,model,c,block,nd,ival,nk,nk_uc,rad,ntok,avg,smu,panneau,vc,G_UC,cas,typ);
            s_OK=latex(vpa(sym(stat.OK),5))
            s_CK=latex(vpa(sym(stat.CK),5))
        case 9
            model=[ 1 1; 4 30; 4 60];
            c=[ 0.05; 1 ; 0.1];
            typ=1;
            [stat,x0s_ok,x0s_ck,ton_uc,mean_uc]=okckuc(x,G,R,model,c,block,nd,ival,nk,nk_uc,rad,ntok,avg,smu,panneau,vc,G_UC,cas,typ);
            s_OK=latex(vpa(sym(stat.OK),5))
            s_CK=latex(vpa(sym(stat.CK),5))
            
    end
end