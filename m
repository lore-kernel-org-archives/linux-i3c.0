Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41AAD3C92A
	for <linux-i3c@archiver.kernel.org>; Sun, 20 Oct 2024 08:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ridLoA9YVq0dSGpFHhaQ3vqwHTz5g7JDur7hDVabxZU=; b=h10vwkPiGlFGjL
	wi37nCjBmSphs/eAC/s7Vzc0RlQ/kApvaOq2gS5PJDoCT9Bbi4btsuI1VAHtZjZDAFCBTjexjpiTN
	kxBgzA1nh4fmN9KLVQOonjLoKVRS6s4k5UgEXz5XfNfUk01HGLwXR0dgU41qrfAlYUg7e00sBZX6U
	hltru3WyHkjfV/JTRqUf2aOSPpWaKjBoyB7o3enyRvkzMQQlUIVMGQJCi5IrVZvIDGaSh6NV9tEgj
	i4xVx0LIUrEu9IDtqysZ3kG0bxnCqwifZ2lPIjwAlOEGQJRnpzbkvEHGxlrWPMDw5t8cQvEI1YNRY
	xI3QAaFcR5JDt2XjmDTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2R8z-00000004bxC-0wvM;
	Sun, 20 Oct 2024 08:18:33 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2R8w-00000004bw6-06Vl
	for linux-i3c@lists.infradead.org;
	Sun, 20 Oct 2024 08:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729412310; x=1760948310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3NzxkVGrO7pPIUNKeNwCxXAscAC8AJ361OHZMCTFBgU=;
  b=Vnugl+FhAQasnahIXXDzZp3lCacZQ2SyIDUbDS3BVoxxC0WBSxS47Wcp
   UOrmkOYQqkukv/9f+k4RLCrjrUj20uRXzZZJU7km7+zSE7PtuLsqGny9O
   RCkufy7pfW256kl0PA18icu6H6QxoX8qsaSzSnSMtCpsVTlsT5rN42EZQ
   Kc2EvOpofOa/M0S5XpmSzBK2LOMPvx3yT7NhoOjbz+6djuKFGBLWiuaAt
   HhbytwU1yKr5x4b4bxE6P6n7YJlNRQmmoka0xi5gwOAxuJt9PltJHnMLU
   k6UmzO79OjPmkeYqkpN/G7GHgBIu0FSAUikjMv+u0e7Y+gJt8gdNRnvGg
   Q==;
X-CSE-ConnectionGUID: YCbv5f4IRUOtYiVnEH+VYg==
X-CSE-MsgGUID: Y5QfrxDkQRClEZ5oYkuiGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28361620"
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="28361620"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 01:18:27 -0700
X-CSE-ConnectionGUID: KjTrDEsfSZWMY1QYC8/Ysg==
X-CSE-MsgGUID: 8ZXgqKwxRHyt13se9GOPzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="116712262"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Oct 2024 01:18:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2R8o-000Q4f-2B;
	Sun, 20 Oct 2024 08:18:22 +0000
