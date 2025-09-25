Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E41CAC5A7
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 12:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5V3zK2na9xZwC71Ocu2ODlt5L1/RDBZbpBPJQ9OlRc=; b=INUHFz5/vLatiR
	zEZ5w5ZqDSpzm8RqJLBxRNsoq1fpvaM5MROU/jUOCYPNTdzmgR8j9xgbyksDnzmvDlv3MfucLeq4O
	rZJVJWKA2Lx2KDAvVMSI/0NgFOiQrSEskxmIDlE+BK1x1OdEjX0K+QT1lgQG1K9WPnq58EUIKSWL0
	Mv5XZwRrvUtOrHaLJ3NK+4Fsmta3+12ZOZgCPcmc72tn8T2ARFKRBzuMzjkI02DLk3kPmupT7PagJ
	VzmFM3miZzM30tSfZuyTN+wyVaHPhi7vVnPiw/1h1qfZARuTafaaRcv5UPkjoH/VV638VdCduTC2o
	s5USSfvSGlDzD9t+UW2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kzZ-00000008vqG-3RN4;
	Thu, 25 Sep 2025 12:22:33 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1kzW-00000008vmx-3esf
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 12:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758802951; x=1790338951;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tm+4joIsAVhoOGpHV0IfGhWDLFgBiLx2fFOsiG1Cw1E=;
  b=Kj3+QrXUjm4bP89idtM3S5Q9Jiaud8MXl/L9FX35Z3lVcJFRpCfai0BN
   fcxR7wMpnsivkgzhLvYik2Mp5F0tR7PNsGweZjcrbh6Chbum1gp9A6Fwz
   FdgUmlS5u2iPa1ILn26QSUd1JVFCnT+/Wd3Ew1UiqgrXNVaR/xCobQeLg
   HMcxgy48rksewicC05vnhgehk1v9aDRhYjC0hEcTj018e72oIffzkZgyb
   FjPw5hk3bwrdwqs5b7SmV+m5wnN6MUgMRGVEta33PD3g35qroaGsV9Qs1
   XuQJbAjSIJ8uQPXGbhzlapQAh8orlQx/n0RBgfwLIxKs176oj/fiSYhBK
   w==;
X-CSE-ConnectionGUID: PPq0FyuCTBCv/SopUJ6Q6Q==
X-CSE-MsgGUID: /TwrnIj+QZyKnZa4nTZk9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60330602"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="60330602"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 05:22:30 -0700
X-CSE-ConnectionGUID: wREnvNLfTMWuWHu54WXTbw==
X-CSE-MsgGUID: 2WHOhuASRYGVg79ikjlZhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="181711175"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2025 05:22:24 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1kzN-0005DB-2S;
	Thu, 25 Sep 2025 12:22:21 +0000
Date: Thu, 25 Sep 2025 20:22:14 +0800
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
Subject: Re: [PATCH V7 3/4] i3c: master: Add endianness support for
 i3c_readl_fifo() and i3c_writel_fifo()
Message-ID: <202509252022.QvbNmJil-lkp@intel.com>
References: <20250923154551.2112388-4-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250923154551.2112388-4-manikanta.guntupalli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_052230_950795_8AED4622 
X-CRM114-Status: GOOD (  12.62  )
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
patch link:    https://lore.kernel.org/r/20250923154551.2112388-4-manikanta.guntupalli%40amd.com
patch subject: [PATCH V7 3/4] i3c: master: Add endianness support for i3c_readl_fifo() and i3c_writel_fifo()
config: mips-randconfig-r123-20250925 (https://download.01.org/0day-ci/archive/20250925/202509252022.QvbNmJil-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509252022.QvbNmJil-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509252022.QvbNmJil-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/i3c/master/i3c-master-cdns.c: note: in included file:
>> drivers/i3c/master/../internals.h:53:25: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __be32 [usertype] @@
   drivers/i3c/master/../internals.h:53:25: sparse:     expected unsigned int [usertype] val
   drivers/i3c/master/../internals.h:53:25: sparse:     got restricted __be32 [usertype]
>> drivers/i3c/master/../internals.h:53:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/i3c/master/../internals.h:53:25: sparse:     expected void volatile [noderef] __iomem *mem
   drivers/i3c/master/../internals.h:53:25: sparse:     got unsigned int *
>> drivers/i3c/master/../internals.h:78:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/i3c/master/../internals.h:78:31: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/i3c/master/../internals.h:78:31: sparse:     got unsigned int *
>> drivers/i3c/master/../internals.h:78:31: sparse: sparse: cast to restricted __be32
>> drivers/i3c/master/../internals.h:78:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got unsigned int * @@
   drivers/i3c/master/../internals.h:78:31: sparse:     expected void const volatile [noderef] __iomem *mem
   drivers/i3c/master/../internals.h:78:31: sparse:     got unsigned int *
>> drivers/i3c/master/../internals.h:78:31: sparse: sparse: cast to restricted __be32

vim +53 drivers/i3c/master/../internals.h

    31	
    32	/**
    33	 * i3c_writel_fifo - Write data buffer to 32bit FIFO
    34	 * @addr: FIFO Address to write to
    35	 * @buf: Pointer to the data bytes to write
    36	 * @nbytes: Number of bytes to write
    37	 * @endian: Endianness of FIFO write
    38	 */
    39	static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
    40					   int nbytes, enum i3c_fifo_endian endian)
    41	{
    42		if (endian)
    43			writesl_be(addr, buf, nbytes / 4);
    44		else
    45			writesl(addr, buf, nbytes / 4);
    46	
    47		if (nbytes & 3) {
    48			u32 tmp = 0;
    49	
    50			memcpy(&tmp, buf + (nbytes & ~3), nbytes & 3);
    51	
    52			if (endian)
  > 53				writel_be(tmp, addr);
    54			else
    55				writel(tmp, addr);
    56		}
    57	}
    58	
    59	/**
    60	 * i3c_readl_fifo - Read data buffer from 32bit FIFO
    61	 * @addr: FIFO Address to read from
    62	 * @buf: Pointer to the buffer to store read bytes
    63	 * @nbytes: Number of bytes to read
    64	 * @endian: Endianness of FIFO read
    65	 */
    66	static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
    67					  int nbytes, enum i3c_fifo_endian endian)
    68	{
    69		if (endian)
    70			readsl_be(addr, buf, nbytes / 4);
    71		else
    72			readsl(addr, buf, nbytes / 4);
    73	
    74		if (nbytes & 3) {
    75			u32 tmp;
    76	
    77			if (endian)
  > 78				tmp = readl_be(addr);
    79			else
    80				tmp = readl(addr);
    81	
    82			memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
    83		}
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
