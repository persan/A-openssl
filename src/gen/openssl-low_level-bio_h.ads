with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
--  with OpenSSL.Low_Level.ossl_typ_h;
with OpenSSL.Low_Level.stack_h;
--  with stddef_h;
--  with Interfaces.C_Streams;

package OpenSSL.Low_Level.bio_h is


   BIO_TYPE_NONE : constant := 0;  --  openssl/bio.h:76
   BIO_TYPE_MEM : constant := 1 + 16#0400#;  --  openssl/bio.h:77
   BIO_TYPE_FILE : constant := 2 + 16#0400#;  --  openssl/bio.h:78

   BIO_TYPE_FD : constant := 4 + 16#0400# + 16#0100#;  --  openssl/bio.h:80
   BIO_TYPE_SOCKET : constant := 5 + 16#0400# + 16#0100#;  --  openssl/bio.h:81
   BIO_TYPE_NULL : constant := 6 + 16#0400#;  --  openssl/bio.h:82
   BIO_TYPE_SSL : constant := 7 + 16#0200#;  --  openssl/bio.h:83
   BIO_TYPE_MD : constant := 8 + 16#0200#;  --  openssl/bio.h:84
   BIO_TYPE_BUFFER : constant := 9 + 16#0200#;  --  openssl/bio.h:85
   BIO_TYPE_CIPHER : constant := 10 + 16#0200#;  --  openssl/bio.h:86
   BIO_TYPE_BASE64 : constant := 11 + 16#0200#;  --  openssl/bio.h:87
   BIO_TYPE_CONNECT : constant := 12 + 16#0400# + 16#0100#;  --  openssl/bio.h:88
   BIO_TYPE_ACCEPT : constant := 13 + 16#0400# + 16#0100#;  --  openssl/bio.h:89
   BIO_TYPE_PROXY_CLIENT : constant := 14 + 16#0200#;  --  openssl/bio.h:90
   BIO_TYPE_PROXY_SERVER : constant := 15 + 16#0200#;  --  openssl/bio.h:91
   BIO_TYPE_NBIO_TEST : constant := 16 + 16#0200#;  --  openssl/bio.h:92
   BIO_TYPE_NULL_FILTER : constant := 17 + 16#0200#;  --  openssl/bio.h:93
   BIO_TYPE_BER : constant := 18 + 16#0200#;  --  openssl/bio.h:94
   BIO_TYPE_BIO : constant := 19 + 16#0400#;  --  openssl/bio.h:95
   BIO_TYPE_LINEBUFFER : constant := 20 + 16#0200#;  --  openssl/bio.h:96
   BIO_TYPE_DGRAM : constant := 21 + 16#0400# + 16#0100#;  --  openssl/bio.h:97
   BIO_TYPE_ASN1 : constant := 22 + 16#0200#;  --  openssl/bio.h:98
   BIO_TYPE_COMP : constant := 23 + 16#0200#;  --  openssl/bio.h:99

   BIO_TYPE_DESCRIPTOR : constant := 16#0100#;  --  openssl/bio.h:101
   BIO_TYPE_FILTER : constant := 16#0200#;  --  openssl/bio.h:102
   BIO_TYPE_SOURCE_SINK : constant := 16#0400#;  --  openssl/bio.h:103

   BIO_NOCLOSE : constant := 16#00#;  --  openssl/bio.h:107
   BIO_CLOSE : constant := 16#01#;  --  openssl/bio.h:108

   BIO_CTRL_RESET : constant := 1;  --  openssl/bio.h:112
   BIO_CTRL_EOF : constant := 2;  --  openssl/bio.h:113
   BIO_CTRL_INFO : constant := 3;  --  openssl/bio.h:114
   BIO_CTRL_SET : constant := 4;  --  openssl/bio.h:115
   BIO_CTRL_GET : constant := 5;  --  openssl/bio.h:116
   BIO_CTRL_PUSH : constant := 6;  --  openssl/bio.h:117
   BIO_CTRL_POP : constant := 7;  --  openssl/bio.h:118
   BIO_CTRL_GET_CLOSE : constant := 8;  --  openssl/bio.h:119
   BIO_CTRL_SET_CLOSE : constant := 9;  --  openssl/bio.h:120
   BIO_CTRL_PENDING : constant := 10;  --  openssl/bio.h:121
   BIO_CTRL_FLUSH : constant := 11;  --  openssl/bio.h:122
   BIO_CTRL_DUP : constant := 12;  --  openssl/bio.h:123
   BIO_CTRL_WPENDING : constant := 13;  --  openssl/bio.h:124

   BIO_CTRL_SET_CALLBACK : constant := 14;  --  openssl/bio.h:126
   BIO_CTRL_GET_CALLBACK : constant := 15;  --  openssl/bio.h:127

   BIO_CTRL_SET_FILENAME : constant := 30;  --  openssl/bio.h:129

   BIO_CTRL_DGRAM_CONNECT : constant := 31;  --  openssl/bio.h:132
   BIO_CTRL_DGRAM_SET_CONNECTED : constant := 32;  --  openssl/bio.h:133

   BIO_CTRL_DGRAM_SET_RECV_TIMEOUT : constant := 33;  --  openssl/bio.h:136
   BIO_CTRL_DGRAM_GET_RECV_TIMEOUT : constant := 34;  --  openssl/bio.h:137
   BIO_CTRL_DGRAM_SET_SEND_TIMEOUT : constant := 35;  --  openssl/bio.h:138
   BIO_CTRL_DGRAM_GET_SEND_TIMEOUT : constant := 36;  --  openssl/bio.h:139

   BIO_CTRL_DGRAM_GET_RECV_TIMER_EXP : constant := 37;  --  openssl/bio.h:141
   BIO_CTRL_DGRAM_GET_SEND_TIMER_EXP : constant := 38;  --  openssl/bio.h:142

   BIO_CTRL_DGRAM_MTU_DISCOVER : constant := 39;  --  openssl/bio.h:145

   BIO_CTRL_DGRAM_QUERY_MTU : constant := 40;  --  openssl/bio.h:148
   BIO_CTRL_DGRAM_GET_MTU : constant := 41;  --  openssl/bio.h:149
   BIO_CTRL_DGRAM_SET_MTU : constant := 42;  --  openssl/bio.h:150

   BIO_CTRL_DGRAM_MTU_EXCEEDED : constant := 43;  --  openssl/bio.h:155

   BIO_CTRL_DGRAM_GET_PEER : constant := 46;  --  openssl/bio.h:160
   BIO_CTRL_DGRAM_SET_PEER : constant := 44;  --  openssl/bio.h:161

   BIO_CTRL_DGRAM_SET_NEXT_TIMEOUT : constant := 45;  --  openssl/bio.h:163

   BIO_FP_READ : constant := 16#02#;  --  openssl/bio.h:167
   BIO_FP_WRITE : constant := 16#04#;  --  openssl/bio.h:168
   BIO_FP_APPEND : constant := 16#08#;  --  openssl/bio.h:169
   BIO_FP_TEXT : constant := 16#10#;  --  openssl/bio.h:170

   BIO_FLAGS_READ : constant := 16#01#;  --  openssl/bio.h:172
   BIO_FLAGS_WRITE : constant := 16#02#;  --  openssl/bio.h:173
   BIO_FLAGS_IO_SPECIAL : constant := 16#04#;  --  openssl/bio.h:174
   --  unsupported macro: BIO_FLAGS_RWS (BIO_FLAGS_READ|BIO_FLAGS_WRITE|BIO_FLAGS_IO_SPECIAL)

   BIO_FLAGS_SHOULD_RETRY : constant := 16#08#;  --  openssl/bio.h:176

   BIO_FLAGS_UPLINK : constant := 0;  --  openssl/bio.h:180

   BIO_GHBN_CTRL_HITS : constant := 1;  --  openssl/bio.h:184
   BIO_GHBN_CTRL_MISSES : constant := 2;  --  openssl/bio.h:185
   BIO_GHBN_CTRL_CACHE_SIZE : constant := 3;  --  openssl/bio.h:186
   BIO_GHBN_CTRL_GET_ENTRY : constant := 4;  --  openssl/bio.h:187
   BIO_GHBN_CTRL_FLUSH : constant := 5;  --  openssl/bio.h:188

   BIO_FLAGS_BASE64_NO_NL : constant := 16#100#;  --  openssl/bio.h:197

   BIO_FLAGS_MEM_RDONLY : constant := 16#200#;  --  openssl/bio.h:202
   --  arg-macro: procedure BIO_get_flags (b)
   --    BIO_test_flags(b, ~(16#0#))
   --  arg-macro: procedure BIO_set_retry_special (b)
   --    BIO_set_flags(b, (BIO_FLAGS_IO_SPECIALorBIO_FLAGS_SHOULD_RETRY))
   --  arg-macro: procedure BIO_set_retry_read (b)
   --    BIO_set_flags(b, (BIO_FLAGS_READorBIO_FLAGS_SHOULD_RETRY))
   --  arg-macro: procedure BIO_set_retry_write (b)
   --    BIO_set_flags(b, (BIO_FLAGS_WRITEorBIO_FLAGS_SHOULD_RETRY))
   --  arg-macro: procedure BIO_clear_retry_flags (b)
   --    BIO_clear_flags(b, (BIO_FLAGS_RWSorBIO_FLAGS_SHOULD_RETRY))
   --  arg-macro: procedure BIO_get_retry_flags (b)
   --    BIO_test_flags(b, (BIO_FLAGS_RWSorBIO_FLAGS_SHOULD_RETRY))
   --  arg-macro: procedure BIO_should_read (a)
   --    BIO_test_flags(a, BIO_FLAGS_READ)
   --  arg-macro: procedure BIO_should_write (a)
   --    BIO_test_flags(a, BIO_FLAGS_WRITE)
   --  arg-macro: procedure BIO_should_io_special (a)
   --    BIO_test_flags(a, BIO_FLAGS_IO_SPECIAL)
   --  arg-macro: procedure BIO_retry_type (a)
   --    BIO_test_flags(a, BIO_FLAGS_RWS)
   --  arg-macro: procedure BIO_should_retry (a)
   --    BIO_test_flags(a, BIO_FLAGS_SHOULD_RETRY)

   BIO_RR_SSL_X509_LOOKUP : constant := 16#01#;  --  openssl/bio.h:237

   BIO_RR_CONNECT : constant := 16#02#;  --  openssl/bio.h:239

   BIO_RR_ACCEPT : constant := 16#03#;  --  openssl/bio.h:241

   BIO_CB_FREE : constant := 16#01#;  --  openssl/bio.h:244
   BIO_CB_READ : constant := 16#02#;  --  openssl/bio.h:245
   BIO_CB_WRITE : constant := 16#03#;  --  openssl/bio.h:246
   BIO_CB_PUTS : constant := 16#04#;  --  openssl/bio.h:247
   BIO_CB_GETS : constant := 16#05#;  --  openssl/bio.h:248
   BIO_CB_CTRL : constant := 16#06#;  --  openssl/bio.h:249

   BIO_CB_RETURN : constant := 16#80#;  --  openssl/bio.h:253
   --  arg-macro: function BIO_CB_return (a)
   --    return (a)orBIO_CB_RETURN);
   --  arg-macro: function BIO_cb_pre (a)
   --    return not((a)andBIO_CB_RETURN);
   --  arg-macro: function BIO_cb_post (a)
   --    return (a)andBIO_CB_RETURN;

   BIO_CONN_S_BEFORE : constant := 1;  --  openssl/bio.h:326
   BIO_CONN_S_GET_IP : constant := 2;  --  openssl/bio.h:327
   BIO_CONN_S_GET_PORT : constant := 3;  --  openssl/bio.h:328
   BIO_CONN_S_CREATE_SOCKET : constant := 4;  --  openssl/bio.h:329
   BIO_CONN_S_CONNECT : constant := 5;  --  openssl/bio.h:330
   BIO_CONN_S_OK : constant := 6;  --  openssl/bio.h:331
   BIO_CONN_S_BLOCKED_CONNECT : constant := 7;  --  openssl/bio.h:332
   BIO_CONN_S_NBIO : constant := 8;  --  openssl/bio.h:333

   BIO_C_SET_CONNECT : constant := 100;  --  openssl/bio.h:336
   BIO_C_DO_STATE_MACHINE : constant := 101;  --  openssl/bio.h:337
   BIO_C_SET_NBIO : constant := 102;  --  openssl/bio.h:338
   BIO_C_SET_PROXY_PARAM : constant := 103;  --  openssl/bio.h:339
   BIO_C_SET_FD : constant := 104;  --  openssl/bio.h:340
   BIO_C_GET_FD : constant := 105;  --  openssl/bio.h:341
   BIO_C_SET_FILE_PTR : constant := 106;  --  openssl/bio.h:342
   BIO_C_GET_FILE_PTR : constant := 107;  --  openssl/bio.h:343
   BIO_C_SET_FILENAME : constant := 108;  --  openssl/bio.h:344
   BIO_C_SET_SSL : constant := 109;  --  openssl/bio.h:345
   BIO_C_GET_SSL : constant := 110;  --  openssl/bio.h:346
   BIO_C_SET_MD : constant := 111;  --  openssl/bio.h:347
   BIO_C_GET_MD : constant := 112;  --  openssl/bio.h:348
   BIO_C_GET_CIPHER_STATUS : constant := 113;  --  openssl/bio.h:349
   BIO_C_SET_BUF_MEM : constant := 114;  --  openssl/bio.h:350
   BIO_C_GET_BUF_MEM_PTR : constant := 115;  --  openssl/bio.h:351
   BIO_C_GET_BUFF_NUM_LINES : constant := 116;  --  openssl/bio.h:352
   BIO_C_SET_BUFF_SIZE : constant := 117;  --  openssl/bio.h:353
   BIO_C_SET_ACCEPT : constant := 118;  --  openssl/bio.h:354
   BIO_C_SSL_MODE : constant := 119;  --  openssl/bio.h:355
   BIO_C_GET_MD_CTX : constant := 120;  --  openssl/bio.h:356
   BIO_C_GET_PROXY_PARAM : constant := 121;  --  openssl/bio.h:357
   BIO_C_SET_BUFF_READ_DATA : constant := 122;  --  openssl/bio.h:358
   BIO_C_GET_CONNECT : constant := 123;  --  openssl/bio.h:359
   BIO_C_GET_ACCEPT : constant := 124;  --  openssl/bio.h:360
   BIO_C_SET_SSL_RENEGOTIATE_BYTES : constant := 125;  --  openssl/bio.h:361
   BIO_C_GET_SSL_NUM_RENEGOTIATES : constant := 126;  --  openssl/bio.h:362
   BIO_C_SET_SSL_RENEGOTIATE_TIMEOUT : constant := 127;  --  openssl/bio.h:363
   BIO_C_FILE_SEEK : constant := 128;  --  openssl/bio.h:364
   BIO_C_GET_CIPHER_CTX : constant := 129;  --  openssl/bio.h:365
   BIO_C_SET_BUF_MEM_EOF_RETURN : constant := 130;  --  openssl/bio.h:366
   BIO_C_SET_BIND_MODE : constant := 131;  --  openssl/bio.h:367
   BIO_C_GET_BIND_MODE : constant := 132;  --  openssl/bio.h:368
   BIO_C_FILE_TELL : constant := 133;  --  openssl/bio.h:369
   BIO_C_GET_SOCKS : constant := 134;  --  openssl/bio.h:370
   BIO_C_SET_SOCKS : constant := 135;  --  openssl/bio.h:371

   BIO_C_SET_WRITE_BUF_SIZE : constant := 136;  --  openssl/bio.h:373
   BIO_C_GET_WRITE_BUF_SIZE : constant := 137;  --  openssl/bio.h:374
   BIO_C_MAKE_BIO_PAIR : constant := 138;  --  openssl/bio.h:375
   BIO_C_DESTROY_BIO_PAIR : constant := 139;  --  openssl/bio.h:376
   BIO_C_GET_WRITE_GUARANTEE : constant := 140;  --  openssl/bio.h:377
   BIO_C_GET_READ_REQUEST : constant := 141;  --  openssl/bio.h:378
   BIO_C_SHUTDOWN_WR : constant := 142;  --  openssl/bio.h:379
   BIO_C_NREAD0 : constant := 143;  --  openssl/bio.h:380
   BIO_C_NREAD : constant := 144;  --  openssl/bio.h:381
   BIO_C_NWRITE0 : constant := 145;  --  openssl/bio.h:382
   BIO_C_NWRITE : constant := 146;  --  openssl/bio.h:383
   BIO_C_RESET_READ_REQUEST : constant := 147;  --  openssl/bio.h:384
   BIO_C_SET_MD_CTX : constant := 148;  --  openssl/bio.h:385

   BIO_C_SET_PREFIX : constant := 149;  --  openssl/bio.h:387
   BIO_C_GET_PREFIX : constant := 150;  --  openssl/bio.h:388
   BIO_C_SET_SUFFIX : constant := 151;  --  openssl/bio.h:389
   BIO_C_GET_SUFFIX : constant := 152;  --  openssl/bio.h:390

   BIO_C_SET_EX_ARG : constant := 153;  --  openssl/bio.h:392
   BIO_C_GET_EX_ARG : constant := 154;  --  openssl/bio.h:393
   --  arg-macro: procedure BIO_set_app_data (s, arg)
   --    BIO_set_ex_data(s,0,arg)
   --  arg-macro: procedure BIO_get_app_data (s)
   --    BIO_get_ex_data(s,0)
   --  arg-macro: procedure BIO_set_conn_hostname (b, name)
   --    BIO_ctrl(b,BIO_C_SET_CONNECT,0,(char *)name)
   --  arg-macro: procedure BIO_set_conn_port (b, port)
   --    BIO_ctrl(b,BIO_C_SET_CONNECT,1,(char *)port)
   --  arg-macro: procedure BIO_set_conn_ip (b, ip)
   --    BIO_ctrl(b,BIO_C_SET_CONNECT,2,(char *)ip)
   --  arg-macro: procedure BIO_set_conn_int_port (b, port)
   --    BIO_ctrl(b,BIO_C_SET_CONNECT,3,(char *)port)
   --  arg-macro: procedure BIO_get_conn_hostname (b)
   --    BIO_ptr_ctrl(b,BIO_C_GET_CONNECT,0)
   --  arg-macro: procedure BIO_get_conn_port (b)
   --    BIO_ptr_ctrl(b,BIO_C_GET_CONNECT,1)
   --  arg-macro: procedure BIO_get_conn_ip (b)
   --    BIO_ptr_ctrl(b,BIO_C_GET_CONNECT,2)
   --  arg-macro: procedure BIO_get_conn_int_port (b)
   --    BIO_int_ctrl(b,BIO_C_GET_CONNECT,3,0)
   --  arg-macro: procedure BIO_set_nbio (b, n)
   --    BIO_ctrl(b,BIO_C_SET_NBIO,(n),NULL)
   --  arg-macro: procedure BIO_set_accept_port (b, name)
   --    BIO_ctrl(b,BIO_C_SET_ACCEPT,0,(char *)name)
   --  arg-macro: procedure BIO_get_accept_port (b)
   --    BIO_ptr_ctrl(b,BIO_C_GET_ACCEPT,0)
   --  arg-macro: procedure BIO_set_nbio_accept (b, n)
   --    BIO_ctrl(b,BIO_C_SET_ACCEPT,1,(n)?(void *)"a":NULL)
   --  arg-macro: procedure BIO_set_accept_bios (b, bio)
   --    BIO_ctrl(b,BIO_C_SET_ACCEPT,2,(char *)bio)

   BIO_BIND_NORMAL : constant := 0;  --  openssl/bio.h:418
   BIO_BIND_REUSEADDR_IF_UNUSED : constant := 1;  --  openssl/bio.h:419
   BIO_BIND_REUSEADDR : constant := 2;  --  openssl/bio.h:420
   --  arg-macro: procedure BIO_set_bind_mode (b, mode)
   --    BIO_ctrl(b,BIO_C_SET_BIND_MODE,mode,NULL)
   --  arg-macro: procedure BIO_get_bind_mode (b, mode)
   --    BIO_ctrl(b,BIO_C_GET_BIND_MODE,0,NULL)
   --  arg-macro: procedure BIO_do_connect (b)
   --    BIO_do_handshake(b)
   --  arg-macro: procedure BIO_do_accept (b)
   --    BIO_do_handshake(b)
   --  arg-macro: procedure BIO_do_handshake (b)
   --    BIO_ctrl(b,BIO_C_DO_STATE_MACHINE,0,NULL)
   --  arg-macro: procedure BIO_set_url (b, url)
   --    BIO_ctrl(b,BIO_C_SET_PROXY_PARAM,0,(char *)(url))
   --  arg-macro: procedure BIO_set_proxies (b, p)
   --    BIO_ctrl(b,BIO_C_SET_PROXY_PARAM,1,(char *)(p))
   --  arg-macro: procedure BIO_set_filter_bio (b, s)
   --    BIO_ctrl(b,BIO_C_SET_PROXY_PARAM,2,(char *)(s))
   --  arg-macro: procedure BIO_set_proxy_cb (b, cb)
   --    BIO_callback_ctrl(b,BIO_C_SET_PROXY_PARAM,3,(void *(*cb)()))
   --  arg-macro: procedure BIO_set_proxy_header (b, sk)
   --    BIO_ctrl(b,BIO_C_SET_PROXY_PARAM,4,(char *)sk)
   --  arg-macro: procedure BIO_set_no_connect_return (b, bool)
   --    BIO_int_ctrl(b,BIO_C_SET_PROXY_PARAM,5,bool)
   --  arg-macro: procedure BIO_get_proxy_header (b, skp)
   --    BIO_ctrl(b,BIO_C_GET_PROXY_PARAM,0,(char *)skp)
   --  arg-macro: procedure BIO_get_proxies (b, pxy_p)
   --    BIO_ctrl(b,BIO_C_GET_PROXY_PARAM,1,(char *)(pxy_p))
   --  arg-macro: procedure BIO_get_url (b, url)
   --    BIO_ctrl(b,BIO_C_GET_PROXY_PARAM,2,(char *)(url))
   --  arg-macro: procedure BIO_get_no_connect_return (b)
   --    BIO_ctrl(b,BIO_C_GET_PROXY_PARAM,5,NULL)
   --  arg-macro: procedure BIO_set_fd (b, fd, c)
   --    BIO_int_ctrl(b,BIO_C_SET_FD,c,fd)
   --  arg-macro: procedure BIO_get_fd (b, c)
   --    BIO_ctrl(b,BIO_C_GET_FD,0,(char *)c)
   --  arg-macro: procedure BIO_set_fp (b, fp, c)
   --    BIO_ctrl(b,BIO_C_SET_FILE_PTR,c,(char *)fp)
   --  arg-macro: procedure BIO_get_fp (b, fpp)
   --    BIO_ctrl(b,BIO_C_GET_FILE_PTR,0,(char *)fpp)
   --  arg-macro: function BIO_seek (b, ofs)
   --    return int)BIO_ctrl(b,BIO_C_FILE_SEEK,ofs,NULL;
   --  arg-macro: function BIO_tell (b)
   --    return int)BIO_ctrl(b,BIO_C_FILE_TELL,0,NULL;
   --  arg-macro: procedure BIO_read_filename (b, name)
   --    BIO_ctrl(b,BIO_C_SET_FILENAME, BIO_CLOSEorBIO_FP_READ,(char *)name)
   --  arg-macro: procedure BIO_write_filename (b, name)
   --    BIO_ctrl(b,BIO_C_SET_FILENAME, BIO_CLOSEorBIO_FP_WRITE,name)
   --  arg-macro: procedure BIO_append_filename (b, name)
   --    BIO_ctrl(b,BIO_C_SET_FILENAME, BIO_CLOSEorBIO_FP_APPEND,name)
   --  arg-macro: procedure BIO_rw_filename (b, name)
   --    BIO_ctrl(b,BIO_C_SET_FILENAME, BIO_CLOSEorBIO_FP_READorBIO_FP_WRITE,name)
   --  arg-macro: procedure BIO_set_ssl (b, ssl, c)
   --    BIO_ctrl(b,BIO_C_SET_SSL,c,(char *)ssl)
   --  arg-macro: procedure BIO_get_ssl (b, sslp)
   --    BIO_ctrl(b,BIO_C_GET_SSL,0,(char *)sslp)
   --  arg-macro: procedure BIO_set_ssl_mode (b, client)
   --    BIO_ctrl(b,BIO_C_SSL_MODE,client,NULL)
   --  arg-macro: procedure BIO_set_ssl_renegotiate_bytes (b, num)
   --    BIO_ctrl(b,BIO_C_SET_SSL_RENEGOTIATE_BYTES,num,NULL);
   --  arg-macro: procedure BIO_get_num_renegotiates (b)
   --    BIO_ctrl(b,BIO_C_GET_SSL_NUM_RENEGOTIATES,0,NULL);
   --  arg-macro: procedure BIO_set_ssl_renegotiate_timeout (b, seconds)
   --    BIO_ctrl(b,BIO_C_SET_SSL_RENEGOTIATE_TIMEOUT,seconds,NULL);
   --  arg-macro: procedure BIO_get_mem_data (b, pp)
   --    BIO_ctrl(b,BIO_CTRL_INFO,0,(char *)pp)
   --  arg-macro: procedure BIO_set_mem_buf (b, bm, c)
   --    BIO_ctrl(b,BIO_C_SET_BUF_MEM,c,(char *)bm)
   --  arg-macro: procedure BIO_get_mem_ptr (b, pp)
   --    BIO_ctrl(b,BIO_C_GET_BUF_MEM_PTR,0,(char *)pp)
   --  arg-macro: procedure BIO_set_mem_eof_return (b, v)
   --    BIO_ctrl(b,BIO_C_SET_BUF_MEM_EOF_RETURN,v,NULL)
   --  arg-macro: procedure BIO_get_buffer_num_lines (b)
   --    BIO_ctrl(b,BIO_C_GET_BUFF_NUM_LINES,0,NULL)
   --  arg-macro: procedure BIO_set_buffer_size (b, size)
   --    BIO_ctrl(b,BIO_C_SET_BUFF_SIZE,size,NULL)
   --  arg-macro: procedure BIO_set_read_buffer_size (b, size)
   --    BIO_int_ctrl(b,BIO_C_SET_BUFF_SIZE,size,0)
   --  arg-macro: procedure BIO_set_write_buffer_size (b, size)
   --    BIO_int_ctrl(b,BIO_C_SET_BUFF_SIZE,size,1)
   --  arg-macro: procedure BIO_set_buffer_read_data (b, buf, num)
   --    BIO_ctrl(b,BIO_C_SET_BUFF_READ_DATA,num,buf)
   --  arg-macro: procedure BIO_dup_state (b, ret)
   --    BIO_ctrl(b,BIO_CTRL_DUP,0,(char *)(ret))
   --  arg-macro: function BIO_reset (b)
   --    return int)BIO_ctrl(b,BIO_CTRL_RESET,0,NULL;
   --  arg-macro: function BIO_eof (b)
   --    return int)BIO_ctrl(b,BIO_CTRL_EOF,0,NULL;
   --  arg-macro: function BIO_set_close (b, c)
   --    return int)BIO_ctrl(b,BIO_CTRL_SET_CLOSE,(c),NULL;
   --  arg-macro: function BIO_get_close (b)
   --    return int)BIO_ctrl(b,BIO_CTRL_GET_CLOSE,0,NULL;
   --  arg-macro: function BIO_pending (b)
   --    return int)BIO_ctrl(b,BIO_CTRL_PENDING,0,NULL;
   --  arg-macro: function BIO_wpending (b)
   --    return int)BIO_ctrl(b,BIO_CTRL_WPENDING,0,NULL;
   --  arg-macro: function BIO_flush (b)
   --    return int)BIO_ctrl(b,BIO_CTRL_FLUSH,0,NULL;
   --  arg-macro: function BIO_get_info_callback (b, cbp)
   --    return int)BIO_ctrl(b,BIO_CTRL_GET_CALLBACK,0, cbp;
   --  arg-macro: function BIO_set_info_callback (b, cb)
   --    return int)BIO_callback_ctrl(b,BIO_CTRL_SET_CALLBACK,cb;
   --  arg-macro: procedure BIO_buffer_get_num_lines (b)
   --    BIO_ctrl(b,BIO_CTRL_GET,0,NULL)
   --  arg-macro: function BIO_set_write_buf_size (b, size)
   --    return int)BIO_ctrl(b,BIO_C_SET_WRITE_BUF_SIZE,size,NULL;
   --  arg-macro: function BIO_get_write_buf_size (b, size)
   --    return size_t)BIO_ctrl(b,BIO_C_GET_WRITE_BUF_SIZE,size,NULL;
   --  arg-macro: function BIO_make_bio_pair (b1, b2)
   --    return int)BIO_ctrl(b1,BIO_C_MAKE_BIO_PAIR,0,b2;
   --  arg-macro: function BIO_destroy_bio_pair (b)
   --    return int)BIO_ctrl(b,BIO_C_DESTROY_BIO_PAIR,0,NULL;
   --  arg-macro: function BIO_shutdown_wr (b)
   --    return int)BIO_ctrl(b, BIO_C_SHUTDOWN_WR, 0, NULL;
   --  arg-macro: function BIO_get_write_guarantee (b)
   --    return int)BIO_ctrl(b,BIO_C_GET_WRITE_GUARANTEE,0,NULL;
   --  arg-macro: function BIO_get_read_request (b)
   --    return int)BIO_ctrl(b,BIO_C_GET_READ_REQUEST,0,NULL;
   --  arg-macro: function BIO_ctrl_dgram_connect (b, peer)
   --    return int)BIO_ctrl(b,BIO_CTRL_DGRAM_CONNECT,0, (char *)peer;
   --  arg-macro: function BIO_ctrl_set_connected (b, state, peer)(int)BIO_ctrl(b, BIO_CTRL_DGRAM_SET_CONNECTED, state, (char *)peer
   --    return int)BIO_ctrl(b, BIO_CTRL_DGRAM_SET_CONNECTED, state, (char *)peer;
   --  arg-macro: function BIO_dgram_recv_timedout (b)
   --    return int)BIO_ctrl(b, BIO_CTRL_DGRAM_GET_RECV_TIMER_EXP, 0, NULL;
   --  arg-macro: function BIO_dgram_send_timedout (b)
   --    return int)BIO_ctrl(b, BIO_CTRL_DGRAM_GET_SEND_TIMER_EXP, 0, NULL;
   --  arg-macro: function BIO_dgram_get_peer (b, peer)
   --    return int)BIO_ctrl(b, BIO_CTRL_DGRAM_GET_PEER, 0, (char *)peer;
   --  arg-macro: function BIO_dgram_set_peer (b, peer)
   --    return int)BIO_ctrl(b, BIO_CTRL_DGRAM_SET_PEER, 0, (char *)peer;
   --  unsupported macro: BIO_s_file_internal BIO_s_file

   BIO_F_ACPT_STATE : constant := 100;  --  openssl/bio.h:703
   BIO_F_BIO_ACCEPT : constant := 101;  --  openssl/bio.h:704
   BIO_F_BIO_BER_GET_HEADER : constant := 102;  --  openssl/bio.h:705
   BIO_F_BIO_CALLBACK_CTRL : constant := 131;  --  openssl/bio.h:706
   BIO_F_BIO_CTRL : constant := 103;  --  openssl/bio.h:707
   BIO_F_BIO_GETHOSTBYNAME : constant := 120;  --  openssl/bio.h:708
   BIO_F_BIO_GETS : constant := 104;  --  openssl/bio.h:709
   BIO_F_BIO_GET_ACCEPT_SOCKET : constant := 105;  --  openssl/bio.h:710
   BIO_F_BIO_GET_HOST_IP : constant := 106;  --  openssl/bio.h:711
   BIO_F_BIO_GET_PORT : constant := 107;  --  openssl/bio.h:712
   BIO_F_BIO_MAKE_PAIR : constant := 121;  --  openssl/bio.h:713
   BIO_F_BIO_NEW : constant := 108;  --  openssl/bio.h:714
   BIO_F_BIO_NEW_FILE : constant := 109;  --  openssl/bio.h:715
   BIO_F_BIO_NEW_MEM_BUF : constant := 126;  --  openssl/bio.h:716
   BIO_F_BIO_NREAD : constant := 123;  --  openssl/bio.h:717
   BIO_F_BIO_NREAD0 : constant := 124;  --  openssl/bio.h:718
   BIO_F_BIO_NWRITE : constant := 125;  --  openssl/bio.h:719
   BIO_F_BIO_NWRITE0 : constant := 122;  --  openssl/bio.h:720
   BIO_F_BIO_PUTS : constant := 110;  --  openssl/bio.h:721
   BIO_F_BIO_READ : constant := 111;  --  openssl/bio.h:722
   BIO_F_BIO_SOCK_INIT : constant := 112;  --  openssl/bio.h:723
   BIO_F_BIO_WRITE : constant := 113;  --  openssl/bio.h:724
   BIO_F_BUFFER_CTRL : constant := 114;  --  openssl/bio.h:725
   BIO_F_CONN_CTRL : constant := 127;  --  openssl/bio.h:726
   BIO_F_CONN_STATE : constant := 115;  --  openssl/bio.h:727
   BIO_F_FILE_CTRL : constant := 116;  --  openssl/bio.h:728
   BIO_F_FILE_READ : constant := 130;  --  openssl/bio.h:729
   BIO_F_LINEBUFFER_CTRL : constant := 129;  --  openssl/bio.h:730
   BIO_F_MEM_READ : constant := 128;  --  openssl/bio.h:731
   BIO_F_MEM_WRITE : constant := 117;  --  openssl/bio.h:732
   BIO_F_SSL_NEW : constant := 118;  --  openssl/bio.h:733
   BIO_F_WSASTARTUP : constant := 119;  --  openssl/bio.h:734

   BIO_R_ACCEPT_ERROR : constant := 100;  --  openssl/bio.h:737
   BIO_R_BAD_FOPEN_MODE : constant := 101;  --  openssl/bio.h:738
   BIO_R_BAD_HOSTNAME_LOOKUP : constant := 102;  --  openssl/bio.h:739
   BIO_R_BROKEN_PIPE : constant := 124;  --  openssl/bio.h:740
   BIO_R_CONNECT_ERROR : constant := 103;  --  openssl/bio.h:741
   BIO_R_EOF_ON_MEMORY_BIO : constant := 127;  --  openssl/bio.h:742
   BIO_R_ERROR_SETTING_NBIO : constant := 104;  --  openssl/bio.h:743
   BIO_R_ERROR_SETTING_NBIO_ON_ACCEPTED_SOCKET : constant := 105;  --  openssl/bio.h:744
   BIO_R_ERROR_SETTING_NBIO_ON_ACCEPT_SOCKET : constant := 106;  --  openssl/bio.h:745
   BIO_R_GETHOSTBYNAME_ADDR_IS_NOT_AF_INET : constant := 107;  --  openssl/bio.h:746
   BIO_R_INVALID_ARGUMENT : constant := 125;  --  openssl/bio.h:747
   BIO_R_INVALID_IP_ADDRESS : constant := 108;  --  openssl/bio.h:748
   BIO_R_IN_USE : constant := 123;  --  openssl/bio.h:749
   BIO_R_KEEPALIVE : constant := 109;  --  openssl/bio.h:750
   BIO_R_NBIO_CONNECT_ERROR : constant := 110;  --  openssl/bio.h:751
   BIO_R_NO_ACCEPT_PORT_SPECIFIED : constant := 111;  --  openssl/bio.h:752
   BIO_R_NO_HOSTNAME_SPECIFIED : constant := 112;  --  openssl/bio.h:753
   BIO_R_NO_PORT_DEFINED : constant := 113;  --  openssl/bio.h:754
   BIO_R_NO_PORT_SPECIFIED : constant := 114;  --  openssl/bio.h:755
   BIO_R_NO_SUCH_FILE : constant := 128;  --  openssl/bio.h:756
   BIO_R_NULL_PARAMETER : constant := 115;  --  openssl/bio.h:757
   BIO_R_TAG_MISMATCH : constant := 116;  --  openssl/bio.h:758
   BIO_R_UNABLE_TO_BIND_SOCKET : constant := 117;  --  openssl/bio.h:759
   BIO_R_UNABLE_TO_CREATE_SOCKET : constant := 118;  --  openssl/bio.h:760
   BIO_R_UNABLE_TO_LISTEN_SOCKET : constant := 119;  --  openssl/bio.h:761
   BIO_R_UNINITIALIZED : constant := 120;  --  openssl/bio.h:762
   BIO_R_UNSUPPORTED_METHOD : constant := 121;  --  openssl/bio.h:763
   BIO_R_WRITE_TO_READ_ONLY_BIO : constant := 126;  --  openssl/bio.h:764
   BIO_R_WSASTARTUP : constant := 122;  --  openssl/bio.h:765

   type bio_st;
   subtype BIO is bio_st;

   procedure BIO_set_flags (b : access BIO; flags : int);  -- openssl/bio.h:206
   pragma Import (C, BIO_set_flags, "BIO_set_flags");

   function BIO_test_flags (b : System.Address; flags : int) return int;  -- openssl/bio.h:207
   pragma Import (C, BIO_test_flags, "BIO_test_flags");

   procedure BIO_clear_flags (b : access BIO; flags : int);  -- openssl/bio.h:208
   pragma Import (C, BIO_clear_flags, "BIO_clear_flags");

   function BIO_get_callback (b : System.Address) return access function
        (arg1 : access bio_st;
         arg2 : int;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int;
         arg5 : long;
         arg6 : long) return long;  -- openssl/bio.h:258
   pragma Import (C, BIO_get_callback, "BIO_get_callback");

   procedure BIO_set_callback (b : access BIO; callback : access function
        (arg1 : access bio_st;
         arg2 : int;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int;
         arg5 : long;
         arg6 : long) return long);  -- openssl/bio.h:259
   pragma Import (C, BIO_set_callback, "BIO_set_callback");

   function BIO_get_callback_arg (b : System.Address) return Interfaces.C.Strings.chars_ptr;  -- openssl/bio.h:261
   pragma Import (C, BIO_get_callback_arg, "BIO_get_callback_arg");

   procedure BIO_set_callback_arg (b : access BIO; arg : Interfaces.C.Strings.chars_ptr);  -- openssl/bio.h:262
   pragma Import (C, BIO_set_callback_arg, "BIO_set_callback_arg");

   function BIO_method_name (b : System.Address) return Interfaces.C.Strings.chars_ptr;  -- openssl/bio.h:264
   pragma Import (C, BIO_method_name, "BIO_method_name");

   function BIO_method_type (b : System.Address) return int;  -- openssl/bio.h:265
   pragma Import (C, BIO_method_type, "BIO_method_type");

   --  skipped function type bio_info_cb

   type bio_method_st is record
      c_type : aliased int;  -- openssl/bio.h:271
      name : Interfaces.C.Strings.chars_ptr;  -- openssl/bio.h:272
      bwrite : access function
           (arg1 : access BIO;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : int) return int;  -- openssl/bio.h:273
      bread : access function
           (arg1 : access BIO;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : int) return int;  -- openssl/bio.h:274
      bputs : access function (arg1 : access BIO; arg2 : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/bio.h:275
      bgets : access function
           (arg1 : access BIO;
            arg2 : Interfaces.C.Strings.chars_ptr;
            arg3 : int) return int;  -- openssl/bio.h:276
      ctrl : access function
           (arg1 : access BIO;
            arg2 : int;
            arg3 : long;
            arg4 : System.Address) return long;  -- openssl/bio.h:277
      create : access function (arg1 : access BIO) return int;  -- openssl/bio.h:278
      destroy : access function (arg1 : access BIO) return int;  -- openssl/bio.h:279
      callback_ctrl : access function
           (arg1 : access BIO;
            arg2 : int;
            arg3 : access procedure
              (arg1 : System.Address;
               arg2 : int;
               arg3 : Interfaces.C.Strings.chars_ptr;
               arg4 : int;
               arg5 : long;
               arg6 : long)) return long;  -- openssl/bio.h:280
   end record;
   pragma Convention (C_Pass_By_Copy, bio_method_st);  -- openssl/bio.h:269

   subtype BIO_METHOD is bio_method_st;

   type bio_st is record
      method : access BIO_METHOD;  -- openssl/bio.h:285
      callback : access function
           (arg1 : access bio_st;
            arg2 : int;
            arg3 : Interfaces.C.Strings.chars_ptr;
            arg4 : int;
            arg5 : long;
            arg6 : long) return long;  -- openssl/bio.h:287
      cb_arg : Interfaces.C.Strings.chars_ptr;  -- openssl/bio.h:288
      init : aliased int;  -- openssl/bio.h:290
      shutdown : aliased int;  -- openssl/bio.h:291
      flags : aliased int;  -- openssl/bio.h:292
      retry_reason : aliased int;  -- openssl/bio.h:293
      num : aliased int;  -- openssl/bio.h:294
      ptr : System.Address;  -- openssl/bio.h:295
      next_bio : access bio_st;  -- openssl/bio.h:296
      prev_bio : access bio_st;  -- openssl/bio.h:297
      references : aliased int;  -- openssl/bio.h:298
      num_read : aliased unsigned_long;  -- openssl/bio.h:299
      num_write : aliased unsigned_long;  -- openssl/bio.h:300
      ex_data : aliased OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;  -- openssl/bio.h:302
   end record;
   pragma Convention (C_Pass_By_Copy, bio_st);  -- openssl/bio.h:283

   type stack_st_BIO is record
      stack : aliased OpenSSL.Low_Level.stack_h.u_STACK;  -- openssl/bio.h:305
   end record;
   pragma Convention (C_Pass_By_Copy, stack_st_BIO);  -- openssl/bio.h:305

   type bio_f_buffer_ctx_struct is record
      ibuf_size : aliased int;  -- openssl/bio.h:310
      obuf_size : aliased int;  -- openssl/bio.h:311
      ibuf : Interfaces.C.Strings.chars_ptr;  -- openssl/bio.h:313
      ibuf_len : aliased int;  -- openssl/bio.h:314
      ibuf_off : aliased int;  -- openssl/bio.h:315
      obuf : Interfaces.C.Strings.chars_ptr;  -- openssl/bio.h:317
      obuf_len : aliased int;  -- openssl/bio.h:318
      obuf_off : aliased int;  -- openssl/bio.h:319
   end record;
   pragma Convention (C_Pass_By_Copy, bio_f_buffer_ctx_struct);  -- openssl/bio.h:307

   subtype BIO_F_BUFFER_CTX is bio_f_buffer_ctx_struct;

   --  skipped function type asn1_ps_func

   function BIO_ctrl_pending (b : access BIO) return size_t;  -- openssl/bio.h:510
   pragma Import (C, BIO_ctrl_pending, "BIO_ctrl_pending");

   function BIO_ctrl_wpending (b : access BIO) return size_t;  -- openssl/bio.h:511
   pragma Import (C, BIO_ctrl_wpending, "BIO_ctrl_wpending");

   function BIO_ctrl_get_write_guarantee (b : access BIO) return size_t;  -- openssl/bio.h:529
   pragma Import (C, BIO_ctrl_get_write_guarantee, "BIO_ctrl_get_write_guarantee");

   function BIO_ctrl_get_read_request (b : access BIO) return size_t;  -- openssl/bio.h:530
   pragma Import (C, BIO_ctrl_get_read_request, "BIO_ctrl_get_read_request");

   function BIO_ctrl_reset_read_request (b : access BIO) return int;  -- openssl/bio.h:531
   pragma Import (C, BIO_ctrl_reset_read_request, "BIO_ctrl_reset_read_request");

   function BIO_set_ex_data
     (the_bio : access BIO;
      idx : int;
      data : System.Address) return int;  -- openssl/bio.h:550
   pragma Import (C, BIO_set_ex_data, "BIO_set_ex_data");

   function BIO_get_ex_data (the_bio : access BIO; idx : int) return System.Address;  -- openssl/bio.h:551
   pragma Import (C, BIO_get_ex_data, "BIO_get_ex_data");

   function BIO_get_ex_new_index
     (argl : long;
      argp : System.Address;
      new_func : access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address) return int;
      dup_func : access function
        (arg1 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg2 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg3 : System.Address;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address) return int;
      free_func : access procedure
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : access OpenSSL.Low_Level.crypto_h.crypto_ex_data_st;
         arg4 : int;
         arg5 : long;
         arg6 : System.Address)) return int;  -- openssl/bio.h:552
   pragma Import (C, BIO_get_ex_new_index, "BIO_get_ex_new_index");

   function BIO_number_read (the_bio : access BIO) return unsigned_long;  -- openssl/bio.h:554
   pragma Import (C, BIO_number_read, "BIO_number_read");

   function BIO_number_written (the_bio : access BIO) return unsigned_long;  -- openssl/bio.h:555
   pragma Import (C, BIO_number_written, "BIO_number_written");

   function BIO_asn1_set_prefix
     (b : access BIO;
      prefix : access function
        (arg1 : access BIO;
         arg2 : System.Address;
         arg3 : access int;
         arg4 : System.Address) return int;
      prefix_free : access function
        (arg1 : access BIO;
         arg2 : System.Address;
         arg3 : access int;
         arg4 : System.Address) return int) return int;  -- openssl/bio.h:558
   pragma Import (C, BIO_asn1_set_prefix, "BIO_asn1_set_prefix");

   function BIO_asn1_get_prefix
     (b : access BIO;
      pprefix : System.Address;
      pprefix_free : System.Address) return int;  -- openssl/bio.h:560
   pragma Import (C, BIO_asn1_get_prefix, "BIO_asn1_get_prefix");

   function BIO_asn1_set_suffix
     (b : access BIO;
      suffix : access function
        (arg1 : access BIO;
         arg2 : System.Address;
         arg3 : access int;
         arg4 : System.Address) return int;
      suffix_free : access function
        (arg1 : access BIO;
         arg2 : System.Address;
         arg3 : access int;
         arg4 : System.Address) return int) return int;  -- openssl/bio.h:562
   pragma Import (C, BIO_asn1_set_suffix, "BIO_asn1_set_suffix");

   function BIO_asn1_get_suffix
     (b : access BIO;
      psuffix : System.Address;
      psuffix_free : System.Address) return int;  -- openssl/bio.h:564
   pragma Import (C, BIO_asn1_get_suffix, "BIO_asn1_get_suffix");

   function BIO_s_file return access BIO_METHOD;  -- openssl/bio.h:568
   pragma Import (C, BIO_s_file, "BIO_s_file");

   function BIO_new_file (filename : Interfaces.C.Strings.chars_ptr; mode : Interfaces.C.Strings.chars_ptr) return access BIO;  -- openssl/bio.h:569
   pragma Import (C, BIO_new_file, "BIO_new_file");

   function BIO_new_fp (stream : access Interfaces.C_Streams.FILEs; close_flag : int) return access BIO;  -- openssl/bio.h:570
   pragma Import (C, BIO_new_fp, "BIO_new_fp");

   function BIO_new (c_type : access BIO_METHOD) return access BIO;  -- openssl/bio.h:573
   pragma Import (C, BIO_new, "BIO_new");

   function BIO_set (a : access BIO; c_type : access BIO_METHOD) return int;  -- openssl/bio.h:574
   pragma Import (C, BIO_set, "BIO_set");

   function BIO_free (a : access BIO) return int;  -- openssl/bio.h:575
   pragma Import (C, BIO_free, "BIO_free");

   procedure BIO_vfree (a : access BIO);  -- openssl/bio.h:576
   pragma Import (C, BIO_vfree, "BIO_vfree");

   function BIO_read
     (b : access BIO;
      data : System.Address;
      len : int) return int;  -- openssl/bio.h:577
   pragma Import (C, BIO_read, "BIO_read");

   function BIO_gets
     (bp : access BIO;
      buf : Interfaces.C.Strings.chars_ptr;
      size : int) return int;  -- openssl/bio.h:578
   pragma Import (C, BIO_gets, "BIO_gets");

   function BIO_write
     (b : access BIO;
      data : System.Address;
      len : int) return int;  -- openssl/bio.h:579
   pragma Import (C, BIO_write, "BIO_write");

   function BIO_puts (bp : access BIO; buf : Interfaces.C.Strings.chars_ptr) return int;  -- openssl/bio.h:580
   pragma Import (C, BIO_puts, "BIO_puts");

   function BIO_indent
     (b : access BIO;
      indent : int;
      max : int) return int;  -- openssl/bio.h:581
   pragma Import (C, BIO_indent, "BIO_indent");

   function BIO_ctrl
     (bp : access BIO;
      cmd : int;
      larg : long;
      parg : System.Address) return long;  -- openssl/bio.h:582
   pragma Import (C, BIO_ctrl, "BIO_ctrl");

   function BIO_callback_ctrl
     (b : access BIO;
      cmd : int;
      fp : access procedure
        (arg1 : access bio_st;
         arg2 : int;
         arg3 : Interfaces.C.Strings.chars_ptr;
         arg4 : int;
         arg5 : long;
         arg6 : long)) return long;  -- openssl/bio.h:583
   pragma Import (C, BIO_callback_ctrl, "BIO_callback_ctrl");

   function BIO_ptr_ctrl
     (bp : access BIO;
      cmd : int;
      larg : long) return Interfaces.C.Strings.chars_ptr;  -- openssl/bio.h:584
   pragma Import (C, BIO_ptr_ctrl, "BIO_ptr_ctrl");

   function BIO_int_ctrl
     (bp : access BIO;
      cmd : int;
      larg : long;
      iarg : int) return long;  -- openssl/bio.h:585
   pragma Import (C, BIO_int_ctrl, "BIO_int_ctrl");

   function BIO_push (b : access BIO; append : access BIO) return access BIO;  -- openssl/bio.h:586
   pragma Import (C, BIO_push, "BIO_push");

   function BIO_pop (b : access BIO) return access BIO;  -- openssl/bio.h:587
   pragma Import (C, BIO_pop, "BIO_pop");

   procedure BIO_free_all (a : access BIO);  -- openssl/bio.h:588
   pragma Import (C, BIO_free_all, "BIO_free_all");

   function BIO_find_type (b : access BIO; bio_type : int) return access BIO;  -- openssl/bio.h:589
   pragma Import (C, BIO_find_type, "BIO_find_type");

   function BIO_next (b : access BIO) return access BIO;  -- openssl/bio.h:590
   pragma Import (C, BIO_next, "BIO_next");

   function BIO_get_retry_BIO (the_bio : access BIO; reason : access int) return access BIO;  -- openssl/bio.h:591
   pragma Import (C, BIO_get_retry_BIO, "BIO_get_retry_BIO");

   function BIO_get_retry_reason (the_bio : access BIO) return int;  -- openssl/bio.h:592
   pragma Import (C, BIO_get_retry_reason, "BIO_get_retry_reason");

   function BIO_dup_chain (c_in : access BIO) return access BIO;  -- openssl/bio.h:593
   pragma Import (C, BIO_dup_chain, "BIO_dup_chain");

   function BIO_nread0 (the_bio : access BIO; buf : System.Address) return int;  -- openssl/bio.h:595
   pragma Import (C, BIO_nread0, "BIO_nread0");

   function BIO_nread
     (the_bio : access BIO;
      buf : System.Address;
      num : int) return int;  -- openssl/bio.h:596
   pragma Import (C, BIO_nread, "BIO_nread");

   function BIO_nwrite0 (the_bio : access BIO; buf : System.Address) return int;  -- openssl/bio.h:597
   pragma Import (C, BIO_nwrite0, "BIO_nwrite0");

   function BIO_nwrite
     (the_bio : access BIO;
      buf : System.Address;
      num : int) return int;  -- openssl/bio.h:598
   pragma Import (C, BIO_nwrite, "BIO_nwrite");

   function BIO_debug_callback
     (the_bio : access BIO;
      cmd : int;
      argp : Interfaces.C.Strings.chars_ptr;
      argi : int;
      argl : long;
      ret : long) return long;  -- openssl/bio.h:600
   pragma Import (C, BIO_debug_callback, "BIO_debug_callback");

   function BIO_s_mem return access BIO_METHOD;  -- openssl/bio.h:603
   pragma Import (C, BIO_s_mem, "BIO_s_mem");

   function BIO_new_mem_buf (buf : System.Address; len : int) return access BIO;  -- openssl/bio.h:604
   pragma Import (C, BIO_new_mem_buf, "BIO_new_mem_buf");

   function BIO_s_socket return access BIO_METHOD;  -- openssl/bio.h:605
   pragma Import (C, BIO_s_socket, "BIO_s_socket");

   function BIO_s_connect return access BIO_METHOD;  -- openssl/bio.h:606
   pragma Import (C, BIO_s_connect, "BIO_s_connect");

   function BIO_s_accept return access BIO_METHOD;  -- openssl/bio.h:607
   pragma Import (C, BIO_s_accept, "BIO_s_accept");

   function BIO_s_fd return access BIO_METHOD;  -- openssl/bio.h:608
   pragma Import (C, BIO_s_fd, "BIO_s_fd");

   function BIO_s_log return access BIO_METHOD;  -- openssl/bio.h:610
   pragma Import (C, BIO_s_log, "BIO_s_log");

   function BIO_s_bio return access BIO_METHOD;  -- openssl/bio.h:612
   pragma Import (C, BIO_s_bio, "BIO_s_bio");

   function BIO_s_null return access BIO_METHOD;  -- openssl/bio.h:613
   pragma Import (C, BIO_s_null, "BIO_s_null");

   function BIO_f_null return access BIO_METHOD;  -- openssl/bio.h:614
   pragma Import (C, BIO_f_null, "BIO_f_null");

   function BIO_f_buffer return access BIO_METHOD;  -- openssl/bio.h:615
   pragma Import (C, BIO_f_buffer, "BIO_f_buffer");

   function BIO_f_nbio_test return access BIO_METHOD;  -- openssl/bio.h:619
   pragma Import (C, BIO_f_nbio_test, "BIO_f_nbio_test");

   function BIO_s_datagram return access BIO_METHOD;  -- openssl/bio.h:621
   pragma Import (C, BIO_s_datagram, "BIO_s_datagram");

   function BIO_sock_should_retry (i : int) return int;  -- openssl/bio.h:626
   pragma Import (C, BIO_sock_should_retry, "BIO_sock_should_retry");

   function BIO_sock_non_fatal_error (error : int) return int;  -- openssl/bio.h:627
   pragma Import (C, BIO_sock_non_fatal_error, "BIO_sock_non_fatal_error");

   function BIO_dgram_non_fatal_error (error : int) return int;  -- openssl/bio.h:628
   pragma Import (C, BIO_dgram_non_fatal_error, "BIO_dgram_non_fatal_error");

   function BIO_fd_should_retry (i : int) return int;  -- openssl/bio.h:630
   pragma Import (C, BIO_fd_should_retry, "BIO_fd_should_retry");

   function BIO_fd_non_fatal_error (error : int) return int;  -- openssl/bio.h:631
   pragma Import (C, BIO_fd_non_fatal_error, "BIO_fd_non_fatal_error");

   function BIO_dump_cb
     (cb : access function
        (arg1 : System.Address;
         arg2 : size_t;
         arg3 : System.Address) return int;
      u : System.Address;
      s : Interfaces.C.Strings.chars_ptr;
      len : int) return int;  -- openssl/bio.h:632
   pragma Import (C, BIO_dump_cb, "BIO_dump_cb");

   function BIO_dump_indent_cb
     (cb : access function
        (arg1 : System.Address;
         arg2 : size_t;
         arg3 : System.Address) return int;
      u : System.Address;
      s : Interfaces.C.Strings.chars_ptr;
      len : int;
      indent : int) return int;  -- openssl/bio.h:634
   pragma Import (C, BIO_dump_indent_cb, "BIO_dump_indent_cb");

   function BIO_dump
     (b : access BIO;
      bytes : Interfaces.C.Strings.chars_ptr;
      len : int) return int;  -- openssl/bio.h:636
   pragma Import (C, BIO_dump, "BIO_dump");

   function BIO_dump_indent
     (b : access BIO;
      bytes : Interfaces.C.Strings.chars_ptr;
      len : int;
      indent : int) return int;  -- openssl/bio.h:637
   pragma Import (C, BIO_dump_indent, "BIO_dump_indent");

   function BIO_dump_fp
     (fp : access Interfaces.C_Streams.FILEs;
      s : Interfaces.C.Strings.chars_ptr;
      len : int) return int;  -- openssl/bio.h:639
   pragma Import (C, BIO_dump_fp, "BIO_dump_fp");

   function BIO_dump_indent_fp
     (fp : access Interfaces.C_Streams.FILEs;
      s : Interfaces.C.Strings.chars_ptr;
      len : int;
      indent : int) return int;  -- openssl/bio.h:640
   pragma Import (C, BIO_dump_indent_fp, "BIO_dump_indent_fp");

   --  skipped empty struct hostent

   function BIO_gethostbyname (name : Interfaces.C.Strings.chars_ptr) return System.Address;  -- openssl/bio.h:642
   pragma Import (C, BIO_gethostbyname, "BIO_gethostbyname");

   function BIO_sock_error (sock : int) return int;  -- openssl/bio.h:651
   pragma Import (C, BIO_sock_error, "BIO_sock_error");

   function BIO_socket_ioctl
     (fd : int;
      c_type : long;
      arg : System.Address) return int;  -- openssl/bio.h:652
   pragma Import (C, BIO_socket_ioctl, "BIO_socket_ioctl");

   function BIO_socket_nbio (fd : int; mode : int) return int;  -- openssl/bio.h:653
   pragma Import (C, BIO_socket_nbio, "BIO_socket_nbio");

   function BIO_get_port (str : Interfaces.C.Strings.chars_ptr; port_ptr : access unsigned_short) return int;  -- openssl/bio.h:654
   pragma Import (C, BIO_get_port, "BIO_get_port");

   function BIO_get_host_ip (str : Interfaces.C.Strings.chars_ptr; ip : access unsigned_char) return int;  -- openssl/bio.h:655
   pragma Import (C, BIO_get_host_ip, "BIO_get_host_ip");

   function BIO_get_accept_socket (host_port : Interfaces.C.Strings.chars_ptr; mode : int) return int;  -- openssl/bio.h:656
   pragma Import (C, BIO_get_accept_socket, "BIO_get_accept_socket");

   function BIO_accept (sock : int; ip_port : System.Address) return int;  -- openssl/bio.h:657
   pragma Import (C, BIO_accept, "BIO_accept");

   function BIO_sock_init return int;  -- openssl/bio.h:658
   pragma Import (C, BIO_sock_init, "BIO_sock_init");

   procedure BIO_sock_cleanup;  -- openssl/bio.h:659
   pragma Import (C, BIO_sock_cleanup, "BIO_sock_cleanup");

   function BIO_set_tcp_ndelay (sock : int; turn_on : int) return int;  -- openssl/bio.h:660
   pragma Import (C, BIO_set_tcp_ndelay, "BIO_set_tcp_ndelay");

   function BIO_new_socket (sock : int; close_flag : int) return access BIO;  -- openssl/bio.h:662
   pragma Import (C, BIO_new_socket, "BIO_new_socket");

   function BIO_new_dgram (fd : int; close_flag : int) return access BIO;  -- openssl/bio.h:663
   pragma Import (C, BIO_new_dgram, "BIO_new_dgram");

   function BIO_new_fd (fd : int; close_flag : int) return access BIO;  -- openssl/bio.h:664
   pragma Import (C, BIO_new_fd, "BIO_new_fd");

   function BIO_new_connect (host_port : Interfaces.C.Strings.chars_ptr) return access BIO;  -- openssl/bio.h:665
   pragma Import (C, BIO_new_connect, "BIO_new_connect");

   function BIO_new_accept (host_port : Interfaces.C.Strings.chars_ptr) return access BIO;  -- openssl/bio.h:666
   pragma Import (C, BIO_new_accept, "BIO_new_accept");

   function BIO_new_bio_pair
     (bio1 : System.Address;
      writebuf1 : size_t;
      bio2 : System.Address;
      writebuf2 : size_t) return int;  -- openssl/bio.h:668
   pragma Import (C, BIO_new_bio_pair, "BIO_new_bio_pair");

   procedure BIO_copy_next_retry (b : access BIO);  -- openssl/bio.h:675
   pragma Import (C, BIO_copy_next_retry, "BIO_copy_next_retry");

   function BIO_printf (the_bio : access BIO; format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- openssl/bio.h:684
   pragma Import (C, BIO_printf, "BIO_printf");

   function BIO_vprintf
     (the_bio : access BIO;
      format : Interfaces.C.Strings.chars_ptr;
      args : stdio_h.va_list) return int;  -- openssl/bio.h:686
   pragma Import (C, BIO_vprintf, "BIO_vprintf");

   function BIO_snprintf
     (buf : Interfaces.C.Strings.chars_ptr;
      n : size_t;
      format : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int;  -- openssl/bio.h:688
   pragma Import (C, BIO_snprintf, "BIO_snprintf");

   function BIO_vsnprintf
     (buf : Interfaces.C.Strings.chars_ptr;
      n : size_t;
      format : Interfaces.C.Strings.chars_ptr;
      args : stdio_h.va_list) return int;  -- openssl/bio.h:690
   pragma Import (C, BIO_vsnprintf, "BIO_vsnprintf");

   procedure ERR_load_BIO_strings;  -- openssl/bio.h:698
   pragma Import (C, ERR_load_BIO_strings, "ERR_load_BIO_strings");

end OpenSSL.Low_Level.bio_h;