Date: Sun, 20 Oct 2024 16:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Sanket.Goswami@amd.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 3/6] i3c: master: Add ACPI support to i3c subsystem
Message-ID: <202410201553.RtPfO9pR-lkp@intel.com>
References: <20241017150330.3035568-4-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241017150330.3035568-4-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_011830_132756_E4AFA72F 
X-CRM114-Status: GOOD (  11.39  )
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
[also build test ERROR on v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/i3c-dw-Add-support-for-AMDI0015-ACPI-ID/20241017-230810
base:   linus/master
patch link:    https://lore.kernel.org/r/20241017150330.3035568-4-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH 3/6] i3c: master: Add ACPI support to i3c subsystem
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20241020/202410201553.RtPfO9pR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201553.RtPfO9pR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201553.RtPfO9pR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i3c/master/dw-i3c-master.c: In function 'dw_i3c_common_probe':
   drivers/i3c/master/dw-i3c-master.c:1606:32: error: implicit declaration of function 'acpi_device_handle'; did you mean 'acpi_fwnode_handle'? [-Wimplicit-function-declaration]
    1606 |         master->base.ahandle = acpi_device_handle(ACPI_COMPANION(&pdev->dev));
         |                                ^~~~~~~~~~~~~~~~~~
         |                                acpi_fwnode_handle
>> drivers/i3c/master/dw-i3c-master.c:1606:30: error: assignment to 'acpi_handle' {aka 'void *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1606 |         master->base.ahandle = acpi_device_handle(ACPI_COMPANION(&pdev->dev));
         |                              ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +1606 drivers/i3c/master/dw-i3c-master.c

  1545	
  1546	int dw_i3c_common_probe(struct dw_i3c_master *master,
  1547				struct platform_device *pdev)
  1548	{
  1549		int ret, irq;
  1550	
  1551		if (!master->platform_ops)
  1552			master->platform_ops = &dw_i3c_platform_ops_default;
  1553	
  1554		master->dev = &pdev->dev;
  1555	
  1556		master->regs = devm_platform_ioremap_resource(pdev, 0);
  1557		if (IS_ERR(master->regs))
  1558			return PTR_ERR(master->regs);
  1559	
  1560		master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
  1561		if (IS_ERR(master->core_clk))
  1562			return PTR_ERR(master->core_clk);
  1563	
  1564		master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
  1565		if (IS_ERR(master->pclk))
  1566			return PTR_ERR(master->pclk);
  1567	
  1568		master->core_rst = devm_reset_control_get_optional_exclusive(&pdev->dev,
  1569									    "core_rst");
  1570		if (IS_ERR(master->core_rst))
  1571			return PTR_ERR(master->core_rst);
  1572	
  1573		reset_control_deassert(master->core_rst);
  1574	
  1575		spin_lock_init(&master->xferqueue.lock);
  1576		INIT_LIST_HEAD(&master->xferqueue.list);
  1577	
  1578		writel(INTR_ALL, master->regs + INTR_STATUS);
  1579		irq = platform_get_irq(pdev, 0);
  1580		ret = devm_request_irq(&pdev->dev, irq,
  1581				       dw_i3c_master_irq_handler, IRQF_SHARED,
  1582				       dev_name(&pdev->dev), master);
  1583		if (ret)
  1584			goto err_assert_rst;
  1585	
  1586		platform_set_drvdata(pdev, master);
  1587	
  1588		pm_runtime_set_autosuspend_delay(&pdev->dev, RPM_AUTOSUSPEND_TIMEOUT);
  1589		pm_runtime_use_autosuspend(&pdev->dev);
  1590		pm_runtime_set_active(&pdev->dev);
  1591		pm_runtime_enable(&pdev->dev);
  1592	
  1593		/* Information regarding the FIFOs/QUEUEs depth */
  1594		ret = readl(master->regs + QUEUE_STATUS_LEVEL);
  1595		master->caps.cmdfifodepth = QUEUE_STATUS_LEVEL_CMD(ret);
  1596	
  1597		ret = readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
  1598		master->caps.datafifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
  1599	
  1600		ret = readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
  1601		master->datstartaddr = ret;
  1602		master->maxdevs = ret >> 16;
  1603		master->free_pos = GENMASK(master->maxdevs - 1, 0);
  1604	
  1605		ACPI_COMPANION_SET(&master->base.dev, ACPI_COMPANION(&pdev->dev));
> 1606		master->base.ahandle = acpi_device_handle(ACPI_COMPANION(&pdev->dev));
  1607		if (!master->base.ahandle)
  1608			dev_err(&pdev->dev, "Failed to get acpi device handle\n");
  1609	
  1610		INIT_WORK(&master->hj_work, dw_i3c_hj_work);
  1611		ret = i3c_master_register(&master->base, &pdev->dev,
  1612					  &dw_mipi_i3c_ops, false);
  1613		if (ret)
  1614			goto err_disable_pm;
  1615	
  1616		return 0;
  1617	
  1618	err_disable_pm:
  1619		pm_runtime_disable(&pdev->dev);
  1620		pm_runtime_set_suspended(&pdev->dev);
  1621		pm_runtime_dont_use_autosuspend(&pdev->dev);
  1622	
  1623	err_assert_rst:
  1624		reset_control_assert(master->core_rst);
  1625	
  1626		return ret;
  1627	}
  1628	EXPORT_SYMBOL_GPL(dw_i3c_common_probe);
  1629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
