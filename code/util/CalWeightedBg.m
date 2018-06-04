function wCtr = CalWeightedBg(feaDistM, bgProb)
%% Calculate background probability weighted contrast

spaSigma = 0.67;     %sigma for spatial weight
% posWeight = Dist2WeightMatrix(posDistM, spaSigma);  %posWeight = Wspa(p,pi)% exp(-d^2/(2*sigma^2));posDistM�����ؼ�ռ����

wCtr = (feaDistM  * bgProb);   %(8) dapp(p,pi)*Wspa(p,pi)*Wibg�� dapp(p,pi)=colDistM �����ؼ���ɫ��
wCtr = (wCtr - min(wCtr)) / (max(wCtr) - min(wCtr) + eps);

%post-processing for cleaner fg cue
removeLowVals = true;
if removeLowVals
    thresh = graythresh(wCtr);  %automatic threshold
    wCtr(wCtr < thresh) = 0;
end