Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258D5FD88D3
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Mar 2026 01:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VbOlfH3STwzyEP2mF9CXKjcpGOhywjbJkS+B6RrdHYA=; b=bWtxnYBW4GBQKu
	FsZKpaYyinMjoUm3vF1Q+QjD0IMs1v4zCkXubqNAEROCAgxpO/vPNe/s+r2amnY6NA8Db7rB2Q6h0
	imbQf4cLhpqr2bb3a3ueM+b4PWe+vzZCOqwe7kmkCy4ki8BVw/ORJcfWxrSH8SK71BWancQGu7Q8v
	0XqvjBMoVlYlHI1R/bHQRtK9DdARbxjdLe3VTzEEl65vIIbjxvbtMz5szEiKSf+QBo6boFjvgkGfy
	ttwBsMuAFA8CbOfDieYjQlst71kp9+nheqU7LDH98FsUV2hRFUNPAuDlULE1teWoOYyP6w2bA5tJ+
	h1PKkFAm7YrrGe3zT15w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07wG-0000000ATYD-3fmA;
	Wed, 11 Mar 2026 01:00:40 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w07wD-0000000ATXq-3bJG
	for linux-i3c@lists.infradead.org;
	Wed, 11 Mar 2026 01:00:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773190838; x=1804726838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2nRyGCp/u/t48t6g/TeP3eA6TCsz9hD8l7/U6aBpPlw=;
  b=PpSYGUBaV5TdIEfyaZDDrS0x7GeKQXh/YgYKPNpDEFS0YAakEf54316C
   d6lKXVKjF6KLSRPQsVSUSPaXd4ZfD1lkbEbyNTc4FQL2svERBMwFgMDCH
   mNh/en7T5sLjbbfQr9o2g5O3iV+wVp2zWQ5bfN9onGOM4QXPxqaB0NzEs
   dlOKI9XH+6pFqjTWnZQgKVpsDApRWHH7AbHrSAQBpxef2A+ZG6xUb/EnT
   JR6N9nXD4PNbJ+RNibIt6J9tuRDFCB4xNusI6sb/+ABugU6PysqyynwO9
   kTm1Ku3QLWBiULdXTOBZRuAa3MTsmFLhmf5G6Ek+m7VbkxMmxPTgHHwBC
   w==;
X-CSE-ConnectionGUID: GcgJu8o9T0KK3LQPrfcgZw==
X-CSE-MsgGUID: duCES2WfSgKlp9F8lmpCnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="73448439"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="73448439"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 18:00:29 -0700
X-CSE-ConnectionGUID: QV6pcc3jTFqGiNjRTI7yTg==
X-CSE-MsgGUID: UOIGKUdHRhGE065+kWWlVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="216602576"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Mar 2026 18:00:26 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w07vz-000000000Td-1wcb;
	Wed, 11 Mar 2026 01:00:23 +0000
Date: Wed, 11 Mar 2026 08:59:55 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>, linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com,
	lakshay.piplani@nxp.com
Subject: Re: [PATCH v6 6/7] i3c: hub: Add support for the I3C interface in
 the I3C hub
Message-ID: <202603110810.eZLkgGbx-lkp@intel.com>
References: <20260310065727.3759342-6-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310065727.3759342-6-lakshay.piplani@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_180037_962983_15F4CC89 
X-CRM114-Status: GOOD (  10.19  )
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

Hi Lakshay,

kernel test robot noticed the following build errors:

[auto build test ERROR on i3c/i3c/next]
[also build test ERROR on lee-mfd/for-mfd-next broonie-regulator/for-next linus/master v7.0-rc3 next-20260310]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lakshay-Piplani/i3c-master-Add-the-APIs-to-support-I3C-hub/20260310-150040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/20260310065727.3759342-6-lakshay.piplani%40nxp.com
patch subject: [PATCH v6 6/7] i3c: hub: Add support for the I3C interface in the I3C hub
config: s390-randconfig-001-20260311 (https://download.01.org/0day-ci/archive/20260311/202603110810.eZLkgGbx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110810.eZLkgGbx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110810.eZLkgGbx-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_disable_ibi':
>> hub.c:(.text+0x344): undefined reference to `i3c_dev_disable_ibi_locked'
   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_enable_ibi':
>> hub.c:(.text+0x43c): undefined reference to `i3c_dev_enable_ibi_locked'
   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_free_ibi':
>> hub.c:(.text+0x508): undefined reference to `i3c_master_direct_detach_i3c_dev'
>> s390-linux-ld: hub.c:(.text+0x51c): undefined reference to `i3c_dev_free_ibi_locked'
   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_request_ibi':
>> hub.c:(.text+0x5e2): undefined reference to `i3c_master_direct_attach_i3c_dev'
>> s390-linux-ld: hub.c:(.text+0x644): undefined reference to `i3c_dev_request_ibi_locked'
   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_master_priv_xfers':
>> hub.c:(.text+0x78e): undefined reference to `i3c_device_do_xfers'
>> s390-linux-ld: hub.c:(.text+0x7b8): undefined reference to `i3c_master_reattach_i3c_dev'
   s390-linux-ld: hub.c:(.text+0x7d2): undefined reference to `i3c_master_reattach_i3c_dev'
   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_master_send_ccc_cmd':
>> hub.c:(.text+0x88c): undefined reference to `i3c_master_send_ccc_cmd'
   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_master_do_daa':
>> hub.c:(.text+0x92a): undefined reference to `i3c_master_do_daa'
   s390-linux-ld: drivers/i3c/hub.o: in function `i3c_hub_master_supports_ccc_cmd':
>> hub.c:(.text+0x9ae): undefined reference to `i3c_master_supports_ccc_cmd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
