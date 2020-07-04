   /*-----------------------------------------------------------.   
  /                      Bloom Calculation                      /
  '-----------------------------------------------------------*/




sum += tex2Dlod(InputSampler, float4(i.txcoord.x - 4.0*blurSize, i.txcoord.y,0,BlurDownsampling)) * 0.05;
sum += tex2Dlod(InputSampler, float4(i.txcoord.x - 3.0*blurSize, i.txcoord.y,0,BlurDownsampling)) * 0.09;
sum += tex2Dlod(InputSampler, float4(i.txcoord.x - 2.0*blurSize, i.txcoord.y,0,BlurDownsampling)) * 0.12;
sum += tex2Dlod(InputSampler, float4(i.txcoord.x - blurSize, i.txcoord.y,0,BlurDownsampling)) * 0.15;
sum += tex2Dlod(InputSampler, float4(i.txcoord.x, i.txcoord.y,0,BlurDownsampling)) * 0.16;
sum += tex2Dlod(InputSampler, float4(i.txcoord.x + blurSize, i.txcoord.y,0,BlurDownsampling)) * 0.15;
sum += tex2Dlod(InputSampler, float4(i.txcoord.x + 2.0*blurSize, i.txcoord.y,0,BlurDownsampling)) * 0.12;
sum += tex2Dlod(InputSampler, float4(i.txcoord.x + 3.0*blurSize, i.txcoord.y,0,BlurDownsampling)) * 0.09;
sum += tex2Dlod(InputSampler, float4(i.txcoord.x + 4.0*blurSize, i.txcoord.y,0,BlurDownsampling)) * 0.05;