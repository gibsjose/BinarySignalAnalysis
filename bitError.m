function [BER] = bitError(Tx, Rx);
%Usage: [BER] = bitError(Tx, Rx)
%Where BER is the calculated bit error rate, Tx is the transmitted (clean)
%signal, and Rx is the received (noisy) signal.

%Determine the length of the two data streams and compare
LTx = length(Tx);
LRx = length(Rx);

if(LTx ~= LRx)
    error('Data streams do not match in length!');
end

%Define the count for error bits
errors = 0;

for i = 1:LRx
    TxBit = Tx(i);
    RxBit = Rx(i);
    
    if(TxBit ~= RxBit)
        errors = errors + 1;
    end
end

%Determine the bit error rate given the number of errors present
BER = errors / LRx;