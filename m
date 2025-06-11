Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47632C71136
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Jun 2025 21:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ewpm+nuu4WvoBOJz04l9Rm2S0BpKGJKtnWDz9twOm8=; b=Kakhzts8YdZ4qQ
	OPq/bwDrDZ7wsHelrKAbv0v0vzRB2evnPhHt9WDDaice5I6kewG1uGuPNcazO0As6wutnI/GYCCyW
	ks3+RAiMVnmWZxpr7ZDGEyLoFDC4VdAkAda/41xY/GIu962HW8G4s0UTHlafWIkH8DNpjqBQ7LtWX
	BOSpt3/Xb5o786Gxde5faNrdHRuvltA0+HcKizZPul4WTleA/KQFiTNqhLenMwqJmUwfeABlCSh7A
	qEilvhxVxdwfNlqMHU1YNwLxdXhmjxyT2b3OjEplYC69rWSNbT+CzYGJ762T2/VVB+tfYoXKQ8HtF
	VheoLUGygHjvB7LCILLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTLq-0000000BOyj-3lRy;
	Wed, 11 Jun 2025 21:51:18 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRO6-0000000AypP-3shT
	for linux-i3c@lists.infradead.org;
	Wed, 11 Jun 2025 19:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749671131; x=1781207131;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6SBDGabYmWn9zhAMs+gfdPdeovDIlBUs303yghmly2w=;
  b=RBh46jyMb1+na/CuLdqlaI0TbeqHLjGIQGQZ2Onub85kT8SAogWyscSd
   FGK0GL/iJK/s0Yf8cAuJbgrv4wp3OZKSjOe8to8bDuWaPehL5XcEHw7Jc
   9qpvieg449sNFbXDkNR90pMSajkmssdBrpnRsonnWHgeC1GuoirVT2AME
   jQ8208qwPfXB5afPMQ42MI5ScPDlfnNjauUCRdaRAgSqvxCE+kxzFFIua
   QN1VUCNTbN6lpE/g0ZjfbVJ9/WtCKGnHZy10b0tZyW1ye4L7RU7ciQUSj
   Nf1Fy1RzCvABLuedgggoc6bDAEkNLYcZft7kRnfgvi5srhjcTAMfmpUpt
   Q==;
X-CSE-ConnectionGUID: okaKRNlaRd2zrxQJnuxvgQ==
X-CSE-MsgGUID: OP2W859xRL6ld1BA4vXjbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="74363499"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="74363499"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 12:45:31 -0700
X-CSE-ConnectionGUID: muKEUgxdS0yf6dAi2XQFew==
X-CSE-MsgGUID: Mhei7Q4ZQPGdriMYbifGCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="152067541"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jun 2025 12:45:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPRO0-000Aow-0e;
	Wed, 11 Jun 2025 19:45:24 +0000
Date: Thu, 12 Jun 2025 03:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, jk@codeconstruct.com.au,
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	aniketmaurya@google.com, jarkko.nikula@linux.intel.com,
	Shyam-sundar.S-k@amd.com, wsa+renesas@sang-engineering.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	BMC-SW@aspeedtech.com, elbadrym@google.com, romlem@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] i3c: ast2600: Generate T-bits to terminate IBI storm
Message-ID: <202506120357.1kFiVfmV-lkp@intel.com>
References: <20250611040203.487734-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611040203.487734-1-billy_tsai@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_124531_026289_0FACD8F8 
X-CRM114-Status: GOOD (  12.34  )
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

Hi Billy,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc1 next-20250611]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Billy-Tsai/i3c-ast2600-Generate-T-bits-to-terminate-IBI-storm/20250611-120300
base:   linus/master
patch link:    https://lore.kernel.org/r/20250611040203.487734-1-billy_tsai%40aspeedtech.com
patch subject: [PATCH] i3c: ast2600: Generate T-bits to terminate IBI storm
config: powerpc64-randconfig-r072-20250612 (https://download.01.org/0day-ci/archive/20250612/202506120357.1kFiVfmV-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506120357.1kFiVfmV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120357.1kFiVfmV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/i3c/master/ast2600-i3c-master.c: In function 'ast2600_i3c_fsm_exit_serv_ibi':
>> drivers/i3c/master/ast2600-i3c-master.c:146:10: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     state = FIELD_GET(CM_TFR_STS, readl(dw->regs + PRESENT_STATE));
             ^~~~~~~~~
   In file included from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from drivers/i3c/master/ast2600-i3c-master.c:11:
   drivers/i3c/master/ast2600-i3c-master.c: In function 'ast2600_i3c_gen_tbits_in':
>> drivers/i3c/master/ast2600-i3c-master.c:174:4: warning: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
       "Failed to exit the I3C fsm from %lx(MASTER_SERV_IBI): %d",
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:110:16: note: in definition of macro 'dev_printk_index_wrap'
      _p_func(dev, fmt, ##__VA_ARGS__);   \
                   ^~~
   include/linux/dev_printk.h:154:49: note: in expansion of macro 'dev_fmt'
     dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                    ^~~~~~~
   drivers/i3c/master/ast2600-i3c-master.c:173:3: note: in expansion of macro 'dev_err'
      dev_err(&dw->base.dev,
      ^~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +146 drivers/i3c/master/ast2600-i3c-master.c

   136	
   137	static bool ast2600_i3c_fsm_exit_serv_ibi(struct dw_i3c_master *dw)
   138	{
   139		u32 state;
   140	
   141		/*
   142		 * Clear the IBI queue to enable the hardware to generate SCL and
   143		 * begin detecting the T-bit low to stop reading IBI data.
   144		 */
   145		readl(dw->regs + IBI_QUEUE_STATUS);
 > 146		state = FIELD_GET(CM_TFR_STS, readl(dw->regs + PRESENT_STATE));
   147		if (state == CM_TFR_STS_MASTER_SERV_IBI)
   148			return false;
   149	
   150		return true;
   151	}
   152	
   153	static void ast2600_i3c_gen_tbits_in(struct dw_i3c_master *dw)
   154	{
   155		struct ast2600_i3c *i3c = to_ast2600_i3c(dw);
   156		bool is_idle;
   157		int ret;
   158	
   159		regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
   160				  AST2600_I3CG_REG1_SDA_IN_SW_MODE_VAL,
   161				  AST2600_I3CG_REG1_SDA_IN_SW_MODE_VAL);
   162		regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
   163				  AST2600_I3CG_REG1_SDA_IN_SW_MODE_EN,
   164				  AST2600_I3CG_REG1_SDA_IN_SW_MODE_EN);
   165	
   166		regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
   167				  AST2600_I3CG_REG1_SDA_IN_SW_MODE_VAL, 0);
   168		ret = readx_poll_timeout_atomic(ast2600_i3c_fsm_exit_serv_ibi, dw,
   169						is_idle, is_idle, 0, 2000000);
   170		regmap_write_bits(i3c->global_regs, AST2600_I3CG_REG1(i3c->global_idx),
   171				  AST2600_I3CG_REG1_SDA_IN_SW_MODE_EN, 0);
   172		if (ret)
   173			dev_err(&dw->base.dev,
 > 174				"Failed to exit the I3C fsm from %lx(MASTER_SERV_IBI): %d",
   175				FIELD_GET(CM_TFR_STS, readl(dw->regs + PRESENT_STATE)),
   176				ret);
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
