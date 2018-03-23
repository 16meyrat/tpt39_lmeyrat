
vector_add.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_Z8callbackPKcjjPv>:
    return diff;
}

void callback(const char *buffer, size_t length, size_t final, void *user_data)
{
     fwrite(buffer, 1, length, stdout);
   0:	f240 0300 	movw	r3, #0
   4:	f2c0 0300 	movt	r3, #0
   8:	460a      	mov	r2, r1
   a:	2101      	movs	r1, #1
   c:	681b      	ldr	r3, [r3, #0]
   e:	f7ff bffe 	b.w	0 <fwrite>
  12:	bf00      	nop

00000014 <_Z20print_clbuild_errorsP11_cl_programP13_cl_device_id>:




void print_clbuild_errors(cl_program program,cl_device_id device)
	{
  14:	f240 0300 	movw	r3, #0
  18:	f2c0 0300 	movt	r3, #0
  1c:	b5f0      	push	{r4, r5, r6, r7, lr}
		cout<<"Program Build failed\n";
  1e:	f240 0400 	movw	r4, #0




void print_clbuild_errors(cl_program program,cl_device_id device)
	{
  22:	681b      	ldr	r3, [r3, #0]
		cout<<"Program Build failed\n";
  24:	f2c0 0400 	movt	r4, #0




void print_clbuild_errors(cl_program program,cl_device_id device)
	{
  28:	f6ad 0d14 	subw	sp, sp, #2068	; 0x814
  2c:	460f      	mov	r7, r1
  2e:	4606      	mov	r6, r0
		cout<<"Program Build failed\n";
  30:	f240 0100 	movw	r1, #0
  34:	4620      	mov	r0, r4
  36:	f2c0 0100 	movt	r1, #0
		size_t length;
		char buffer[2048];
		clGetProgramBuildInfo(program, device, CL_PROGRAM_BUILD_LOG, sizeof(buffer), buffer, &length);
  3a:	ad03      	add	r5, sp, #12




void print_clbuild_errors(cl_program program,cl_device_id device)
	{
  3c:	f8cd 380c 	str.w	r3, [sp, #2060]	; 0x80c
		cout<<"Program Build failed\n";
  40:	f7ff fffe 	bl	0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc>
		size_t length;
		char buffer[2048];
		clGetProgramBuildInfo(program, device, CL_PROGRAM_BUILD_LOG, sizeof(buffer), buffer, &length);
  44:	f44f 6300 	mov.w	r3, #2048	; 0x800
  48:	4639      	mov	r1, r7
  4a:	aa02      	add	r2, sp, #8
  4c:	4630      	mov	r0, r6
  4e:	9201      	str	r2, [sp, #4]
  50:	9500      	str	r5, [sp, #0]
  52:	f241 1283 	movw	r2, #4483	; 0x1183
  56:	f7ff fffe 	bl	0 <clGetProgramBuildInfo>
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
  5a:	2213      	movs	r2, #19
  5c:	4620      	mov	r0, r4
  5e:	f240 0100 	movw	r1, #0
  62:	f2c0 0100 	movt	r1, #0
  66:	f7ff fffe 	bl	0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i>
	return __builtin_memcmp(__s1, __s2, __n);
      }

      static size_t
      length(const char_type* __s)
      { return __builtin_strlen(__s); }
  6a:	4628      	mov	r0, r5
  6c:	f7ff fffe 	bl	0 <strlen>
  70:	4629      	mov	r1, r5
  72:	4602      	mov	r2, r0
  74:	4620      	mov	r0, r4
  76:	f7ff fffe 	bl	0 <_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_i>
      operator<<(__ostream_type& (*__pf)(__ostream_type&))
      {
	// _GLIBCXX_RESOLVE_LIB_DEFECTS
	// DR 60. What is a formatted input function?
	// The inserters for manipulators are *not* formatted output functions.
	return __pf(*this);
  7a:	4620      	mov	r0, r4
  7c:	f7ff fffe 	bl	0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_>
		cout<<"--- Build log ---\n "<<buffer<<endl;
		exit(1);
  80:	2001      	movs	r0, #1
  82:	f7ff fffe 	bl	0 <exit>
  86:	bf00      	nop

00000088 <_Z9read_filePKc>:
	}
unsigned char ** read_file(const char *name) {
  88:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
  8a:	4607      	mov	r7, r0
  size_t size;
  unsigned char **output=(unsigned char **)malloc(sizeof(unsigned char *));
  8c:	2004      	movs	r0, #4
  8e:	f7ff fffe 	bl	0 <malloc>
  FILE* fp = fopen(name, "rb");
  92:	f240 0100 	movw	r1, #0
  96:	f2c0 0100 	movt	r1, #0
		cout<<"--- Build log ---\n "<<buffer<<endl;
		exit(1);
	}
unsigned char ** read_file(const char *name) {
  size_t size;
  unsigned char **output=(unsigned char **)malloc(sizeof(unsigned char *));
  9a:	4605      	mov	r5, r0
  FILE* fp = fopen(name, "rb");
  9c:	4638      	mov	r0, r7
  9e:	f7ff fffe 	bl	0 <fopen>
  if (!fp) {
  a2:	b390      	cbz	r0, 10a <_Z9read_filePKc+0x82>
  a4:	4604      	mov	r4, r0
    printf("no such file:%s",name);
    exit(-1);
  }

  fseek(fp, 0, SEEK_END);
  a6:	2202      	movs	r2, #2
  a8:	2100      	movs	r1, #0
  aa:	f7ff fffe 	bl	0 <fseek>
  size = ftell(fp);
  ae:	4620      	mov	r0, r4
  b0:	f7ff fffe 	bl	0 <ftell>
  fseek(fp, 0, SEEK_SET);
  b4:	2200      	movs	r2, #0
  b6:	4611      	mov	r1, r2
    printf("no such file:%s",name);
    exit(-1);
  }

  fseek(fp, 0, SEEK_END);
  size = ftell(fp);
  b8:	4606      	mov	r6, r0
  fseek(fp, 0, SEEK_SET);
  ba:	4620      	mov	r0, r4
  bc:	f7ff fffe 	bl	0 <fseek>

  *output = (unsigned char *)malloc(size);
  c0:	4630      	mov	r0, r6
  c2:	f7ff fffe 	bl	0 <malloc>
  c6:	6028      	str	r0, [r5, #0]
  if (!*output) {
  c8:	b180      	cbz	r0, ec <_Z9read_filePKc+0x64>
	return __fread_chk (__ptr, __bos0 (__ptr), __size, __n, __stream);

      if (__size * __n > __bos0 (__ptr))
	return __fread_chk_warn (__ptr, __bos0 (__ptr), __size, __n, __stream);
    }
  return __fread_alias (__ptr, __size, __n, __stream);
  ca:	4631      	mov	r1, r6
  cc:	4623      	mov	r3, r4
  ce:	2201      	movs	r2, #1
  d0:	f7ff fffe 	bl	0 <fread>
    fclose(fp);
    printf("mem allocate failure:%s",name);
    exit(-1);
  }

  if(!fread(*output, size, 1, fp)) printf("failed to read file\n");
  d4:	b928      	cbnz	r0, 66 <_Z20print_clbuild_errorsP11_cl_programP13_cl_device_id+0x52>
}

__fortify_function int
printf (const char *__restrict __fmt, ...)
{
  return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
  d6:	f240 0000 	movw	r0, #0
  da:	f2c0 0000 	movt	r0, #0
  de:	f7ff fffe 	bl	0 <puts>
  fclose(fp);
  e2:	4620      	mov	r0, r4
  e4:	f7ff fffe 	bl	0 <fclose>
  return output;
}
  e8:	4628      	mov	r0, r5
  ea:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
  size = ftell(fp);
  fseek(fp, 0, SEEK_SET);

  *output = (unsigned char *)malloc(size);
  if (!*output) {
    fclose(fp);
  ec:	4620      	mov	r0, r4
  ee:	f7ff fffe 	bl	0 <fclose>
  f2:	463a      	mov	r2, r7
  f4:	f240 0100 	movw	r1, #0
  f8:	2001      	movs	r0, #1
  fa:	f2c0 0100 	movt	r1, #0
  fe:	f7ff fffe 	bl	0 <__printf_chk>
    printf("mem allocate failure:%s",name);
    exit(-1);
 102:	f04f 30ff 	mov.w	r0, #4294967295
 106:	f7ff fffe 	bl	0 <exit>
 10a:	463a      	mov	r2, r7
 10c:	f240 0100 	movw	r1, #0
 110:	2001      	movs	r0, #1
 112:	f2c0 0100 	movt	r1, #0
 116:	f7ff fffe 	bl	0 <__printf_chk>
  size_t size;
  unsigned char **output=(unsigned char **)malloc(sizeof(unsigned char *));
  FILE* fp = fopen(name, "rb");
  if (!fp) {
    printf("no such file:%s",name);
    exit(-1);
 11a:	f04f 30ff 	mov.w	r0, #4294967295
 11e:	f7ff fffe 	bl	0 <exit>
 122:	bf00      	nop

00000124 <_Z9time_diff7timevalS_>:
  if(!fread(*output, size, 1, fp)) printf("failed to read file\n");
  fclose(fp);
  return output;
}
long time_diff(struct timeval x , struct timeval y)
{
 124:	b510      	push	{r4, lr}
 126:	b084      	sub	sp, #16
 128:	f10d 0e10 	add.w	lr, sp, #16
 12c:	e88d 000c 	stmia.w	sp, {r2, r3}
    x_ms = (long)x.tv_sec*1000000 + (long)x.tv_usec;
    y_ms = (long)y.tv_sec*1000000 + (long)y.tv_usec;

    diff = (double)y_ms - (double)x_ms;

    return diff;
 130:	4613      	mov	r3, r2
 132:	9c01      	ldr	r4, [sp, #4]
  if(!fread(*output, size, 1, fp)) printf("failed to read file\n");
  fclose(fp);
  return output;
}
long time_diff(struct timeval x , struct timeval y)
{
 134:	e90e 0003 	stmdb	lr, {r0, r1}
    x_ms = (long)x.tv_sec*1000000 + (long)x.tv_usec;
    y_ms = (long)y.tv_sec*1000000 + (long)y.tv_usec;

    diff = (double)y_ms - (double)x_ms;

    return diff;
 138:	f244 2040 	movw	r0, #16960	; 0x4240
 13c:	f2c0 000f 	movt	r0, #15
 140:	9902      	ldr	r1, [sp, #8]
 142:	9a03      	ldr	r2, [sp, #12]
 144:	fb00 4303 	mla	r3, r0, r3, r4
 148:	fb00 2101 	mla	r1, r0, r1, r2
 14c:	ee07 3a90 	vmov	s15, r3
 150:	eef8 0be7 	vcvt.f64.s32	d16, s15
 154:	ee07 1a90 	vmov	s15, r1
 158:	eef8 1be7 	vcvt.f64.s32	d17, s15
 15c:	ee70 0be1 	vsub.f64	d16, d16, d17
}
 160:	eefd 7be0 	vcvt.s32.f64	s15, d16
 164:	ee17 0a90 	vmov	r0, s15
 168:	b004      	add	sp, #16
 16a:	bd10      	pop	{r4, pc}

0000016c <_Z10checkErroriPKc>:
     fwrite(buffer, 1, length, stdout);
}


void checkError(int status, const char *msg) {
	if(status!=CL_SUCCESS)
 16c:	b900      	cbnz	r0, 170 <_Z10checkErroriPKc+0x4>
 16e:	4770      	bx	lr
 170:	4608      	mov	r0, r1
 172:	f7ff bffe 	b.w	0 <puts>
 176:	bf00      	nop

00000178 <_Z10rand_floatv>:
		printf("%s\n",msg);
}

// Randomly generate a floating-point number between -10 and 10.
float rand_float() {
 178:	b508      	push	{r3, lr}
  return float(rand()) / float(RAND_MAX) * 20.0f - 10.0f;
 17a:	f7ff fffe 	bl	0 <rand>
 17e:	eef3 7a04 	vmov.f32	s15, #52	; 0x41a00000  20.0
 182:	eeb2 0a04 	vmov.f32	s0, #36	; 0x41200000  10.0
 186:	ee07 0a10 	vmov	s14, r0
 18a:	eeba 7ae0 	vcvt.f32.s32	s14, s14, #31
}
 18e:	ee17 0a27 	vnmls.f32	s0, s14, s15
 192:	bd08      	pop	{r3, pc}

Disassembly of section .text.startup:

00000000 <main>:
    return diff;
}

void callback(const char *buffer, size_t length, size_t final, void *user_data)
{
     fwrite(buffer, 1, length, stdout);
   0:	e92d 4ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
   4:	f240 0400 	movw	r4, #0
   8:	ed2d 8b04 	vpush	{d8-d9}
   c:	f2c0 0400 	movt	r4, #0
  10:	f240 0a00 	movw	sl, #0




void print_clbuild_errors(cl_program program,cl_device_id device)
	{
  14:	f2c0 0a00 	movt	sl, #0
  18:	cc0f      	ldmia	r4!, {r0, r1, r2, r3}
  1a:	eeb3 9a04 	vmov.f32	s18, #52	; 0x41a00000  20.0
		cout<<"Program Build failed\n";
  1e:	f2ad 4d94 	subw	sp, sp, #1172	; 0x494




void print_clbuild_errors(cl_program program,cl_device_id device)
	{
  22:	f8da 6000 	ldr.w	r6, [sl]
		cout<<"Program Build failed\n";
  26:	ad1c      	add	r5, sp, #112	; 0x70




void print_clbuild_errors(cl_program program,cl_device_id device)
	{
  28:	eddf 8acc 	vldr	s17, [pc, #816]	; 35c <main+0x35c>
  2c:	c50f      	stmia	r5!, {r0, r1, r2, r3}
  2e:	e894 0007 	ldmia.w	r4, {r0, r1, r2}
		cout<<"Program Build failed\n";
  32:	f8cd 648c 	str.w	r6, [sp, #1164]	; 0x48c
  36:	eeb2 8a04 	vmov.f32	s16, #36	; 0x41200000  10.0
		size_t length;
		char buffer[2048];
		clGetProgramBuildInfo(program, device, CL_PROGRAM_BUILD_LOG, sizeof(buffer), buffer, &length);
  3a:	e885 0007 	stmia.w	r5, {r0, r1, r2}




void print_clbuild_errors(cl_program program,cl_device_id device)
	{
  3e:	f44f 1080 	mov.w	r0, #1048576	; 0x100000
		cout<<"Program Build failed\n";
  42:	f7ff fffe 	bl	0 <malloc>
		size_t length;
		char buffer[2048];
		clGetProgramBuildInfo(program, device, CL_PROGRAM_BUILD_LOG, sizeof(buffer), buffer, &length);
  46:	4680      	mov	r8, r0
  48:	f44f 1080 	mov.w	r0, #1048576	; 0x100000
  4c:	f7ff fffe 	bl	0 <malloc>
  50:	f508 6400 	add.w	r4, r8, #2048	; 0x800
  54:	4645      	mov	r5, r8
  56:	4607      	mov	r7, r0
  58:	f44f 1080 	mov.w	r0, #1048576	; 0x100000
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
	__out.setstate(ios_base::badbit);
      else
	__ostream_insert(__out, __s,
  5c:	f7ff fffe 	bl	0 <malloc>
  60:	463e      	mov	r6, r7
  62:	9007      	str	r0, [sp, #28]
  64:	f44f 1080 	mov.w	r0, #1048576	; 0x100000
  68:	f7ff fffe 	bl	0 <malloc>
  6c:	9009      	str	r0, [sp, #36]	; 0x24
  6e:	f7ff fffe 	bl	0 <rand>
  72:	eeb0 7a48 	vmov.f32	s14, s16
  76:	ee07 0a90 	vmov	s15, r0
      operator<<(__ostream_type& (*__pf)(__ostream_type&))
      {
	// _GLIBCXX_RESOLVE_LIB_DEFECTS
	// DR 60. What is a formatted input function?
	// The inserters for manipulators are *not* formatted output functions.
	return __pf(*this);
  7a:	eef8 7ae7 	vcvt.f32.s32	s15, s15
  7e:	ee67 7aa8 	vmul.f32	s15, s15, s17
		cout<<"--- Build log ---\n "<<buffer<<endl;
		exit(1);
  82:	ee17 7a89 	vnmls.f32	s14, s15, s18
  86:	eca5 7a01 	vstmia	r5!, {s14}
	}
unsigned char ** read_file(const char *name) {
  8a:	f7ff fffe 	bl	0 <rand>
  size_t size;
  unsigned char **output=(unsigned char **)malloc(sizeof(unsigned char *));
  8e:	eeb0 7a48 	vmov.f32	s14, s16
  FILE* fp = fopen(name, "rb");
  92:	42ac      	cmp	r4, r5
  94:	ee07 0a90 	vmov	s15, r0
  98:	eef8 7ae7 	vcvt.f32.s32	s15, s15
  9c:	ee67 7aa8 	vmul.f32	s15, s15, s17
  a0:	ee17 7a89 	vnmls.f32	s14, s15, s18
  if (!fp) {
  a4:	eca6 7a01 	vstmia	r6!, {s14}
    printf("no such file:%s",name);
    exit(-1);
  }

  fseek(fp, 0, SEEK_END);
  a8:	d1e1      	bne.n	6e <main+0x6e>
  aa:	2100      	movs	r1, #0
  ac:	a814      	add	r0, sp, #80	; 0x50
  size = ftell(fp);
  ae:	f7ff fffe 	bl	0 <gettimeofday>
  b2:	9a09      	ldr	r2, [sp, #36]	; 0x24
  fseek(fp, 0, SEEK_SET);
  b4:	f502 1e80 	add.w	lr, r2, #1048576	; 0x100000
    printf("no such file:%s",name);
    exit(-1);
  }

  fseek(fp, 0, SEEK_END);
  size = ftell(fp);
  b8:	f502 6500 	add.w	r5, r2, #2048	; 0x800
  fseek(fp, 0, SEEK_SET);
  bc:	f50e 6e00 	add.w	lr, lr, #2048	; 0x800

  *output = (unsigned char *)malloc(size);
  c0:	f5a5 6100 	sub.w	r1, r5, #2048	; 0x800
  c4:	f5a4 6600 	sub.w	r6, r4, #2048	; 0x800
  if (!*output) {
  c8:	4638      	mov	r0, r7
	return __fread_chk (__ptr, __bos0 (__ptr), __size, __n, __stream);

      if (__size * __n > __bos0 (__ptr))
	return __fread_chk_warn (__ptr, __bos0 (__ptr), __size, __n, __stream);
    }
  return __fread_alias (__ptr, __size, __n, __stream);
  ca:	edd1 7a00 	vldr	s15, [r1]
  ce:	4632      	mov	r2, r6
  d0:	4603      	mov	r3, r0
  d2:	ecf2 6a01 	vldmia	r2!, {s13}
}

__fortify_function int
printf (const char *__restrict __fmt, ...)
{
  return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
  d6:	ed93 7a00 	vldr	s14, [r3]
  da:	f503 6300 	add.w	r3, r3, #2048	; 0x800
  de:	4294      	cmp	r4, r2
  e0:	ee46 7a87 	vmla.f32	s15, s13, s14
    printf("mem allocate failure:%s",name);
    exit(-1);
  }

  if(!fread(*output, size, 1, fp)) printf("failed to read file\n");
  fclose(fp);
  e4:	d1f5      	bne.n	d2 <main+0xd2>
  e6:	ece1 7a01 	vstmia	r1!, {s15}
  return output;
}
  ea:	3004      	adds	r0, #4
  size = ftell(fp);
  fseek(fp, 0, SEEK_SET);

  *output = (unsigned char *)malloc(size);
  if (!*output) {
    fclose(fp);
  ec:	42a9      	cmp	r1, r5
  ee:	d1ec      	bne.n	ca <main+0xca>
  f0:	f501 6500 	add.w	r5, r1, #2048	; 0x800
  f4:	f504 6400 	add.w	r4, r4, #2048	; 0x800
  f8:	4575      	cmp	r5, lr
  fa:	d1e1      	bne.n	c0 <main+0xc0>
  fc:	2100      	movs	r1, #0
  fe:	a812      	add	r0, sp, #72	; 0x48
 100:	460c      	mov	r4, r1
    printf("mem allocate failure:%s",name);
    exit(-1);
 102:	f7ff fffe 	bl	0 <gettimeofday>
 106:	9d13      	ldr	r5, [sp, #76]	; 0x4c
 108:	f244 2640 	movw	r6, #16960	; 0x4240
 10c:	9b12      	ldr	r3, [sp, #72]	; 0x48
 10e:	f2c0 060f 	movt	r6, #15
 112:	9815      	ldr	r0, [sp, #84]	; 0x54
 114:	f240 0100 	movw	r1, #0
 118:	9a14      	ldr	r2, [sp, #80]	; 0x50
  size_t size;
  unsigned char **output=(unsigned char **)malloc(sizeof(unsigned char *));
  FILE* fp = fopen(name, "rb");
  if (!fp) {
    printf("no such file:%s",name);
    exit(-1);
 11a:	f2c0 0100 	movt	r1, #0
 11e:	fb06 5303 	mla	r3, r6, r3, r5
 122:	f10d 0b2c 	add.w	fp, sp, #44	; 0x2c
  if(!fread(*output, size, 1, fp)) printf("failed to read file\n");
  fclose(fp);
  return output;
}
long time_diff(struct timeval x , struct timeval y)
{
 126:	fb06 0202 	mla	r2, r6, r2, r0
 12a:	2001      	movs	r0, #1
 12c:	4606      	mov	r6, r0
 12e:	ee07 3a90 	vmov	s15, r3
    x_ms = (long)x.tv_sec*1000000 + (long)x.tv_usec;
    y_ms = (long)y.tv_sec*1000000 + (long)y.tv_usec;

    diff = (double)y_ms - (double)x_ms;

    return diff;
 132:	eef8 0be7 	vcvt.f64.s32	d16, s15
  if(!fread(*output, size, 1, fp)) printf("failed to read file\n");
  fclose(fp);
  return output;
}
long time_diff(struct timeval x , struct timeval y)
{
 136:	ee07 2a90 	vmov	s15, r2
    x_ms = (long)x.tv_sec*1000000 + (long)x.tv_usec;
    y_ms = (long)y.tv_sec*1000000 + (long)y.tv_usec;

    diff = (double)y_ms - (double)x_ms;

    return diff;
 13a:	eef8 1be7 	vcvt.f64.s32	d17, s15
 13e:	ee70 0be1 	vsub.f64	d16, d16, d17
 142:	eefd 7be0 	vcvt.s32.f64	s15, d16
 146:	ee17 2a90 	vmov	r2, s15
 14a:	f7ff fffe 	bl	0 <__printf_chk>
 14e:	a90a      	add	r1, sp, #40	; 0x28
 150:	4622      	mov	r2, r4
 152:	4630      	mov	r0, r6
 154:	f7ff fffe 	bl	0 <clGetPlatformIDs>
 158:	ab23      	add	r3, sp, #140	; 0x8c
 15a:	f44f 6280 	mov.w	r2, #1024	; 0x400
 15e:	f640 1102 	movw	r1, #2306	; 0x902
}
 162:	980a      	ldr	r0, [sp, #40]	; 0x28
 164:	9400      	str	r4, [sp, #0]
 166:	f7ff fffe 	bl	0 <clGetPlatformInfo>
 16a:	ab23      	add	r3, sp, #140	; 0x8c
     fwrite(buffer, 1, length, stdout);
}


void checkError(int status, const char *msg) {
	if(status!=CL_SUCCESS)
 16c:	f240 0200 	movw	r2, #0
 170:	f240 0100 	movw	r1, #0
 174:	f2c0 0200 	movt	r2, #0
		printf("%s\n",msg);
}

// Randomly generate a floating-point number between -10 and 10.
float rand_float() {
 178:	f2c0 0100 	movt	r1, #0
  return float(rand()) / float(RAND_MAX) * 20.0f - 10.0f;
 17c:	4630      	mov	r0, r6
 17e:	f7ff fffe 	bl	0 <__printf_chk>
 182:	ab23      	add	r3, sp, #140	; 0x8c
 184:	f44f 6280 	mov.w	r2, #1024	; 0x400
 188:	f640 1103 	movw	r1, #2307	; 0x903
 18c:	980a      	ldr	r0, [sp, #40]	; 0x28
}
 18e:	9400      	str	r4, [sp, #0]
 190:	f7ff fffe 	bl	0 <clGetPlatformInfo>
 194:	ab23      	add	r3, sp, #140	; 0x8c
 196:	f240 0200 	movw	r2, #0
 19a:	f240 0100 	movw	r1, #0
 19e:	f2c0 0200 	movt	r2, #0
 1a2:	f2c0 0100 	movt	r1, #0
 1a6:	4630      	mov	r0, r6
 1a8:	f7ff fffe 	bl	0 <__printf_chk>
 1ac:	ab23      	add	r3, sp, #140	; 0x8c
 1ae:	f44f 6280 	mov.w	r2, #1024	; 0x400
 1b2:	f640 1101 	movw	r1, #2305	; 0x901
 1b6:	980a      	ldr	r0, [sp, #40]	; 0x28
 1b8:	9400      	str	r4, [sp, #0]
 1ba:	f7ff fffe 	bl	0 <clGetPlatformInfo>
 1be:	ab23      	add	r3, sp, #140	; 0x8c
 1c0:	f240 0200 	movw	r2, #0
 1c4:	f240 0100 	movw	r1, #0
 1c8:	f2c0 0200 	movt	r2, #0
 1cc:	f2c0 0100 	movt	r1, #0
 1d0:	4630      	mov	r0, r6
 1d2:	f7ff fffe 	bl	0 <__printf_chk>

int main()
{
 1d6:	990a      	ldr	r1, [sp, #40]	; 0x28
     {
          CL_CONTEXT_PLATFORM, 0,
          CL_PRINTF_CALLBACK_ARM, (cl_context_properties)callback,
          CL_PRINTF_BUFFERSIZE_ARM, 0x1000,
          0
     };
 1d8:	2204      	movs	r2, #4
 1da:	2300      	movs	r3, #0
float rand_float() {
  return float(rand()) / float(RAND_MAX) * 20.0f - 10.0f;
}

int main()
{
 1dc:	9402      	str	r4, [sp, #8]
 1de:	4608      	mov	r0, r1
     {
          CL_CONTEXT_PLATFORM, 0,
          CL_PRINTF_CALLBACK_ARM, (cl_context_properties)callback,
          CL_PRINTF_BUFFERSIZE_ARM, 0x1000,
          0
     };
 1e0:	f8cd b004 	str.w	fp, [sp, #4]
float rand_float() {
  return float(rand()) / float(RAND_MAX) * 20.0f - 10.0f;
}

int main()
{
 1e4:	9600      	str	r6, [sp, #0]
 1e6:	911d      	str	r1, [sp, #116]	; 0x74
 1e8:	f7ff fffe 	bl	0 <clGetDeviceIDs>
     {
          CL_CONTEXT_PLATFORM, 0,
          CL_PRINTF_CALLBACK_ARM, (cl_context_properties)callback,
          CL_PRINTF_BUFFERSIZE_ARM, 0x1000,
          0
     };
 1ec:	4623      	mov	r3, r4
int status;

	struct timeval stop, start;

	for(unsigned long j = 0; j < N; ++j) {
	      input_a[j] = rand_float();
 1ee:	465a      	mov	r2, fp
 1f0:	4631      	mov	r1, r6
float rand_float() {
  return float(rand()) / float(RAND_MAX) * 20.0f - 10.0f;
}

int main()
{
 1f2:	9401      	str	r4, [sp, #4]
 1f4:	a81c      	add	r0, sp, #112	; 0x70
 1f6:	9400      	str	r4, [sp, #0]
 1f8:	f7ff fffe 	bl	0 <clCreateContext>
int status;

	struct timeval stop, start;

	for(unsigned long j = 0; j < N; ++j) {
	      input_a[j] = rand_float();
 1fc:	f8db 1000 	ldr.w	r1, [fp]
     {
          CL_CONTEXT_PLATFORM, 0,
          CL_PRINTF_CALLBACK_ARM, (cl_context_properties)callback,
          CL_PRINTF_BUFFERSIZE_ARM, 0x1000,
          0
     };
 200:	2200      	movs	r2, #0
 202:	2300      	movs	r3, #0
 204:	9400      	str	r4, [sp, #0]
float rand_float() {
  return float(rand()) / float(RAND_MAX) * 20.0f - 10.0f;
}

int main()
{
 206:	4681      	mov	r9, r0
 208:	f7ff fffe 	bl	0 <clCreateCommandQueue>
int status;

	struct timeval stop, start;

	for(unsigned long j = 0; j < N; ++j) {
	      input_a[j] = rand_float();
 20c:	4605      	mov	r5, r0
     {
          CL_CONTEXT_PLATFORM, 0,
          CL_PRINTF_CALLBACK_ARM, (cl_context_properties)callback,
          CL_PRINTF_BUFFERSIZE_ARM, 0x1000,
          0
     };
 20e:	f240 0000 	movw	r0, #0


//--------------------------------------------------------------------
const unsigned long N = 512;// max 50000000
const char* openCLOption = "-cl-no-signed-zeros -cl-fast-relaxed-math -cl-mad-enable";
float *input_a=(float *) malloc(sizeof(float)*N*N);
 212:	f2c0 0000 	movt	r0, #0
 216:	f7ff fffe 	bl	88 <main+0x88>
 21a:	9400      	str	r4, [sp, #0]
float *input_b=(float *) malloc(sizeof(float)*N*N);
 21c:	4623      	mov	r3, r4
 21e:	4631      	mov	r1, r6
 220:	4602      	mov	r2, r0
 222:	4648      	mov	r0, r9
 224:	f7ff fffe 	bl	0 <clCreateProgramWithSource>
 228:	9008      	str	r0, [sp, #32]
 22a:	2800      	cmp	r0, #0
float *output=(float *) malloc(sizeof(float)*N*N);
 22c:	f000 81a7 	beq.w	57e <main+0x57e>
 230:	9401      	str	r4, [sp, #4]
 232:	4622      	mov	r2, r4
float *ref_output=(float *) malloc(sizeof(float)*N*N);
 234:	9400      	str	r4, [sp, #0]
//--------------------------------------------------------------------
const unsigned long N = 512;// max 50000000
const char* openCLOption = "-cl-no-signed-zeros -cl-fast-relaxed-math -cl-mad-enable";
float *input_a=(float *) malloc(sizeof(float)*N*N);
float *input_b=(float *) malloc(sizeof(float)*N*N);
float *output=(float *) malloc(sizeof(float)*N*N);
 236:	4621      	mov	r1, r4
float *ref_output=(float *) malloc(sizeof(float)*N*N);
 238:	f240 0300 	movw	r3, #0
 23c:	f2c0 0300 	movt	r3, #0
 240:	f7ff fffe 	bl	0 <clBuildProgram>
		printf("%s\n",msg);
}

// Randomly generate a floating-point number between -10 and 10.
float rand_float() {
  return float(rand()) / float(RAND_MAX) * 20.0f - 10.0f;
 244:	4604      	mov	r4, r0
int status;

	struct timeval stop, start;

	for(unsigned long j = 0; j < N; ++j) {
	      input_a[j] = rand_float();
 246:	2800      	cmp	r0, #0
 248:	f040 8194 	bne.w	574 <main+0x574>
 24c:	4602      	mov	r2, r0
 24e:	f240 0100 	movw	r1, #0
 252:	9808      	ldr	r0, [sp, #32]
 254:	f2c0 0100 	movt	r1, #0
 258:	f7ff fffe 	bl	0 <clCreateKernel>
 25c:	4621      	mov	r1, r4
		printf("%s\n",msg);
}

// Randomly generate a floating-point number between -10 and 10.
float rand_float() {
  return float(rand()) / float(RAND_MAX) * 20.0f - 10.0f;
 25e:	ac0f      	add	r4, sp, #60	; 0x3c
 260:	4606      	mov	r6, r0

	struct timeval stop, start;

	for(unsigned long j = 0; j < N; ++j) {
	      input_a[j] = rand_float();
	      input_b[j] = rand_float();
 262:	a814      	add	r0, sp, #80	; 0x50
 264:	f7ff fffe 	bl	0 <gettimeofday>
 268:	f44f 1180 	mov.w	r1, #1048576	; 0x100000
 26c:	2300      	movs	r3, #0
 26e:	f8cd 8004 	str.w	r8, [sp, #4]
 272:	9402      	str	r4, [sp, #8]
 274:	220c      	movs	r2, #12
 276:	9100      	str	r1, [sp, #0]
 278:	4648      	mov	r0, r9
 27a:	f7ff fffe 	bl	0 <clCreateBuffer>
	 }

	gettimeofday(&start, NULL);
 27e:	6823      	ldr	r3, [r4, #0]
 280:	900c      	str	r0, [sp, #48]	; 0x30
 282:	b12b      	cbz	r3, 290 <main+0x290>
 284:	f240 0000 	movw	r0, #0
 288:	f2c0 0000 	movt	r0, #0
 28c:	f7ff fffe 	bl	0 <puts>
 290:	f44f 1180 	mov.w	r1, #1048576	; 0x100000
 294:	2300      	movs	r3, #0
 296:	9402      	str	r4, [sp, #8]
 298:	220c      	movs	r2, #12
 29a:	9701      	str	r7, [sp, #4]
const unsigned long N = 512;// max 50000000
const char* openCLOption = "-cl-no-signed-zeros -cl-fast-relaxed-math -cl-mad-enable";
float *input_a=(float *) malloc(sizeof(float)*N*N);
float *input_b=(float *) malloc(sizeof(float)*N*N);
float *output=(float *) malloc(sizeof(float)*N*N);
float *ref_output=(float *) malloc(sizeof(float)*N*N);
 29c:	4648      	mov	r0, r9
 29e:	9100      	str	r1, [sp, #0]
 2a0:	f7ff fffe 	bl	0 <clCreateBuffer>
 2a4:	6823      	ldr	r3, [r4, #0]
	float* current;
	for(unsigned i = 0; i < N; ++i) {
		for(unsigned j = 0; j < N; ++j) {
	      current = &ref_output[N*i+j];
				for(unsigned z = 0; z < N; ++z){
					*current += input_a[N*i+z]*input_b[N*z+j];
 2a6:	900d      	str	r0, [sp, #52]	; 0x34
 2a8:	b12b      	cbz	r3, 2b6 <main+0x2b6>
 2aa:	f240 0000 	movw	r0, #0
 2ae:	f2c0 0000 	movt	r0, #0
	//CPU PROCESSING
	float* current;
	for(unsigned i = 0; i < N; ++i) {
		for(unsigned j = 0; j < N; ++j) {
	      current = &ref_output[N*i+j];
				for(unsigned z = 0; z < N; ++z){
 2b2:	f7ff fffe 	bl	0 <puts>
					*current += input_a[N*i+z]*input_b[N*z+j];
 2b6:	9b07      	ldr	r3, [sp, #28]
	//CPU PROCESSING
	float* current;
	for(unsigned i = 0; i < N; ++i) {
		for(unsigned j = 0; j < N; ++j) {
	      current = &ref_output[N*i+j];
				for(unsigned z = 0; z < N; ++z){
 2b8:	f44f 1180 	mov.w	r1, #1048576	; 0x100000
 2bc:	9402      	str	r4, [sp, #8]
 2be:	220a      	movs	r2, #10

	gettimeofday(&start, NULL);
	//CPU PROCESSING
	float* current;
	for(unsigned i = 0; i < N; ++i) {
		for(unsigned j = 0; j < N; ++j) {
 2c0:	9100      	str	r1, [sp, #0]
 2c2:	4648      	mov	r0, r9
 2c4:	9301      	str	r3, [sp, #4]
 2c6:	2300      	movs	r3, #0
 2c8:	f7ff fffe 	bl	0 <clCreateBuffer>
	 }

	gettimeofday(&start, NULL);
	//CPU PROCESSING
	float* current;
	for(unsigned i = 0; i < N; ++i) {
 2cc:	6823      	ldr	r3, [r4, #0]
 2ce:	900e      	str	r0, [sp, #56]	; 0x38
	      	
	    }
		}
		//END OF CPU PROCESSING

	gettimeofday(&stop, NULL);
 2d0:	b12b      	cbz	r3, 2de <main+0x2de>
 2d2:	f240 0000 	movw	r0, #0
 2d6:	f2c0 0000 	movt	r0, #0
 2da:	f7ff fffe 	bl	0 <puts>
 2de:	2000      	movs	r0, #0
 2e0:	f44f 1e80 	mov.w	lr, #1048576	; 0x100000
 2e4:	4603      	mov	r3, r0
 2e6:	9003      	str	r0, [sp, #12]
 2e8:	4602      	mov	r2, r0
 2ea:	9002      	str	r0, [sp, #8]
 2ec:	990c      	ldr	r1, [sp, #48]	; 0x30
 2ee:	a816      	add	r0, sp, #88	; 0x58
 2f0:	f8cd 8004 	str.w	r8, [sp, #4]
 2f4:	9004      	str	r0, [sp, #16]
     printf("%-40s = %s\n", "CL_PLATFORM_VENDOR ", char_buffer);
     clGetPlatformInfo(platform, CL_PLATFORM_VERSION, STRING_BUFFER_LEN, char_buffer, NULL);
     printf("%-40s = %s\n\n", "CL_PLATFORM_VERSION ", char_buffer);

     context_properties[1] = (cl_context_properties)platform;
     clGetDeviceIDs(platform, CL_DEVICE_TYPE_GPU, 1, &device, NULL);
 2f6:	4628      	mov	r0, r5
 2f8:	f8cd e000 	str.w	lr, [sp]
 2fc:	f7ff fffe 	bl	0 <clEnqueueWriteBuffer>
 300:	6020      	str	r0, [r4, #0]
 302:	b128      	cbz	r0, 310 <main+0x310>
 304:	f240 0000 	movw	r0, #0
 308:	f2c0 0000 	movt	r0, #0
 30c:	f7ff fffe 	bl	0 <puts>
 310:	2000      	movs	r0, #0
 312:	990d      	ldr	r1, [sp, #52]	; 0x34
 314:	4603      	mov	r3, r0
 316:	9003      	str	r0, [sp, #12]
 318:	4602      	mov	r2, r0
 31a:	9002      	str	r0, [sp, #8]
 31c:	9701      	str	r7, [sp, #4]
 31e:	a817      	add	r0, sp, #92	; 0x5c
 320:	9004      	str	r0, [sp, #16]

	gettimeofday(&stop, NULL);

		printf ("CPU took %lu us to run.\n", time_diff(start, stop ));

     clGetPlatformIDs(1, &platform, NULL);
 322:	f44f 1080 	mov.w	r0, #1048576	; 0x100000
 326:	9000      	str	r0, [sp, #0]
 328:	4628      	mov	r0, r5
 32a:	f7ff fffe 	bl	0 <clEnqueueWriteBuffer>
     clGetPlatformInfo(platform, CL_PLATFORM_NAME, STRING_BUFFER_LEN, char_buffer, NULL);
 32e:	6020      	str	r0, [r4, #0]
 330:	b128      	cbz	r0, 33e <main+0x33e>
 332:	f240 0000 	movw	r0, #0
 336:	f2c0 0000 	movt	r0, #0
 33a:	f7ff fffe 	bl	0 <puts>
 33e:	ab0c      	add	r3, sp, #48	; 0x30
 340:	2204      	movs	r2, #4
 342:	2100      	movs	r1, #0
 344:	4630      	mov	r0, r6
 346:	f7ff fffe 	bl	0 <clSetKernelArg>
 34a:	6020      	str	r0, [r4, #0]
 34c:	b140      	cbz	r0, 360 <main+0x360>
 34e:	f240 0000 	movw	r0, #0
 352:	f2c0 0000 	movt	r0, #0
     printf("%-40s = %s\n", "CL_PLATFORM_NAME", char_buffer);
     clGetPlatformInfo(platform, CL_PLATFORM_VENDOR, STRING_BUFFER_LEN, char_buffer, NULL);
 356:	f7ff fffe 	bl	0 <puts>
 35a:	e001      	b.n	360 <main+0x360>
 35c:	30000000 	.word	0x30000000
 360:	ab0d      	add	r3, sp, #52	; 0x34
 362:	2204      	movs	r2, #4
 364:	2101      	movs	r1, #1
 366:	4630      	mov	r0, r6
 368:	f7ff fffe 	bl	0 <clSetKernelArg>
 36c:	6020      	str	r0, [r4, #0]
 36e:	b128      	cbz	r0, 37c <main+0x37c>
 370:	f240 0000 	movw	r0, #0
 374:	f2c0 0000 	movt	r0, #0
 378:	f7ff fffe 	bl	0 <puts>
 37c:	ab0e      	add	r3, sp, #56	; 0x38
 37e:	2204      	movs	r2, #4
     printf("%-40s = %s\n", "CL_PLATFORM_VENDOR ", char_buffer);
     clGetPlatformInfo(platform, CL_PLATFORM_VERSION, STRING_BUFFER_LEN, char_buffer, NULL);
 380:	2102      	movs	r1, #2
 382:	4630      	mov	r0, r6
 384:	f7ff fffe 	bl	0 <clSetKernelArg>
 388:	6020      	str	r0, [r4, #0]
 38a:	b128      	cbz	r0, 398 <main+0x398>
 38c:	f240 0000 	movw	r0, #0
 390:	f2c0 0000 	movt	r0, #0
 394:	f7ff fffe 	bl	0 <puts>
 398:	4628      	mov	r0, r5
 39a:	f10d 0860 	add.w	r8, sp, #96	; 0x60
 39e:	f7ff fffe 	bl	0 <clFinish>
 3a2:	2100      	movs	r1, #0
 3a4:	a812      	add	r0, sp, #72	; 0x48
 3a6:	af1a      	add	r7, sp, #104	; 0x68
 3a8:	f7ff fffe 	bl	0 <gettimeofday>
     printf("%-40s = %s\n\n", "CL_PLATFORM_VERSION ", char_buffer);

     context_properties[1] = (cl_context_properties)platform;
     clGetDeviceIDs(platform, CL_DEVICE_TYPE_GPU, 1, &device, NULL);
 3ac:	9813      	ldr	r0, [sp, #76]	; 0x4c
 3ae:	9b12      	ldr	r3, [sp, #72]	; 0x48
 3b0:	f244 2e40 	movw	lr, #16960	; 0x4240
 3b4:	f2c0 0e0f 	movt	lr, #15
 3b8:	9915      	ldr	r1, [sp, #84]	; 0x54
     clGetPlatformInfo(platform, CL_PLATFORM_VENDOR, STRING_BUFFER_LEN, char_buffer, NULL);
     printf("%-40s = %s\n", "CL_PLATFORM_VENDOR ", char_buffer);
     clGetPlatformInfo(platform, CL_PLATFORM_VERSION, STRING_BUFFER_LEN, char_buffer, NULL);
     printf("%-40s = %s\n\n", "CL_PLATFORM_VERSION ", char_buffer);

     context_properties[1] = (cl_context_properties)platform;
 3ba:	9a14      	ldr	r2, [sp, #80]	; 0x50
     clGetDeviceIDs(platform, CL_DEVICE_TYPE_GPU, 1, &device, NULL);
 3bc:	fb0e 0303 	mla	r3, lr, r3, r0
     context = clCreateContext(context_properties, 1, &device, NULL, NULL, NULL);
 3c0:	2001      	movs	r0, #1
 3c2:	fb0e 1202 	mla	r2, lr, r2, r1
 3c6:	f240 0100 	movw	r1, #0
 3ca:	f2c0 0100 	movt	r1, #0
 3ce:	ee07 3a90 	vmov	s15, r3
     queue = clCreateCommandQueue(context, device, 0, NULL);
 3d2:	eef8 0be7 	vcvt.f64.s32	d16, s15
 3d6:	ee07 2a90 	vmov	s15, r2
     clGetPlatformInfo(platform, CL_PLATFORM_VERSION, STRING_BUFFER_LEN, char_buffer, NULL);
     printf("%-40s = %s\n\n", "CL_PLATFORM_VERSION ", char_buffer);

     context_properties[1] = (cl_context_properties)platform;
     clGetDeviceIDs(platform, CL_DEVICE_TYPE_GPU, 1, &device, NULL);
     context = clCreateContext(context_properties, 1, &device, NULL, NULL, NULL);
 3da:	eef8 1be7 	vcvt.f64.s32	d17, s15
     queue = clCreateCommandQueue(context, device, 0, NULL);
 3de:	ee70 0be1 	vsub.f64	d16, d16, d17

     unsigned char **opencl_program=read_file("vector_add.cl");
 3e2:	eefd 7be0 	vcvt.s32.f64	s15, d16
 3e6:	ee17 2a90 	vmov	r2, s15
 3ea:	f7ff fffe 	bl	0 <__printf_chk>
     program = clCreateProgramWithSource(context, 1, (const char **)opencl_program, NULL, NULL);
 3ee:	4b76      	ldr	r3, [pc, #472]	; (5c8 <main+0x5c8>)
 3f0:	f103 0208 	add.w	r2, r3, #8
 3f4:	e893 0003 	ldmia.w	r3, {r0, r1}
 3f8:	e888 0003 	stmia.w	r8, {r0, r1}
     if (program == NULL)
 3fc:	e892 0003 	ldmia.w	r2, {r0, r1}
 400:	e887 0003 	stmia.w	r7, {r0, r1}
	{
         printf("Program creation failed\n");
         return 1;
	}
     int success=clBuildProgram(program, 0, NULL, openCLOption, NULL, NULL);
 404:	2100      	movs	r1, #0
 406:	a814      	add	r0, sp, #80	; 0x50
 408:	f7ff fffe 	bl	0 <gettimeofday>
 40c:	2002      	movs	r0, #2
 40e:	4602      	mov	r2, r0
 410:	2300      	movs	r3, #0
 412:	9701      	str	r7, [sp, #4]
 414:	a916      	add	r1, sp, #88	; 0x58
 416:	9002      	str	r0, [sp, #8]
	 if(success!=CL_SUCCESS) print_clbuild_errors(program,device);
 418:	af10      	add	r7, sp, #64	; 0x40
 41a:	9103      	str	r1, [sp, #12]
 41c:	4628      	mov	r0, r5
 41e:	4631      	mov	r1, r6
     kernel = clCreateKernel(program, "matrix_mul", NULL);
 420:	f8cd 8000 	str.w	r8, [sp]
 424:	9704      	str	r7, [sp, #16]
 426:	f7ff fffe 	bl	0 <clEnqueueNDRangeKernel>
 42a:	6020      	str	r0, [r4, #0]
 42c:	4628      	mov	r0, r5
 42e:	f7ff fffe 	bl	0 <clFinish>
 // Input buffers.
 		gettimeofday(&start, NULL);

    input_a_buf = clCreateBuffer(context, CL_MEM_READ_ONLY|CL_MEM_USE_HOST_PTR,
 432:	2100      	movs	r1, #0
         printf("Program creation failed\n");
         return 1;
	}
     int success=clBuildProgram(program, 0, NULL, openCLOption, NULL, NULL);
	 if(success!=CL_SUCCESS) print_clbuild_errors(program,device);
     kernel = clCreateKernel(program, "matrix_mul", NULL);
 434:	a812      	add	r0, sp, #72	; 0x48
 // Input buffers.
 		gettimeofday(&start, NULL);
 436:	f7ff fffe 	bl	0 <gettimeofday>
 43a:	6823      	ldr	r3, [r4, #0]

    input_a_buf = clCreateBuffer(context, CL_MEM_READ_ONLY|CL_MEM_USE_HOST_PTR,
 43c:	b12b      	cbz	r3, 44a <main+0x44a>
 43e:	f240 0000 	movw	r0, #0
 442:	f2c0 0000 	movt	r0, #0
 446:	f7ff fffe 	bl	0 <puts>
 44a:	9813      	ldr	r0, [sp, #76]	; 0x4c
 44c:	f244 2840 	movw	r8, #16960	; 0x4240
 450:	9b12      	ldr	r3, [sp, #72]	; 0x48
     fwrite(buffer, 1, length, stdout);
}


void checkError(int status, const char *msg) {
	if(status!=CL_SUCCESS)
 452:	f2c0 080f 	movt	r8, #15
 456:	9f15      	ldr	r7, [sp, #84]	; 0x54
 458:	f240 0100 	movw	r1, #0
 45c:	9a14      	ldr	r2, [sp, #80]	; 0x50
 45e:	f2c0 0100 	movt	r1, #0
 462:	fb08 0303 	mla	r3, r8, r3, r0

    input_a_buf = clCreateBuffer(context, CL_MEM_READ_ONLY|CL_MEM_USE_HOST_PTR,
       N*N* sizeof(float), input_a, &status);
    checkError(status, "Failed to create buffer for input A");

    input_b_buf = clCreateBuffer(context, CL_MEM_READ_ONLY|CL_MEM_USE_HOST_PTR,
 466:	2001      	movs	r0, #1
 468:	fb08 7202 	mla	r2, r8, r2, r7
 46c:	4683      	mov	fp, r0
 46e:	ee07 3a90 	vmov	s15, r3
 472:	eef8 0be7 	vcvt.f64.s32	d16, s15
 476:	ee07 2a90 	vmov	s15, r2
        N*N* sizeof(float), input_b, &status);
 47a:	eef8 1be7 	vcvt.f64.s32	d17, s15
 47e:	ee70 0be1 	vsub.f64	d16, d16, d17
 482:	eefd 7be0 	vcvt.s32.f64	s15, d16
 486:	ee17 2a90 	vmov	r2, s15
    checkError(status, "Failed to create buffer for input B");


		
    // Output buffer.
    output_buf = clCreateBuffer(context, CL_MEM_WRITE_ONLY|CL_MEM_USE_HOST_PTR,
 48a:	f7ff fffe 	bl	0 <__printf_chk>
 48e:	2100      	movs	r1, #0
 490:	a814      	add	r0, sp, #80	; 0x50
 492:	f7ff fffe 	bl	0 <gettimeofday>
 496:	ab10      	add	r3, sp, #64	; 0x40
 498:	9303      	str	r3, [sp, #12]
 49a:	465a      	mov	r2, fp
 49c:	9b07      	ldr	r3, [sp, #28]
 49e:	f44f 1080 	mov.w	r0, #1048576	; 0x100000
        N*N* sizeof(float), output, &status);
 4a2:	990e      	ldr	r1, [sp, #56]	; 0x38
     fwrite(buffer, 1, length, stdout);
}


void checkError(int status, const char *msg) {
	if(status!=CL_SUCCESS)
 4a4:	9000      	str	r0, [sp, #0]
 4a6:	4628      	mov	r0, r5
 4a8:	9301      	str	r3, [sp, #4]
 4aa:	ab11      	add	r3, sp, #68	; 0x44
 4ac:	f8cd b008 	str.w	fp, [sp, #8]
 4b0:	9304      	str	r3, [sp, #16]
    // Transfer inputs to each device. Each of the host buffers supplied to
    // clEnqueueWriteBuffer here is already aligned to ensure that DMA is used
    // for the host-to-device transfer.
    cl_event write_event[2];
	cl_event kernel_event,finish_event;
    status = clEnqueueWriteBuffer(queue, input_a_buf, CL_FALSE,
 4b2:	2300      	movs	r3, #0
 4b4:	f7ff fffe 	bl	0 <clEnqueueReadBuffer>
 4b8:	2100      	movs	r1, #0
 4ba:	6020      	str	r0, [r4, #0]
 4bc:	a812      	add	r0, sp, #72	; 0x48
 4be:	f7ff fffe 	bl	0 <gettimeofday>
 4c2:	9b12      	ldr	r3, [sp, #72]	; 0x48
 4c4:	9f13      	ldr	r7, [sp, #76]	; 0x4c
 4c6:	4658      	mov	r0, fp
 4c8:	9a14      	ldr	r2, [sp, #80]	; 0x50
 4ca:	f240 0100 	movw	r1, #0
 4ce:	9c15      	ldr	r4, [sp, #84]	; 0x54
 4d0:	f2c0 0100 	movt	r1, #0
         0, N*N* sizeof(float), input_a , 0, NULL, &write_event[0]);
 4d4:	fb08 7303 	mla	r3, r8, r3, r7
 4d8:	fb08 4202 	mla	r2, r8, r2, r4
 4dc:	ee07 3a90 	vmov	s15, r3
 4e0:	eef8 0be7 	vcvt.f64.s32	d16, s15
    checkError(status, "Failed to transfer input A");

    status = clEnqueueWriteBuffer(queue, input_b_buf, CL_FALSE,
 4e4:	ee07 2a90 	vmov	s15, r2
 4e8:	eef8 1be7 	vcvt.f64.s32	d17, s15
 4ec:	ee70 0be1 	vsub.f64	d16, d16, d17
 4f0:	eefd 7be0 	vcvt.s32.f64	s15, d16
 4f4:	ee17 2a90 	vmov	r2, s15
 4f8:	f7ff fffe 	bl	0 <__printf_chk>
 4fc:	ed9f 6a33 	vldr	s12, [pc, #204]	; 5cc <main+0x5cc>
 500:	9907      	ldr	r1, [sp, #28]
        0, N*N* sizeof(float), input_b,0, NULL, &write_event[1]);
 502:	2200      	movs	r2, #0
     fwrite(buffer, 1, length, stdout);
}


void checkError(int status, const char *msg) {
	if(status!=CL_SUCCESS)
 504:	9b09      	ldr	r3, [sp, #36]	; 0x24
 506:	ecf1 7a01 	vldmia	r1!, {s15}
 50a:	ecb3 7a01 	vldmia	r3!, {s14}
 50e:	ee77 6ac7 	vsub.f32	s13, s15, s14
    checkError(status, "Failed to transfer input B");

    // Set kernel arguments.
    unsigned argi = 0;

    status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &input_a_buf);
 512:	eef0 6ae6 	vabs.f32	s13, s13
 516:	eef4 6ac6 	vcmpe.f32	s13, s12
 51a:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 51e:	dc41      	bgt.n	5a4 <main+0x5a4>
     fwrite(buffer, 1, length, stdout);
}


void checkError(int status, const char *msg) {
	if(status!=CL_SUCCESS)
 520:	3201      	adds	r2, #1
 522:	f5b2 2f80 	cmp.w	r2, #262144	; 0x40000
 526:	d1ee      	bne.n	2e8 <main+0x2e8>
 528:	f240 0000 	movw	r0, #0
 52c:	f2c0 0000 	movt	r0, #0
 530:	f7ff fffe 	bl	0 <puts>
    unsigned argi = 0;

    status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &input_a_buf);
    checkError(status, "Failed to set argument 1");

    status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &input_b_buf);
 534:	9816      	ldr	r0, [sp, #88]	; 0x58
 536:	f7ff fffe 	bl	0 <clReleaseEvent>
 53a:	9817      	ldr	r0, [sp, #92]	; 0x5c
 53c:	f7ff fffe 	bl	0 <clReleaseEvent>
 540:	4630      	mov	r0, r6
     fwrite(buffer, 1, length, stdout);
}


void checkError(int status, const char *msg) {
	if(status!=CL_SUCCESS)
 542:	f7ff fffe 	bl	0 <clReleaseKernel>
 546:	4628      	mov	r0, r5
 548:	f7ff fffe 	bl	0 <clReleaseCommandQueue>
 54c:	980c      	ldr	r0, [sp, #48]	; 0x30
 54e:	f7ff fffe 	bl	0 <clReleaseMemObject>
    checkError(status, "Failed to set argument 1");

    status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &input_b_buf);
    checkError(status, "Failed to set argument 2");

    status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &output_buf);
 552:	980d      	ldr	r0, [sp, #52]	; 0x34
 554:	f7ff fffe 	bl	0 <clReleaseMemObject>
 558:	980e      	ldr	r0, [sp, #56]	; 0x38
 55a:	f7ff fffe 	bl	0 <clReleaseMemObject>
     fwrite(buffer, 1, length, stdout);
}


void checkError(int status, const char *msg) {
	if(status!=CL_SUCCESS)
 55e:	9808      	ldr	r0, [sp, #32]
 560:	f7ff fffe 	bl	0 <clReleaseProgram>
 564:	4648      	mov	r0, r9
 566:	f7ff fffe 	bl	0 <clReleaseContext>
 56a:	4628      	mov	r0, r5
    status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &input_b_buf);
    checkError(status, "Failed to set argument 2");

    status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &output_buf);
    checkError(status, "Failed to set argument 2");
		clFinish(queue);
 56c:	f7ff fffe 	bl	0 <clFinish>
		
		gettimeofday(&stop, NULL);
		printf ("GPU buffer operations took %.8lu useconds to run.\n", time_diff(start, stop ));
    const size_t global_work_size[] = {N, N};
 570:	2000      	movs	r0, #0
    status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &input_b_buf);
    checkError(status, "Failed to set argument 2");

    status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &output_buf);
    checkError(status, "Failed to set argument 2");
		clFinish(queue);
 572:	e00b      	b.n	58c <main+0x58c>
 574:	f8db 1000 	ldr.w	r1, [fp]
		
		gettimeofday(&stop, NULL);
 578:	9808      	ldr	r0, [sp, #32]
		printf ("GPU buffer operations took %.8lu useconds to run.\n", time_diff(start, stop ));
    const size_t global_work_size[] = {N, N};
		const size_t work_group_size[] = {16, 16};
 57a:	f7ff fffe 	bl	14 <main+0x14>

    status = clSetKernelArg(kernel, argi++, sizeof(cl_mem), &output_buf);
    checkError(status, "Failed to set argument 2");
		clFinish(queue);
		
		gettimeofday(&stop, NULL);
 57e:	f240 0000 	movw	r0, #0
 582:	f2c0 0000 	movt	r0, #0
 586:	f7ff fffe 	bl	0 <puts>
 58a:	4630      	mov	r0, r6
 58c:	f8dd 248c 	ldr.w	r2, [sp, #1164]	; 0x48c
 590:	f8da 3000 	ldr.w	r3, [sl]
 594:	429a      	cmp	r2, r3
 596:	d115      	bne.n	5c4 <main+0x5c4>
 598:	f20d 4d94 	addw	sp, sp, #1172	; 0x494
 59c:	ecbd 8b04 	vpop	{d8-d9}
 5a0:	e8bd 8ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
 5a4:	eef7 1ac7 	vcvt.f64.f32	d17, s14
 5a8:	f240 0100 	movw	r1, #0
 5ac:	2001      	movs	r0, #1
 5ae:	f2c0 0100 	movt	r1, #0
 5b2:	eef7 0ae7 	vcvt.f64.f32	d16, s15
 5b6:	edcd 1b02 	vstr	d17, [sp, #8]
 5ba:	edcd 0b00 	vstr	d16, [sp]
 5be:	f7ff fffe 	bl	0 <__printf_chk>
		printf ("GPU buffer operations took %.8lu useconds to run.\n", time_diff(start, stop ));
    const size_t global_work_size[] = {N, N};
 5c2:	e7b7      	b.n	ffffff72 <__stack_chk_fail+0xffffff72>
		const size_t work_group_size[] = {16, 16};
 5c4:	f7ff fffe 	bl	0 <__stack_chk_fail>
    checkError(status, "Failed to set argument 2");
		clFinish(queue);
		
		gettimeofday(&stop, NULL);
		printf ("GPU buffer operations took %.8lu useconds to run.\n", time_diff(start, stop ));
    const size_t global_work_size[] = {N, N};
 5c8:	0000001c 	.word	0x0000001c
 5cc:	3727c5ac 	.word	0x3727c5ac

000005d0 <_GLOBAL__sub_I__Z20print_clbuild_errorsP11_cl_programP13_cl_device_id>:
		const size_t work_group_size[] = {16, 16};
 5d0:	b510      	push	{r4, lr}
 5d2:	f240 0400 	movw	r4, #0
 5d6:	f2c0 0400 	movt	r4, #0

		gettimeofday(&start, NULL);
 5da:	4620      	mov	r0, r4
 5dc:	f7ff fffe 	bl	0 <_ZNSt8ios_base4InitC1Ev>

    status = clEnqueueNDRangeKernel(queue, kernel, 2, NULL,
 5e0:	4620      	mov	r0, r4
 5e2:	f240 0200 	movw	r2, #0
 5e6:	f240 0100 	movw	r1, #0
 5ea:	f2c0 0200 	movt	r2, #0
 5ee:	f2c0 0100 	movt	r1, #0
 5f2:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 5f6:	f7ff bffe 	b.w	0 <__aeabi_atexit>
 5fa:	bf00      	nop
