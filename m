Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F63C3DA49
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jul 2024 02:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bfr89SfPxja6imhjy9d8uHRfQ+W4fM3TBw4oHQHip4=; b=gDsVqHlTvRe/mf
	/t9pgetSopbVv5ryrLI/vcySivz3jqiqxChPYHH7rK2z+P93CZV6c3G/j524NiTMyX8+i3AxAljuo
	LhZ9V2aqBabFrt/lrGgcQbxkBuFgh3lgGLPUQrRCyHisYgRjwCGPf+or/BfRet4tiua0L4C+Xq7Lt
	7cXnYVwz/N66w+x4vpPMElL3xnZnkk5tUtidNjVjxd7hpXTOCN0/fkMaDYvscqExgsC8xi1u+L85N
	JV+SpgyELgzGel9NcMZE4U7kptEgC3ymZL9BVhfo+5jUB92hGStLSCgEy+gJb/q0maPVqMoEDj+NJ
	YUWdpKJVuXkY4wrcKAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWRav-0000000E7tf-2AaR;
	Wed, 24 Jul 2024 02:19:09 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWRar-0000000E7rj-3DuM
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jul 2024 02:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721787546; x=1753323546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AX7TCzOqF+kRV52BtSQ5g+nfPZuolJtzec1v4oyt74Q=;
  b=k/sdwE721/2kU3LeXWbAugiW7FQgHETRxfVwW1CFs2wVVuSr2OMhEqHU
   utTzmw6wyyc5wtOLYNbrYePSNFNINEqTLxOxgH/hA0lOJ081kDbP0w4ly
   E0AdojoSJ1ZD8p4/VqOns02XaYYW5lnllpqS99d8bEQzO/TTvI7EYoWPc
   KC5Y9d8WnclzySIsdKxpkEB/GRtDim+LmA9R9519f9ZuUzvZrDLcaX5Cf
   1tW+yXVYell/Mf7n3w1MN/XwxrN6nzZHaPr9AEyBVmyWEGUPmLfDAt3qe
   g4Slkew1czeVtTopIrRf6vMJ+pPLiZpI1W+HlnCMwJYWGf5abWDfLkplo
   Q==;
X-CSE-ConnectionGUID: m8nLYJkaQ2a6KPR36yRn8g==
X-CSE-MsgGUID: /UmLj39/Ro2/dWTRBrJVcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="30590397"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="30590397"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 19:19:03 -0700
X-CSE-ConnectionGUID: Jb5/wmEdQU2qzz/VgI1jNw==
X-CSE-MsgGUID: UrvIPvw9RDuKqQlUJ23IHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="53205678"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Jul 2024 19:19:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWRak-000mZA-2y;
	Wed, 24 Jul 2024 02:18:58 +0000
Date: Wed, 24 Jul 2024 10:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 4/5] i3c: mipi-i3c-hci: Add a quirk to set timing
 parameters
Message-ID: <202407240917.PpEicOHG-lkp@intel.com>
References: <20240723173538.3493935-5-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240723173538.3493935-5-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_191905_915661_ACF4B121 
X-CRM114-Status: GOOD (  10.87  )
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

Hi Shyam,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.10 next-20240723]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/i3c-mipi-i3c-hci-Add-MIPI0100-ACPI-ID-to-the-I3C-Support-List/20240724-013958
base:   linus/master
patch link:    https://lore.kernel.org/r/20240723173538.3493935-5-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH 4/5] i3c: mipi-i3c-hci: Add a quirk to set timing parameters
config: x86_64-buildonly-randconfig-004-20240724 (https://download.01.org/0day-ci/archive/20240724/202407240917.PpEicOHG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240917.PpEicOHG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240917.PpEicOHG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i3c/master/mipi-i3c-hci/hci_quirks.c:35:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      35 |         reg_write(HCI_SCL_I3C_OD_TIMING, AMD_SCL_I3C_OD_TIMING);
         |         ^
   drivers/i3c/master/mipi-i3c-hci/hci.h:30:26: note: expanded from macro 'reg_write'
      30 | #define reg_write(r, v)         writel(v, hci->base_regs + (r))
         |                                 ^
>> drivers/i3c/master/mipi-i3c-hci/hci_quirks.c:37:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      37 |         data = reg_read(HCI_SDA_HOLD_SWITCH_DLY_TIMING);
         |                ^
   drivers/i3c/master/mipi-i3c-hci/hci.h:29:22: note: expanded from macro 'reg_read'
      29 | #define reg_read(r)             readl(hci->base_regs + (r))
         |                                 ^
   2 errors generated.


vim +/writel +35 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c

    30	
    31	void amd_set_od_pp_timing(struct i3c_hci *hci)
    32	{
    33		u32 data;
    34	
  > 35		reg_write(HCI_SCL_I3C_OD_TIMING, AMD_SCL_I3C_OD_TIMING);
    36		reg_write(HCI_SCL_I3C_PP_TIMING, AMD_SCL_I3C_PP_TIMING);
  > 37		data = reg_read(HCI_SDA_HOLD_SWITCH_DLY_TIMING);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
