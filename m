Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C359AC282D1
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Mar 2025 06:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5En4eshSZuHBQDSaq11CzXNl6Ts6I405Qfb5o3tm5Y=; b=nTpm11yxWn3DkL
	noc3NA3a8nSt8/wZbhESAx1FAyKbVCJaKs/YGeZmWk+I7BVUthexqsygUSIoP2YGBzYX4hXDXXeST
	qrTw2F+qRmoZ/8A9D98i4dwaK6QZxeB00y2bS06n2MTuCxnj1ruh8O9Bl37qmj/04ocYUS8dgZZmG
	6BQHi7xk4191C9to/0TkNn4CHYM+f15BgT/Uj6wPCSbWm+l7aEZjWkNF5+VIlAUjT/Jz0MCr5nMu4
	oBMnbi47tZzREgHstdLrauhvKRXCkHH7GqaH29y3UrzcGo+sygOc2yt2z6q0PMl01OvieRGQPD1gt
	mCz0XdIWdO2rzFNjabFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5B3-0000000A9s4-1elc;
	Thu, 06 Mar 2025 06:57:53 +0000
Received: from [198.175.65.20] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5B0-0000000A9ri-3t3y
	for linux-i3c@lists.infradead.org;
	Thu, 06 Mar 2025 06:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741244271; x=1772780271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=weI/kwSBsrQsHpQ8px4HMhGgp73aX2Uq1ONCo9dVmW0=;
  b=DF4C9zwD4Q67PoUSzQg3YxOv+14LvyK0E0B5+xk2azWJfcIg1x6Y2iaX
   IUMZZVHIzaeIfVMTOWaDFQdXUqrcbJtKBGrmSBFH3L3P0NaFwHr91XQgi
   ec6mpYy2xUQhAppIsjc5cZnv0wmST8jLvI4ok7Ur5dRDD6JiAo3v71xGg
   ksvniU3IknPTqi0tTjJEBWFpxdojbAeVEfbEpTsmqBB/UfTiKQhsJoxT6
   gJBCex6IIcs4RF94eOwhjKs4+/TOsMdzT7A59GG8oGV8MNKP7vac4X0MA
   JPoKyijxwKZSlh0UxRa0ZzwjSexlacvgtK+K7qMXGL49bHSnZ2b7eYwGH
   Q==;
X-CSE-ConnectionGUID: STVLVdxJSVCfHOl0VfADyA==
X-CSE-MsgGUID: qVnopQ5/QRmtzUK8+Peqsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41947976"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="41947976"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 22:57:46 -0800
X-CSE-ConnectionGUID: a4th9ztnTA+EfE0LcPrpNQ==
X-CSE-MsgGUID: cy620EDBRQeGbwMOaavjKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="119107579"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2025 22:57:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq5Aq-000MfU-2r;
	Thu, 06 Mar 2025 06:57:40 +0000
Date: Thu, 6 Mar 2025 14:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: Stanley Chu <stanley.chuys@gmail.com>, frank.li@nxp.com,
	miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v6 2/5] i3c: master: svc: Add support for Nuvoton npcm845
 i3c
Message-ID: <202503061400.GGr64rkR-lkp@intel.com>
References: <20250305034414.2246870-3-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250305034414.2246870-3-yschu@nuvoton.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_225751_003846_13B1F4C5 
X-CRM114-Status: UNSURE (   9.62  )
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

Hi Stanley,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanley-Chu/dt-bindings-i3c-silvaco-Add-npcm845-compatible-string/20250305-114705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250305034414.2246870-3-yschu%40nuvoton.com
patch subject: [PATCH v6 2/5] i3c: master: svc: Add support for Nuvoton npcm845 i3c
config: sparc-randconfig-r121-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061400.GGr64rkR-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250306/202503061400.GGr64rkR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061400.GGr64rkR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/i3c/master/svc-i3c-master.c:1971:30: sparse: sparse: symbol 'npcm845_drvdata' was not declared. Should it be static?
>> drivers/i3c/master/svc-i3c-master.c:1973:30: sparse: sparse: symbol 'svc_default_drvdata' was not declared. Should it be static?
   drivers/i3c/master/svc-i3c-master.c:559:9: sparse: sparse: context imbalance in 'svc_i3c_master_ibi_work' - wrong count at exit
   drivers/i3c/master/svc-i3c-master.c: note: in included file (through include/linux/mutex.h, include/linux/notifier.h, include/linux/clk.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/svc_default_drvdata +1973 drivers/i3c/master/svc-i3c-master.c

  1972	
> 1973	const struct svc_i3c_drvdata svc_default_drvdata = {};
  1974	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
