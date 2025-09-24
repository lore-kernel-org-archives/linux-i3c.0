Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFBDCAC5B0
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Sep 2025 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XI2g0v20glpUsy/kbC2ev63zvts93b+U2+6mZW326TM=; b=sN+fyTyl6plCPX
	5SZ/3aeXVFaoaf/quh2GtCeoNmGwNeJTVSiDsguHvy2o4cFGMS3B8P2IWpMMqZGfr6JBGj1mGBPP6
	z2/tj0MFMMOOnXEoiIoPDjrenbuZwfWrjyg4JDQ8SHFO+5Qy2+5YmBMq8Sqj+QeSZLT2rSknzAKB4
	R0f2kEwTzJWHUxp6Xdpe+WvH57TzdqM4eoJkSbXg4wrndT345Fx+uPdALzh0bzcYwEMNOYccOOYw1
	8nDVO2pisKsYJ3wHGZZpfuUd+I3JFmFPvah2PdiiKOpPBXu3K/Gk/tu0NO/tZlFPUGOG+PGbuUo4s
	mPugM5X8JPOnyHXXINfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1WD5-00000003XxH-3vrS;
	Wed, 24 Sep 2025 20:35:31 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1WD3-00000003Xvf-29uJ
	for linux-i3c@lists.infradead.org;
	Wed, 24 Sep 2025 20:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758746130; x=1790282130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yIIG1XirvNHRjmi8n5doZRkSjBLwdxxinyVL08mmVww=;
  b=cImYsZAxVyHhV/PeuE6AmvED8MkGu5EMy0N6jSJPah5jAwgSsbLfnUdO
   ERkl5GdkZL7adenQAlozkjP+IHZUdG60MJpmL/0Oax4utRsaH9x12egNn
   c0y5RwVjiewbxb5lw6agnABe4iqpoS0pl1zAzqhkEj7A8uE/Ht38kvibm
   l2QqnmVXbPVaZg+7fS58rmoGW0aCWRWboJgOXWVz8l12e6/B0XzUo7VNJ
   Krx2DRWGsYjTEAzAol84rqN1Aj73uwUYNw7/Mn9sgSq+e+WKKT2NXPQtv
   T0GCaijmbgcVncTUbvGI4GLAuQEEJi5D71D7hnClXPtu8cre3810M/g4R
   Q==;
X-CSE-ConnectionGUID: ZqjHwmH9Q+qSuTAg927KiA==
X-CSE-MsgGUID: SDT4341VSXuVojZebMCuIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61107247"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="61107247"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 13:35:29 -0700
X-CSE-ConnectionGUID: fGvhU9vnSUqnQqd/QW8Okg==
X-CSE-MsgGUID: kGVSi16kQa6u+aYiLlNf8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="181405897"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Sep 2025 13:35:22 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1WCt-0004Xt-1P;
	Wed, 24 Sep 2025 20:35:19 +0000
Date: Thu, 25 Sep 2025 04:34:31 +0800
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
Message-ID: <202509250413.sOTeU37m-lkp@intel.com>
References: <20250923154551.2112388-3-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250923154551.2112388-3-manikanta.guntupalli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_133529_565081_3D4A53C3 
X-CRM114-Status: GOOD (  12.32  )
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
[also build test WARNING on linus/master arnd-asm-generic/master v6.17-rc7 next-20250924]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Guntupalli/dt-bindings-i3c-Add-AMD-I3C-master-controller-support/20250923-234944
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250923154551.2112388-3-manikanta.guntupalli%40amd.com
patch subject: [PATCH V7 2/4] asm-generic/io.h: Add big-endian MMIO accessors
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20250925/202509250413.sOTeU37m-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509250413.sOTeU37m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509250413.sOTeU37m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/sparc/include/asm/hardirq_32.h:11,
                    from arch/sparc/include/asm/hardirq.h:7,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from include/linux/perf_event.h:43,
                    from arch/sparc/mm/fault_32.c:22:
>> arch/sparc/include/asm/io.h:16:9: warning: 'readw_be' redefined
      16 | #define readw_be(__addr)        __raw_readw(__addr)
         |         ^~~~~~~~
   In file included from arch/sparc/include/asm/io_32.h:21,
                    from arch/sparc/include/asm/io.h:7:
   include/asm-generic/io.h:304:9: note: this is the location of the previous definition
     304 | #define readw_be readw_be
         |         ^~~~~~~~
>> arch/sparc/include/asm/io.h:17:9: warning: 'readl_be' redefined
      17 | #define readl_be(__addr)        __raw_readl(__addr)
         |         ^~~~~~~~
   include/asm-generic/io.h:319:9: note: this is the location of the previous definition
     319 | #define readl_be readl_be
         |         ^~~~~~~~
>> arch/sparc/include/asm/io.h:19:9: warning: 'writel_be' redefined
      19 | #define writel_be(__w, __addr)  __raw_writel(__w, __addr)
         |         ^~~~~~~~~
   include/asm-generic/io.h:363:9: note: this is the location of the previous definition
     363 | #define writel_be writel_be
         |         ^~~~~~~~~
>> arch/sparc/include/asm/io.h:20:9: warning: 'writew_be' redefined
      20 | #define writew_be(__l, __addr)  __raw_writew(__l, __addr)
         |         ^~~~~~~~~
   include/asm-generic/io.h:351:9: note: this is the location of the previous definition
     351 | #define writew_be writew_be
         |         ^~~~~~~~~
--
   In file included from include/linux/io.h:12,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/sparc/include/asm/hardirq_32.h:11,
                    from arch/sparc/include/asm/hardirq.h:7,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/pagemap.h:11,
                    from arch/sparc/mm/srmmu.c:15:
>> arch/sparc/include/asm/io.h:16:9: warning: 'readw_be' redefined
      16 | #define readw_be(__addr)        __raw_readw(__addr)
         |         ^~~~~~~~
   In file included from arch/sparc/include/asm/io_32.h:21,
                    from arch/sparc/include/asm/io.h:7:
   include/asm-generic/io.h:304:9: note: this is the location of the previous definition
     304 | #define readw_be readw_be
         |         ^~~~~~~~
>> arch/sparc/include/asm/io.h:17:9: warning: 'readl_be' redefined
      17 | #define readl_be(__addr)        __raw_readl(__addr)
         |         ^~~~~~~~
   include/asm-generic/io.h:319:9: note: this is the location of the previous definition
     319 | #define readl_be readl_be
         |         ^~~~~~~~
>> arch/sparc/include/asm/io.h:19:9: warning: 'writel_be' redefined
      19 | #define writel_be(__w, __addr)  __raw_writel(__w, __addr)
         |         ^~~~~~~~~
   include/asm-generic/io.h:363:9: note: this is the location of the previous definition
     363 | #define writel_be writel_be
         |         ^~~~~~~~~
>> arch/sparc/include/asm/io.h:20:9: warning: 'writew_be' redefined
      20 | #define writew_be(__l, __addr)  __raw_writew(__l, __addr)
         |         ^~~~~~~~~
   include/asm-generic/io.h:351:9: note: this is the location of the previous definition
     351 | #define writew_be writew_be
         |         ^~~~~~~~~
   arch/sparc/mm/srmmu.c: In function 'poke_hypersparc':
   arch/sparc/mm/srmmu.c:1074:32: warning: variable 'clear' set but not used [-Wunused-but-set-variable]
    1074 |         volatile unsigned long clear;
         |                                ^~~~~


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
