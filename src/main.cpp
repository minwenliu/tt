#include "Net.h"
#include "udp_client.h"
int main(int argc,char* argv[])
{
    UDP u;
    snslib::CUdpClient client; 
    client.Send((unsigned char *)u.sendbuff,UDP::Buff_len);
    return 0;
    

}
