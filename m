Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EAFC5B549
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Jun 2025 02:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7GqIrK+ou3TbVzq1F3SXq1Pc+UHsunKcgzYGzV7cURc=; b=QVGZLYi0jNVKkT
	+N5PI3kHnu0rgDBB/O0M5XEWpuBLYfuIJkGhN2Xrw1kwI5T1JvxelTgTa8GlRW/5ufTyyC8jBw/gB
	Q1T7vPVKKWOz6VIfcNJHVFg62dRxvGNa5PpZkAYaWY0inLLncDedeKuFx91cNkx13gn5T9dJBFvqk
	SHtoLFz2jojnJo21BjErUxMcA7EbISkt99uJImU+s+QDN7uL3/1fkR0xYiyyOaBE8SojevCaUWfNf
	OmFzD2PBOiloCNe0JMiYquOW8xsQ3KM5da741TJjNp+QazHHZ8VVChm9onSsJMaJLFy+dGazdhLBQ
	7l/gM9+bDGUKfZ0oQNow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN05D-0000000EZuG-2hKG;
	Thu, 05 Jun 2025 02:11:55 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN00l-0000000EZRw-2f3i
	for linux-i3c@lists.infradead.org;
	Thu, 05 Jun 2025 02:07:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749089240; x=1780625240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yMce1iU4qlTP2YV6HR8iTvROrswiVvlSS11E20ztdoM=;
  b=bxmbx5vYZXO3XbMcRbTZfYqviAlJ3tC2QQ8EolmTGEbZ98gymUP0n+v5
   WPeiqxnVzi6+h9/yH+YjUsvTcz/6Fm2yPPwGicd+1m7U7f3ui4ONLGsXT
   Es9eF4eJmgMxeX0qAB7K5HeBERZJPKwDhYgVV0ywv1oPUOCnegcM21WLf
   ZYhsrEGZNhgD/XLpFzerSMZYqVDOAP2+uaXoSFwF7WtiupfyyGYlCCsAq
   9JJdsrT2HPUmMgm5my6Dle+0+tIZ9jC/qxtEUaP6aEcLbtB/BY48n1S32
   mrTLvRdNkEtDrHGqqohNMbK7p9jtfmDZ+t/X+mm0wnCtZJ6L7prj0Oy+7
   A==;
X-CSE-ConnectionGUID: sJeWLq2ISEO5KhFaevevAw==
X-CSE-MsgGUID: 70wbPiIiTcW/6oTTYJQ2fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51339065"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="51339065"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 19:07:14 -0700
X-CSE-ConnectionGUID: UpLwAK/uR4SBGSbZVL/C3A==
X-CSE-MsgGUID: DifQLQgITIS/vaqsPHMp0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="150514743"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jun 2025 19:05:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMzzR-0003cj-0J;
	Thu, 05 Jun 2025 02:05:57 +0000
Date: Thu, 5 Jun 2025 10:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>
Subject: Re: [PATCH 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <202506050903.jk5UWok1-lkp@intel.com>
References: <20250604-adi-i3c-master-v1-2-0488e80dafcb@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250604-adi-i3c-master-v1-2-0488e80dafcb@analog.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_190719_738548_12135D35 
X-CRM114-Status: GOOD (  10.78  )
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

Hi Jorge,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 00286d7d643d3c98e48d9cc3a9f471b37154f462]

url:    https://github.com/intel-lab-lkp/linux/commits/Jorge-Marques/dt-bindings-i3c-Add-adi-i3c-master/20250604-235108
base:   00286d7d643d3c98e48d9cc3a9f471b37154f462
patch link:    https://lore.kernel.org/r/20250604-adi-i3c-master-v1-2-0488e80dafcb%40analog.com
patch subject: [PATCH 2/2] i3c: master: Add driver for Analog Devices I3C Controller IP
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250605/202506050903.jk5UWok1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506050903.jk5UWok1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506050903.jk5UWok1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i3c/master/adi-i3c-master.c: In function 'adi_i3c_master_disable':
>> drivers/i3c/master/adi-i3c-master.c:180:16: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551615' to '4294967295' [-Woverflow]
     180 |         writel(~REG_IBI_CONFIG_LISTEN | ~REG_IBI_CONFIG_ENABLE,
   In file included from include/linux/bits.h:6,
                    from include/linux/bitops.h:6,
                    from drivers/i3c/master/adi-i3c-master.c:8:
   drivers/i3c/master/adi-i3c-master.c: In function 'adi_i3c_master_bus_init':
>> include/vdso/bits.h:7:33: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551614' to '4294967294' [-Woverflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   drivers/i3c/master/adi-i3c-master.c:72:41: note: in expansion of macro 'BIT'
      72 | #define REG_IBI_CONFIG_LISTEN           BIT(1)
         |                                         ^~~
   drivers/i3c/master/adi-i3c-master.c:704:16: note: in expansion of macro 'REG_IBI_CONFIG_LISTEN'
     704 |         writel(REG_IBI_CONFIG_LISTEN | ~REG_IBI_CONFIG_ENABLE,
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/adi-i3c-master.c: In function 'adi_i3c_master_disable_ibi':
>> include/vdso/bits.h:7:33: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '18446744073709551614' to '4294967294' [-Woverflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ^
   drivers/i3c/master/adi-i3c-master.c:72:41: note: in expansion of macro 'BIT'
      72 | #define REG_IBI_CONFIG_LISTEN           BIT(1)
         |                                         ^~~
   drivers/i3c/master/adi-i3c-master.c:859:24: note: in expansion of macro 'REG_IBI_CONFIG_LISTEN'
     859 |                 writel(REG_IBI_CONFIG_LISTEN | ~REG_IBI_CONFIG_ENABLE,
         |                        ^~~~~~~~~~~~~~~~~~~~~


vim +180 drivers/i3c/master/adi-i3c-master.c

   177	
   178	static int adi_i3c_master_disable(struct adi_i3c_master *master)
   179	{
 > 180		writel(~REG_IBI_CONFIG_LISTEN | ~REG_IBI_CONFIG_ENABLE,
   181		       master->regs + REG_IBI_CONFIG);
   182	
   183		return 0;
   184	}
   185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
