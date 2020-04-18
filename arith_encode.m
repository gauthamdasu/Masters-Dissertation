function [compressed_lm,encoded_seq ] = arith_encode( encoding_seq )
%This funciton encodes the sequece of expandable or not expandable
counts=[1: 4096];
code=arithenco(encoding_seq,counts);
counts=[1: 4096];
compressed_lm=arithenco(encoding_seq,counts);
encoded_seq=arithdeco(code,counts,4096);
encoded_seq=uint8(encoded_seq);
hash_lm=sha256(encoded_seq);%hash value of the location map.
end

