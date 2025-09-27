Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B550CAC5B9
	for <linux-i3c@archiver.kernel.org>; Sat, 27 Sep 2025 06:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6rvRaSakL4hNe9iTgErsZxdRG9DdSqx36yARaOnpd48=; b=TV0huEAE+bJhgp
	a7UdGxFD6+s/GMBqvReS0nU4JUnDM57UyC7bMDo2HEOBPb8XE3CQZLFyDvnOnUZrr1n2Vj2ripok9
	jfimDysOOVefm+zuHQ1Pe1dz5rDbVdptDQm9R3n7iPpqbvvyin+8An8VI1fmTZEKQwlc8cegCPboi
	+/9QRu7ibtNIxDB6kKWfaioMOUMG7KJmKJqghbAu9bZBtCDN76adXw0FNl36VuzUeH7hKWOGqmLrH
	89PZMWhHw97IrWk5Pb1THDlSQZo21heXrcZS8IJDatsI38jjuHUIoiAbRrSTDMt/ZXub9eIAuHG8E
	3n36lf8UeA6QCbcnJByw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2OAq-00000007ZEt-0Fpd;
	Sat, 27 Sep 2025 06:12:48 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2OAl-00000007ZAj-1fPQ
	for linux-i3c@lists.infradead.org;
	Sat, 27 Sep 2025 06:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758953563; x=1790489563;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jDGdeYRSR6G+nLEbsl+K8rRUHVY0iapVzO1DkGOIYOU=;
  b=HsZtXxi060fjcGH1XOO+5DlPYS2GrncgKkMXOAYwPLVCyGaM3dQt3r16
   HTw0jKdGPhxeT9bPgOAbuqWzb4IguvllDNchCtjku3RLus7IBoZmamQq0
   yN/xcDmIBwDvfT2sPFvTpkxZ7aLa1YpEtJrF7o7HLlEl9OFViZZQs6LFe
   QrW0oUvEC/1jInHUimi0yubeMv/USqr/hNGRGHRYlCe7QWLj8TAMEtMsq
   iIBOL8cPCnEXKbu6zFWF8hkUqG/LnC+31ZpaURxhKAPaIPkNus5FzkQh8
   r99Gf2TnD5JWU8mcjuKkHo3GYa25HZZFChaOhukkhKKwZZEkHYZWKSsFO
   Q==;
X-CSE-ConnectionGUID: JXLAxvW+TdKRW3xV28WH1Q==
X-CSE-MsgGUID: iQntp4mzQCuTBji8h05cCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="61326431"
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; 
   d="scan'208";a="61326431"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 23:12:35 -0700
X-CSE-ConnectionGUID: rc5yUXXeTD+tNAqKdvR8/w==
X-CSE-MsgGUID: dOX0QDuTTaiySpgWbb5dPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; 
   d="scan'208";a="177715622"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Sep 2025 23:12:28 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2OAU-0006pX-0c;
	Sat, 27 Sep 2025 06:12:26 +0000
Date: Sat, 27 Sep 2025 14:12:21 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com,
	michal.simek@amd.com, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pgaj@cadence.com,
	wsa+renesas@sang-engineering.com, tommaso.merciai.xr@bp.renesas.com,
	arnd@arndb.de, quic_msavaliy@quicinc.com, Shyam-sundar.S-k@amd.com,
	sakari.ailus@linux.intel.com, billy_tsai@aspeedtech.com,
	kees@kernel.org, gustavoars@kernel.org,
	jarkko.nikula@linux.intel.com, jorge.marques@analog.com,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
	shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Subject: Re: [PATCH V8 2/5] asm-generic/io.h: Add big-endian MMIO accessors
