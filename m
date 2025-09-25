Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A185CAC5A5
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 06:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/bk5RkxmXpJgnssE3kpu+iB9mtLxpb8i8dyVnlMsHs=; b=UFG9b3uebyG1Ik
	ysPt4kBAddla0dkY0kqdApYHtD5gzqiCyHDEknndCS8z36QinF+gw9eE2dywhPwZ4BlGrmBIuaqw9
	6aQ3hANDPnXnbZVJKzemeAIog9bl2DjliDydJj6pZRO2XG16xXmw2H0OEXTd23r6HfRS1uyyJvhYl
	0WFfvW3YcrEEbPxig3Z6Pj4xOGBHtr3mo1SU9wBzKOISROrNFuI033dtp7iG3X0GEc3HQhWF3V76S
	f7NKkizJyvu6p1CAZNNnJunl9SDPYsdFFMfyx8CVDM5mBTPN1n84NFn5qqZQZMiQeTaFiN5ehyqzl
	5B0ollX9UBRxe+wFOEyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1fI3-00000006CFi-3i3O;
	Thu, 25 Sep 2025 06:17:15 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1fI1-00000006CEm-1vyC
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 06:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758781033; x=1790317033;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=no9McvNQ9dwrmydNxDE878rNinVgQfTkTR2eEwoS+Cg=;
  b=Z51tj+JEwu4OX3kH8us45eBz45V1DorryJV4tLsr8WqzCXPCVYa82/9K
   oslrngU/MwwS9ED7M4yYXlpS2OA5mPcI8nPbqiyajC+KFdisd6JZZqcGU
   cPLYQppyIfZ3EuyzN0g2HJKi5X1vSBMQwH1277gMTdQSoZnqrQ7WEdG7P
   sCEo9Es8HAZNAf8rZNSmNTZ9Ryoyjk4LgTaC+x+lQm34Dj03TX2LG/syN
   kVHU9bS8tI1/gW0gGTkbMsPTPMRsJK+kisHfC/zumZhVEy+ylLhRS5mKl
   c6rvg8YLjWWK/KgsJIndpQHu7//1CHkkqHxpr2YrDxqmUBbO77KGB5r23
   Q==;
X-CSE-ConnectionGUID: DG2PDrUDTl6Mw/CdNhvLXA==
X-CSE-MsgGUID: Dbj7IdS3StGTdEIoXBo1Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="63716831"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="63716831"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 23:17:11 -0700
X-CSE-ConnectionGUID: CKdBgEU7Tl2c1kZ2BI7ZZw==
X-CSE-MsgGUID: QIB0xzXNSEabIqFmc+88Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="177083021"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Sep 2025 23:17:04 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1fHk-0004yD-0p;
	Thu, 25 Sep 2025 06:16:57 +0000
Date: Thu, 25 Sep 2025 14:15:57 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, radhey.shyam.pandey@amd.com,
	srinivas.goud@amd.com, shubhrajyoti.datta@amd.com,
	manion05gk@gmail.com,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Subject: Re: [PATCH V7 2/4] asm-generic/io.h: Add big-endian MMIO accessors
Message-ID: <202509251347.sb9SGhab-lkp@intel.com>
References: <20250923154551.2112388-3-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250923154551.2112388-3-manikanta.guntupalli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_231713_514898_37346170 
X-CRM114-Status: GOOD (  11.77  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master arnd-asm-generic/master v6.17-rc7 next-20250924]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Guntupalli/dt-bindings-i3c-Add-AMD-I3C-master-controller-support/20250923-234944
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250923154551.2112388-3-manikanta.guntupalli%40amd.com
patch subject: [PATCH V7 2/4] asm-generic/io.h: Add big-endian MMIO accessors
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20250925/202509251347.sb9SGhab-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509251347.sb9SGhab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509251347.sb9SGhab-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/io.h:962,
                    from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from arch/powerpc/include/asm/hardirq.h:6,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:8,
                    from include/linux/cgroup.h:27,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/powerpc/kernel/asm-offsets.c:21:
>> include/asm-generic/io.h:304:18: error: redefinition of 'readw_be'
     304 | #define readw_be readw_be
         |                  ^~~~~~~~
   include/asm-generic/io.h:305:19: note: in expansion of macro 'readw_be'
     305 | static inline u16 readw_be(const volatile void __iomem *addr)
         |                   ^~~~~~~~
   arch/powerpc/include/asm/io.h:517:19: note: previous definition of 'readw_be' with type 'u16(const volatile void *)' {aka 'short unsigned int(const volatile void *)'}
     517 | static inline u16 readw_be(const volatile void __iomem *addr)
         |                   ^~~~~~~~
