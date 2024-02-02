Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E21C4828F
	for <linux-i3c@archiver.kernel.org>; Fri,  2 Feb 2024 21:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ilsq13/jGkt9bLcw5j0gJfVqOi0pIXlHVFx/Re9PxJM=; b=sJqtBgVwp9am7S
	z/F5KxzTCVPjN1s9M/Gq7lGztlBFpxhO2aIUWmS5zModN1SzGhPOwiCq/OMj8K3CcAudDKveb/MKA
	tepkQxR0dAkJQfcZa1QTeQxFQZz9IFIC+4CtDccoBjhyY9u/pw/MgXWUmXwbuSgJd2v4g3AaFeUI0
	vI16kF1/LPIepNmk+leEARhVDyq/VhO1y0kDN4Psqs+8HEeVpmVJ+his1ingUrDj53yWWHwnOYmHS
	yNoD+POzxd8N6SkimTYLS0Dufom61tcFPkPT5hd7L78JctxQlMK3LnAVpA+yenjKhlJS5tDjLGPaG
	EOR2RbXn1RNLrvA6Fs+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW0x3-0000000DW12-0Es7;
	Fri, 02 Feb 2024 21:20:05 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW0wO-0000000DVsk-0JQm
	for linux-i3c@lists.infradead.org;
	Fri, 02 Feb 2024 21:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706908756; x=1738444756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5ksOdQd8ghM9qXKkEiudkWeCW/Mz361KuBeBg2gzM/4=;
  b=jCN4/0qXl/KlujQjDEyY4caSFdDwcjq7K1IxvrNrQqd1Vzw9xqCDkmuz
   kJ5CItoO5hz1ottOUqcfgyJBg55HrtEJO231HNLDNgmiRh5SE3tTI5S7Z
   gyYYgQCj5qBhlQziqEJC2Cq+ybCPKMRrwUotASG6bjdL/T5gVEYHTw7e1
   tTGjSu2Nu/g1kAV6T1PuFbQZ4P8qC6m4wxwCJTQQiOnEV3yWXel9jCW/X
   oXsLj6rPU2IPdubStbuo8QwN1aGndz22iN+7k7/HgsY7lH70S2WA/kXlJ
   mJWcZE20hMyup72d2uGaq/0gR1f+V8bgG5ufTTARDytilMP8yVf5w9/w7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="148411"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="148411"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 13:19:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="932581866"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="932581866"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2024 13:19:05 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW0wB-0004H0-1Q;
	Fri, 02 Feb 2024 21:19:03 +0000
Date: Sat, 3 Feb 2024 05:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, ilpo.jarvinen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
	imx@lists.linux.dev, jirislaby@kernel.org, joe@perches.com,
	krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, miquel.raynal@bootlin.com,
	robh@kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v5 1/8] i3c: add target mode support
Message-ID: <202402030437.GdGCrKeK-lkp@intel.com>
References: <20240129195321.229867-2-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129195321.229867-2-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_131916_285912_C9FE5132 
X-CRM114-Status: GOOD (  11.18  )
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

Hi Frank,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus robh/for-next linus/master v6.8-rc2 next-20240202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/i3c-add-target-mode-support/20240130-035826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20240129195321.229867-2-Frank.Li%40nxp.com
patch subject: [PATCH v5 1/8] i3c: add target mode support
config: sh-randconfig-r122-20240202 (https://download.01.org/0day-ci/archive/20240203/202402030437.GdGCrKeK-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240203/202402030437.GdGCrKeK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030437.GdGCrKeK-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/i3c/target.o: in function `i3c_target_ctrl_destroy':
>> target.c:(.text+0x264): undefined reference to `i3c_target_cfs_remove_ctrl_group'
   sh4-linux-ld: drivers/i3c/target.o: in function `__i3c_target_func_register_driver':
>> target.c:(.text+0x4bc): undefined reference to `i3c_target_cfs_add_func_group'
   sh4-linux-ld: drivers/i3c/target.o: in function `__i3c_target_ctrl_create':
>> target.c:(.text+0x778): undefined reference to `i3c_target_cfs_add_ctrl_group'
   sh4-linux-ld: drivers/i3c/target.o: in function `devm_i3c_target_ctrl_release':
   target.c:(.text+0x7b8): undefined reference to `i3c_target_cfs_remove_ctrl_group'
   sh4-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
   tc358746.c:(.text+0x17c4): undefined reference to `devm_clk_hw_register'
   sh4-linux-ld: tc358746.c:(.text+0x17c8): undefined reference to `devm_of_clk_add_hw_provider'
   sh4-linux-ld: tc358746.c:(.text+0x17cc): undefined reference to `of_clk_hw_simple_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
