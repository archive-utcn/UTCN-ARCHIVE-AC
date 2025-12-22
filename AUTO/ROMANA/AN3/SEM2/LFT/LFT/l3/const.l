D [0-9]
E [DEde][-+]?{D}+
%%
{D}+			printf("integer");
{D}+"."{D}*({E})?	|
{D}*"."{D}+({E})?	|
{D}+{E}			printf("real");
%%
