Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A1BC48291
	for <linux-i3c@archiver.kernel.org>; Fri,  2 Feb 2024 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RsRfMzfZvRhm4M1ibpwhCoDtAyLllMv/QPzWw4YpdYo=; b=hOK0yCw1y+eOO7
	B+AYQW26k+9BEN/p5zZEz1BFkB3bCfx7IztszN7SFZREF8FA4ctkswOOP9qz22FNLzR8NIbTdjP0V
	UkJVmEDMJJulQ21VFaCy7rRQSJbp+AXsE5xUop2mUKKIvSVy6l3f2sg7fAXELyK8RjQKc9B+oDF7A
	V/kCxi8lBKw6NbChu1XsjBj0XP1cPntvuwN7GKXTGEWHlWMyin75wM14t2+klONGSfPJSeuAjBvXN
	YfAQoFuHvKEykEk4Bw12HA8OoGQGI35uhHo+S8pABz+tJYi8PlaS+VVfPfV663qslQbXR7s4ek64W
	/jFH245GhOAv1CY1rBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxN4-0000000Cazc-3shF;
	Fri, 02 Feb 2024 17:30:34 +0000
Received: from mgamail.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxN2-0000000Cay1-2ctE
	for linux-i3c@lists.infradead.org;
	Fri, 02 Feb 2024 17:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706895032; x=1738431032;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xVKQWBX8NhZBQTbsM4raS0q5/TbgyghNBv1ox3T5rSo=;
  b=YEr43f13MFaFwZigWm8y4n6oZ26fAB5F0ISsbsPH9tkXzft6gQz+Hf+t
   zRubc5K7Tdtwl9EfiIEmpCXwDWsdAgTVaPnRmgK4r8CdEcusFKAPTEcc/
   1Zx5mZLTPrG3HKP90FcnfESzny1mAP2dB8jvkZtOMGqUPxWvxeF+4TUvC
   lkLSpxToiV/Ib9FTYEXPd/YIJPcnZlTIB4yADc4CSsaJe51dCg6bhmdBj
   XRpLkLuHLAn1Y6OPnG3x7W0h01gCXfKX/i6C+1lfLGwyZCsN21tbNjG8J
   OFsvMxcNb0P89tMvJfXQWHYCC8LuiVCYMkcl6rA5WoxHxwaDfygDNQ6Mc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="435341919"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="435341919"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 09:30:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="127617"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Feb 2024 09:30:24 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVxMq-00046g-2c;
	Fri, 02 Feb 2024 17:30:21 +0000
Date: Sat, 3 Feb 2024 01:29:51 +0800
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
Message-ID: <202402030100.hmViPmOK-lkp@intel.com>
References: <20240129195321.229867-2-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129195321.229867-2-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_093032_706877_5726FB96 
X-CRM114-Status: GOOD (  14.87  )
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
config: x86_64-randconfig-104-20240202 (https://download.01.org/0day-ci/archive/20240203/202402030100.hmViPmOK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402030100.hmViPmOK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030100.hmViPmOK-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/i3c/target.o: in function `i3c_target_ctrl_destroy':
>> drivers/i3c/target.c:182: undefined reference to `i3c_target_cfs_remove_ctrl_group'
   ld: drivers/i3c/target.o: in function `__i3c_target_func_register_driver':
>> drivers/i3c/target.c:406: undefined reference to `i3c_target_cfs_add_func_group'
   ld: drivers/i3c/target.o: in function `__i3c_target_ctrl_create':
>> drivers/i3c/target.c:141: undefined reference to `i3c_target_cfs_add_ctrl_group'
   ld: drivers/i3c/target.o: in function `i3c_target_ctrl_destroy':
>> drivers/i3c/target.c:182: undefined reference to `i3c_target_cfs_remove_ctrl_group'


vim +182 drivers/i3c/target.c

   104	
   105	/**
   106	 * __i3c_target_ctrl_create() - create a new target controller device
   107	 * @dev: device that is creating the new target controller
   108	 * @ops: function pointers for performing target controller  operations
   109	 * @owner: the owner of the module that creates the target controller device
   110	 *
   111	 * Return: Pointer to struct i3c_target_ctrl
   112	 */
   113	struct i3c_target_ctrl *
   114	__i3c_target_ctrl_create(struct device *dev, const struct i3c_target_ctrl_ops *ops,
   115				struct module *owner)
   116	{
   117		struct i3c_target_ctrl *ctrl;
   118		int ret;
   119	
   120		if (WARN_ON(!dev))
   121			return ERR_PTR(-EINVAL);
   122	
   123		ctrl = kzalloc(sizeof(*ctrl), GFP_KERNEL);
   124		if (!ctrl)
   125			return ERR_PTR(-ENOMEM);
   126	
   127		device_initialize(&ctrl->dev);
   128		ctrl->dev.class = i3c_target_ctrl_class;
   129		ctrl->dev.parent = dev;
   130		ctrl->dev.release = i3c_target_ctrl_release;
   131		ctrl->ops = ops;
   132	
   133		ret = dev_set_name(&ctrl->dev, "%s", dev_name(dev));
   134		if (ret)
   135			goto put_dev;
   136	
   137		ret = device_add(&ctrl->dev);
   138		if (ret)
   139			goto put_dev;
   140	
 > 141		ctrl->group = i3c_target_cfs_add_ctrl_group(ctrl);
   142		if (!ctrl->group)
   143			goto put_dev;
   144	
   145		return ctrl;
   146	
   147	put_dev:
   148		put_device(&ctrl->dev);
   149		kfree(ctrl);
   150	
   151		return ERR_PTR(ret);
   152	}
   153	EXPORT_SYMBOL_GPL(__i3c_target_ctrl_create);
   154	
   155	/**
   156	 * devm_i3c_target_ctrl_destroy() - destroy the target controller device
   157	 * @dev: device that hat has to be destroy
   158	 * @ctrl: the target controller device that has to be destroy
   159	 *
   160	 * Invoke to create a new target controller device and add it to i3c_target class. While at that, it
   161	 * also associates the device with the i3c_target using devres. On driver detach, release function
   162	 * is invoked on the devres data, then devres data is freed.
   163	 */
   164	void devm_i3c_target_ctrl_destroy(struct device *dev, struct i3c_target_ctrl *ctrl)
   165	{
   166		int r;
   167	
   168		r = devres_destroy(dev, devm_i3c_target_ctrl_release, devm_i3c_target_ctrl_match,
   169				   ctrl);
   170		dev_WARN_ONCE(dev, r, "couldn't find I3C controller resource\n");
   171	}
   172	EXPORT_SYMBOL_GPL(devm_i3c_target_ctrl_destroy);
   173	
   174	/**
   175	 * i3c_target_ctrl_destroy() - destroy the target controller device
   176	 * @ctrl: the target controller device that has to be destroyed
   177	 *
   178	 * Invoke to destroy the I3C target device
   179	 */
   180	void i3c_target_ctrl_destroy(struct i3c_target_ctrl *ctrl)
   181	{
 > 182		i3c_target_cfs_remove_ctrl_group(ctrl->group);
   183		device_unregister(&ctrl->dev);
   184	}
   185	EXPORT_SYMBOL_GPL(i3c_target_ctrl_destroy);
   186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
