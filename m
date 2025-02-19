Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C3BC021AA
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2025 04:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJ1lCifG80wqIRAOYqm9R7wgYhj6c4cF8FPKVXslog0=; b=jguR2uE4QAsavq
	opykqrwWds+TvLVtnssAgDU1RF7E858qvh/6hzJAPWPCspwKp0iOXCYPsd+VE8Kl+gGBH1U1pZrF2
	63ZJltYY6pEjdnDPgjg1uoYcmeuy9hXqHqEBj3xqQJaR4HgX7k3Yz8xta2CJpNPeN4E9cMY4EBlZ0
	7q/EQdZjqyXdYZwZIVYFB0X6QlbqfRtlirL0pXe29H2oWOd0koMkn+KzS59HwCXlNU86CuvqTDza8
	ZPJxhMozdfZaTztigHniMq7Xf04WHBVhVUFT9NjEJUzfS4fEkbys6BoejMGMw6wwHD9oAoz6MSsLe
	uZUj5Oj/oOWyKU73Y4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkc4f-0000000Argc-1Pd3;
	Wed, 19 Feb 2025 04:52:41 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkc4c-0000000ArgF-2BOC
	for linux-i3c@lists.infradead.org;
	Wed, 19 Feb 2025 04:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739940759; x=1771476759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CqJ6DkASQPJEC9ewBqvxq88kqMSk27cnnMTjXeKRPDc=;
  b=a6kweCduaM3QgGm+C3wlxSZQkAjGgNl8q5vRbjEW5xRDWiKKDNiFn21K
   y+7KMbcHDwtpiNIYQvmcdqAzo5qElE8eCDf05bm/G934tgmNdLFwPH64v
   IgrlbOgGYhaY738dDFmf1HjYBvfhHei864XrEiNtqZqju9ldiahZzXKqo
   9GKrA8SwEaz2uaodRYf5qXPbDnTNSdzQpnsgDfhBlZAkb9Co8zkjLDdIR
   osMY/Jit+qkVIrSAiBG0Xtb9HDRs1JXEC17BAUT2vTMxVVjPglWDH3EGF
   j30LbCSMfIaVya5lSpRvYod+kCp2ekLDfmg3wIf73/uquX7Igf63jeIdT
   Q==;
X-CSE-ConnectionGUID: 2aN5IAHrQBqbv3iDIi4c0w==
X-CSE-MsgGUID: AGBN5XkPSf6ZGFORpsT8Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44420802"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="44420802"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 20:52:35 -0800
X-CSE-ConnectionGUID: /Nas89t0TGGoDTHvDacfhw==
X-CSE-MsgGUID: d4uI7X/cQ1uJw9H4hbMHuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="114456632"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Feb 2025 20:52:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkc4J-0001Fb-11;
	Wed, 19 Feb 2025 04:52:24 +0000
Date: Wed, 19 Feb 2025 12:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com, Frank.Li@nxp.com,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-hub
 device
Message-ID: <202502191226.OQpregx1-lkp@intel.com>
References: <20250212132227.1348374-2-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250212132227.1348374-2-aman.kumarpandey@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_205238_629340_FAC41615 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

Hi Aman,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.14-rc3 next-20250218]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/drivers-i3c-Add-driver-for-NXP-P3H2x4x-i3c-hub-device/20250212-213659
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250212132227.1348374-2-aman.kumarpandey%40nxp.com
patch subject: [PATCH 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-hub device
config: i386-randconfig-006-20250219 (https://download.01.org/0day-ci/archive/20250219/202502191226.OQpregx1-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250219/202502191226.OQpregx1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502191226.OQpregx1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/bpf/preload/bpf_preload.o
>> ERROR: modpost: "i2c_slave_event" [drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