Message-ID: <202509271308.NHfa8qUq-lkp@intel.com>
References: <20250926105349.2932952-3-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250926105349.2932952-3-manikanta.guntupalli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_231243_530154_D8BE22AB 
X-CRM114-Status: GOOD (  12.91  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Manikanta,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arnd-asm-generic/master linus/master v6.17-rc7 next-20250926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Guntupalli/dt-bindings-i3c-Add-AMD-I3C-master-controller-support/20250926-190033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250926105349.2932952-3-manikanta.guntupalli%40amd.com
patch subject: [PATCH V8 2/5] asm-generic/io.h: Add big-endian MMIO accessors
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20250927/202509271308.NHfa8qUq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509271308.NHfa8qUq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509271308.NHfa8qUq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/uapi/linux/swab.h:19:12: note: expanded from macro '___constant_swab32'
      19 |         (((__u32)(x) & (__u32)0x000000ffUL) << 24) |            \
         |                   ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
   In file included from arch/sparc/include/asm/io.h:7:
   In file included from arch/sparc/include/asm/io_32.h:21:
   include/asm-generic/io.h:787:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     787 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
     119 |         ___constant_swab32(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:20:12: note: expanded from macro '___constant_swab32'
      20 |         (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |            \
         |                   ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
   In file included from arch/sparc/include/asm/io.h:7:
   In file included from arch/sparc/include/asm/io_32.h:21:
   include/asm-generic/io.h:787:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     787 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
     119 |         ___constant_swab32(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:21:12: note: expanded from macro '___constant_swab32'
      21 |         (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |            \
         |                   ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
   In file included from arch/sparc/include/asm/io.h:7:
   In file included from arch/sparc/include/asm/io_32.h:21:
   include/asm-generic/io.h:787:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     787 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
     119 |         ___constant_swab32(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:22:12: note: expanded from macro '___constant_swab32'
      22 |         (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
         |                   ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
   In file included from arch/sparc/include/asm/io.h:7:
   In file included from arch/sparc/include/asm/io_32.h:21:
   include/asm-generic/io.h:787:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     787 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:120:12: note: expanded from macro '__swab32'
     120 |         __fswab32(x))
         |                   ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
   In file included from arch/sparc/include/asm/io.h:7:
   In file included from arch/sparc/include/asm/io_32.h:21:
   include/asm-generic/io.h:803:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     803 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:818:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     818 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:833:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     833 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:926:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     926 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:939:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     939 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:952:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     952 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:966:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     966 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:980:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     980 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:994:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     994 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:1377:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1377 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
>> arch/sparc/include/asm/io.h:16:9: warning: 'readw_be' macro redefined [-Wmacro-redefined]
      16 | #define readw_be(__addr)        __raw_readw(__addr)
         |         ^
   include/asm-generic/io.h:304:9: note: previous definition is here
     304 | #define readw_be readw_be
         |         ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
>> arch/sparc/include/asm/io.h:17:9: warning: 'readl_be' macro redefined [-Wmacro-redefined]
      17 | #define readl_be(__addr)        __raw_readl(__addr)
         |         ^
   include/asm-generic/io.h:319:9: note: previous definition is here
     319 | #define readl_be readl_be
         |         ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
>> arch/sparc/include/asm/io.h:19:9: warning: 'writel_be' macro redefined [-Wmacro-redefined]
      19 | #define writel_be(__w, __addr)  __raw_writel(__w, __addr)
         |         ^
   include/asm-generic/io.h:363:9: note: previous definition is here
     363 | #define writel_be writel_be
         |         ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:18:
>> arch/sparc/include/asm/io.h:20:9: warning: 'writew_be' macro redefined [-Wmacro-redefined]
      20 | #define writew_be(__l, __addr)  __raw_writew(__l, __addr)
         |         ^
   include/asm-generic/io.h:351:9: note: previous definition is here
     351 | #define writew_be writew_be
         |         ^
   In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   arch/sparc/vdso/vdso32/../vclock_gettime.c:274:1: warning: no previous prototype for function '__vdso_clock_gettime' [-Wmissing-prototypes]
     274 | __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec *ts)
         | ^
   arch/sparc/vdso/vdso32/../vclock_gettime.c:273:9: note: declare 'static' if the function is not intended to be used outside of this translation unit
     273 | notrace int
         |         ^
         |         static 
   arch/sparc/vdso/vdso32/../vclock_gettime.c:302:1: warning: no previous prototype for function '__vdso_clock_gettime_stick' [-Wmissing-prototypes]
     302 | __vdso_clock_gettime_stick(clockid_t clock, struct __kernel_old_timespec *ts)
         | ^
   arch/sparc/vdso/vdso32/../vclock_gettime.c:301:9: note: declare 'static' if the function is not intended to be used outside of this translation unit
     301 | notrace int
         |         ^
         |         static 
   arch/sparc/vdso/vdso32/../vclock_gettime.c:327:1: warning: no previous prototype for function '__vdso_gettimeofday' [-Wmissing-prototypes]
     327 | __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
         | ^
   arch/sparc/vdso/vdso32/../vclock_gettime.c:326:9: note: declare 'static' if the function is not intended to be used outside of this translation unit
     326 | notrace int
         |         ^
         |         static 
   arch/sparc/vdso/vdso32/../vclock_gettime.c:363:1: warning: no previous prototype for function '__vdso_gettimeofday_stick' [-Wmissing-prototypes]
     363 | __vdso_gettimeofday_stick(struct __kernel_old_timeval *tv, struct timezone *tz)
         | ^
   arch/sparc/vdso/vdso32/../vclock_gettime.c:362:9: note: declare 'static' if the function is not intended to be used outside of this translation unit
     362 | notrace int
         |         ^
         |         static 
   29 warnings generated.


vim +/readw_be +16 arch/sparc/include/asm/io.h

21dccddf45aae2 Jan Andersson 2011-05-10   9  
21dccddf45aae2 Jan Andersson 2011-05-10  10  /*
21dccddf45aae2 Jan Andersson 2011-05-10  11   * Defines used for both SPARC32 and SPARC64
21dccddf45aae2 Jan Andersson 2011-05-10  12   */
21dccddf45aae2 Jan Andersson 2011-05-10  13  
21dccddf45aae2 Jan Andersson 2011-05-10  14  /* Big endian versions of memory read/write routines */
21dccddf45aae2 Jan Andersson 2011-05-10  15  #define readb_be(__addr)	__raw_readb(__addr)
21dccddf45aae2 Jan Andersson 2011-05-10 @16  #define readw_be(__addr)	__raw_readw(__addr)
21dccddf45aae2 Jan Andersson 2011-05-10 @17  #define readl_be(__addr)	__raw_readl(__addr)
21dccddf45aae2 Jan Andersson 2011-05-10  18  #define writeb_be(__b, __addr)	__raw_writeb(__b, __addr)
21dccddf45aae2 Jan Andersson 2011-05-10 @19  #define writel_be(__w, __addr)	__raw_writel(__w, __addr)
21dccddf45aae2 Jan Andersson 2011-05-10 @20  #define writew_be(__l, __addr)	__raw_writew(__l, __addr)
21dccddf45aae2 Jan Andersson 2011-05-10  21  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