>> include/asm-generic/io.h:319:18: error: redefinition of 'readl_be'
     319 | #define readl_be readl_be
         |                  ^~~~~~~~
   include/asm-generic/io.h:320:19: note: in expansion of macro 'readl_be'
     320 | static inline u32 readl_be(const volatile void __iomem *addr)
         |                   ^~~~~~~~
   arch/powerpc/include/asm/io.h:522:19: note: previous definition of 'readl_be' with type 'u32(const volatile void *)' {aka 'unsigned int(const volatile void *)'}
     522 | static inline u32 readl_be(const volatile void __iomem *addr)
         |                   ^~~~~~~~
>> include/asm-generic/io.h:351:19: error: redefinition of 'writew_be'
     351 | #define writew_be writew_be
         |                   ^~~~~~~~~
   include/asm-generic/io.h:352:20: note: in expansion of macro 'writew_be'
     352 | static inline void writew_be(u16 value, volatile void __iomem *addr)
         |                    ^~~~~~~~~
   arch/powerpc/include/asm/io.h:545:20: note: previous definition of 'writew_be' with type 'void(u16,  volatile void *)' {aka 'void(short unsigned int,  volatile void *)'}
     545 | static inline void writew_be(u16 val, volatile void __iomem *addr)
         |                    ^~~~~~~~~
>> include/asm-generic/io.h:363:19: error: redefinition of 'writel_be'
     363 | #define writel_be writel_be
         |                   ^~~~~~~~~
   include/asm-generic/io.h:364:20: note: in expansion of macro 'writel_be'
     364 | static inline void writel_be(u32 value, volatile void __iomem *addr)
         |                    ^~~~~~~~~
   arch/powerpc/include/asm/io.h:550:20: note: previous definition of 'writel_be' with type 'void(u32,  volatile void *)' {aka 'void(unsigned int,  volatile void *)'}
     550 | static inline void writel_be(u32 val, volatile void __iomem *addr)
         |                    ^~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/readw_be +304 include/asm-generic/io.h

   297	
   298	/*
   299	 * {read,write}{w,l,q}_be() access big endian memory and return result
   300	 * in native endianness.
   301	 */
   302	
   303	#ifndef readw_be
 > 304	#define readw_be readw_be
   305	static inline u16 readw_be(const volatile void __iomem *addr)
   306	{
   307		u16 val;
   308	
   309		log_read_mmio(16, addr, _THIS_IP_, _RET_IP_);
   310		__io_br();
   311		val = __be16_to_cpu((__be16 __force)__raw_readw(addr));
   312		__io_ar(val);
   313		log_post_read_mmio(val, 16, addr, _THIS_IP_, _RET_IP_);
   314		return val;
   315	}
   316	#endif
   317	
   318	#ifndef readl_be
 > 319	#define readl_be readl_be
   320	static inline u32 readl_be(const volatile void __iomem *addr)
   321	{
   322		u32 val;
   323	
   324		log_read_mmio(32, addr, _THIS_IP_, _RET_IP_);
   325		__io_br();
   326		val = __be32_to_cpu((__be32 __force)__raw_readl(addr));
   327		__io_ar(val);
   328		log_post_read_mmio(val, 32, addr, _THIS_IP_, _RET_IP_);
   329		return val;
   330	}
   331	#endif
   332	
   333	#ifdef CONFIG_64BIT
   334	#ifndef readq_be
   335	#define readq_be readq_be
   336	static inline u64 readq_be(const volatile void __iomem *addr)
   337	{
   338		u64 val;
   339	
   340		log_read_mmio(64, addr, _THIS_IP_, _RET_IP_);
   341		__io_br();
   342		val = __be64_to_cpu((__be64 __force)__raw_readq(addr));
   343		__io_ar(val);
   344		log_post_read_mmio(val, 64, addr, _THIS_IP_, _RET_IP_);
   345		return val;
   346	}
   347	#endif
   348	#endif /* CONFIG_64BIT */
   349	
   350	#ifndef writew_be
 > 351	#define writew_be writew_be
   352	static inline void writew_be(u16 value, volatile void __iomem *addr)
   353	{
   354		log_write_mmio(value, 16, addr, _THIS_IP_, _RET_IP_);
   355		__io_bw();
   356		__raw_writew((u16 __force)__cpu_to_be16(value), addr);
   357		__io_aw();
   358		log_post_write_mmio(value, 16, addr, _THIS_IP_, _RET_IP_);
   359	}
   360	#endif
   361	
   362	#ifndef writel_be
 > 363	#define writel_be writel_be
   364	static inline void writel_be(u32 value, volatile void __iomem *addr)
   365	{
   366		log_write_mmio(value, 32, addr, _THIS_IP_, _RET_IP_);
   367		__io_bw();
   368		__raw_writel((u32 __force)__cpu_to_be32(value), addr);
   369		__io_aw();
   370		log_post_write_mmio(value, 32, addr, _THIS_IP_, _RET_IP_);
   371	}
   372	#endif
   373	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
