Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B746EE6B68
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Feb 2026 22:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETRc8Je4z1gqey2+Szdp5xbD0+rgjy5DPtbVjfcEC54=; b=jqH7OR2ggEHmCZ
	GsXcUh3jBVbvFCYvLgZwlORC/WoLgX6tfUwJTRj79XrB86z+EwYlBbRDjjXM040EB7i2esrDZvKzM
	KiM2kwAvdEHdb90G5cVM2Oqf3Kj7urkjsMiuvH8Qx+eh+pMJnGJMVyZsZ8wpqO4/0EAAtX3lVo0zg
	dRbRdTdM5zmzj7NLFraPqh4RaIZFyLH5n6i1Z5/rU00sYZx5cWJa2HhFNP9EUTD3OIAaCLVsWoYk8
	dP/KkfZYUg3rPwXpkZE1y3EC6IBNPhhh//vtFoluqrY2mVhoSgyLkXQMU9BhuJAYRTxAdl0ijjJF+
	z6Lwk5iAwRJ9ctqfPsxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voUAq-0000000BsNk-186m;
	Fri, 06 Feb 2026 22:19:36 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voUAn-0000000BsNL-0UC9
	for linux-i3c@lists.infradead.org;
	Fri, 06 Feb 2026 22:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770416373; x=1801952373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w31vsdRBjm0QKr2D1dVuazXtVtYRnzWC05Egb125YC8=;
  b=Ci0jmPurNhMXmvZne9Z6IC0XP9cDO8bIFZXSFvAGvowNJRJc+2pbkd/h
   sMlE/yth97PXIq179dSB7aJwX9Dqv6UlUKMR5v407iJrBi3oH49XDQTTt
   IDTtrCbn49DEyBI1XSpm/q/u4NpMJ5HV5OXu/IAf/Bwu6LOHJg/YHXJuo
   J6u79e8qj429k9cYwXh/S19KJPwz1rldYBzxIELQkCEmxTyX/nEiBqgTI
   ek1UMfjG1q1TmMiZdiZ2BtlASvsiurRHdRki9cObLxk34rkvboCy7n1G+
   eCqjK+au2GBU4L5nFMQjDZD9Gp6eNc6mu06xOWcGqe8RQj5dX0G1GxKJo
   w==;
X-CSE-ConnectionGUID: Au2ixnQvS+S3JtTBz/n8Rw==
X-CSE-MsgGUID: EYG4QnLIRGKXlqOPsBIbNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71519940"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71519940"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 14:19:26 -0800
X-CSE-ConnectionGUID: 5CUiIvRNQmi421Ugcvu8UQ==
X-CSE-MsgGUID: 6FS7kGE2Qb2ziy9IyQsASg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210288070"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Feb 2026 14:19:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voUAX-00000000lCu-1Lrh;
	Fri, 06 Feb 2026 22:19:17 +0000
Date: Sat, 7 Feb 2026 06:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH v5 4/5] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Message-ID: <202602070610.sRd2Eapf-lkp@intel.com>
References: <20260206120121.856471-4-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206120121.856471-4-aman.kumarpandey@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_141933_170260_71F68628 
X-CRM114-Status: GOOD (  12.86  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes broonie-regulator/for-next linus/master v6.19-rc8]
[cannot apply to i3c/i3c/next next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/dt-bindings-i3c-Add-NXP-P3H2x4x-i3c-hub-support/20260206-200552
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20260206120121.856471-4-aman.kumarpandey%40nxp.com
patch subject: [PATCH v5 4/5] regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x i3c hub
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260207/202602070610.sRd2Eapf-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070610.sRd2Eapf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070610.sRd2Eapf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/regulator/p3h2840_i3c_hub_regulator.c: In function 'p3h2x4x_regulator_probe':
>> drivers/regulator/p3h2840_i3c_hub_regulator.c:208:13: warning: unused variable 'ret' [-Wunused-variable]
     208 |         int ret, i;
         |             ^~~


vim +/ret +208 drivers/regulator/p3h2840_i3c_hub_regulator.c

   200	
   201	static int p3h2x4x_regulator_probe(struct platform_device *pdev)
   202	{
   203		struct p3h2x4x_dev *p3h2x4x = dev_get_drvdata(pdev->dev.parent);
   204		struct p3h2x4x_regulator_dev *p3h2x4x_regulator;
   205		struct regulator_config rcfg = { };
   206		struct device *dev = &pdev->dev;
   207		struct regulator_dev *rdev;
 > 208		int ret, i;
   209	
   210		p3h2x4x_regulator = devm_kzalloc(dev, sizeof(*p3h2x4x_regulator), GFP_KERNEL);
   211		if (!p3h2x4x_regulator)
   212			return -ENOMEM;
   213	
   214		platform_set_drvdata(pdev, p3h2x4x_regulator);
   215	
   216		p3h2x4x_regulator->regmap = p3h2x4x->regmap;
   217		device_set_of_node_from_dev(dev, dev->parent);
   218	
   219		rcfg.dev = dev;
   220		rcfg.dev->of_node = dev->of_node;
   221		rcfg.regmap = p3h2x4x_regulator->regmap;
   222		rcfg.driver_data = p3h2x4x_regulator;
   223	
   224		for (i = 0; i < ARRAY_SIZE(p3h2x4x_regulators); i++) {
   225			rdev = devm_regulator_register(&pdev->dev, &p3h2x4x_regulators[i], &rcfg);
   226			if (IS_ERR(rdev)) {
   227				return dev_err_probe(dev, PTR_ERR(rdev), "Failed to register %s\n",
   228						     p3h2x4x_regulators[i].name);
   229			}
   230			p3h2x4x_regulator->rp3h2x4x_dev[i] = rdev;
   231		}
   232		return 0;
   233	}
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
