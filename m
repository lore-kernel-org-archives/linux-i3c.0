Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0055BCDB483
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 13:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDaTSvrHePzZY6x+tdus2m1wKEm4WQJFaJB/6Ji0G8Y=; b=cyp26IlW3C5q0M
	J2LV7DL2ZyCyN/7ghvJ/wyr+feICGE9hascXyETI0+gGOr2l3XXEF4jDMcJY+yenDuULQgdnnvTYw
	jgzR1yG02hJ05pUQ4DLYy1zBmn0wJAJpW4lNgaeqVUsyQ/Xt/gvvk1mQ6a/4DRmkgV419kHqeJFRp
	3oRPyHcNPOqeR93Jv+R5duS7Z897+2YPAnc1+wbrJs1O6rvwb15YCG9AkINrBf/bgQ5tHCcw4U6Rm
	+I54eb7Jja7NchGQY/x+N1uVlzsHPiDvU4A9bABh1mbyp/9NeYLO3XTiD/i+lJmgpMBwSEPLkCZb4
	7NnY09Cc/F78QpVHMjig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qskDK-00CQmh-0i;
	Tue, 17 Oct 2023 13:34:26 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qskDH-00CQm8-0E
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 13:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697549663; x=1729085663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0Ff530asQwhzMuaCrXBgBn7hMKrFyVFKwARb+hoQLog=;
  b=QDKxQ7pCKDcC+Kx5tIUCmSBow7eLsbKatPMSILEboMdWyaAsqh34Tzuc
   3Lv8AiaSlPeSfdYpvSTz0C3eAp+Yb8D28DlaPxIf8imxFqaq4izaKOnYQ
   5U4HbRLdSBXlW1N3Xb8r8o6r5fYDSkeXVhfZdjnyEVNAjx9RZFKvyHZwf
   nfyGsZnOkyb2E8Np6hvjutK+MYtEcbuKdR47mtA353LpBfRllBWKfvfFC
   YFR1RD0cohC2cBZalcyACRPcKOMfJ+EZJ/30xpedNwYspoVfoH1iJ3yQ/
   aQJ7C+xo03wTJEI1dpGQ8X+g4VsaG8ugjyyDpw9EbxOS6OtljLNCI0OxB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="449999746"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="449999746"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 06:34:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="749697972"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="749697972"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Oct 2023 06:34:18 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qskD8-0009e1-1K;
	Tue, 17 Oct 2023 13:34:14 +0000
Date: Tue, 17 Oct 2023 21:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, miquel.raynal@bootlin.com,
	conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
	joe@perches.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/6] i3c: master: svc: fix race condition in ibi work
 thread
Message-ID: <202310172150.4GVdV44X-lkp@intel.com>
References: <20231016153232.2851095-2-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231016153232.2851095-2-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_063423_204708_BB0DFB4F 
X-CRM114-Status: GOOD (  11.34  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc6 next-20231017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/i3c-master-svc-fix-race-condition-in-ibi-work-thread/20231017-151123
base:   linus/master
patch link:    https://lore.kernel.org/r/20231016153232.2851095-2-Frank.Li%40nxp.com
patch subject: [PATCH 1/6] i3c: master: svc: fix race condition in ibi work thread
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231017/202310172150.4GVdV44X-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310172150.4GVdV44X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310172150.4GVdV44X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i3c/master/svc-i3c-master.c:207: warning: Function parameter or member 'lock' not described in 'svc_i3c_master'


vim +207 drivers/i3c/master/svc-i3c-master.c

1c5ee2a77b1bacd Clark Wang    2023-05-17  153  
dd3c52846d5954a Miquel Raynal 2021-01-21  154  /**
dd3c52846d5954a Miquel Raynal 2021-01-21  155   * struct svc_i3c_master - Silvaco I3C Master structure
dd3c52846d5954a Miquel Raynal 2021-01-21  156   * @base: I3C master controller
dd3c52846d5954a Miquel Raynal 2021-01-21  157   * @dev: Corresponding device
dd3c52846d5954a Miquel Raynal 2021-01-21  158   * @regs: Memory mapping
5496eac6ad7428f Miquel Raynal 2023-08-17  159   * @saved_regs: Volatile values for PM operations
dd3c52846d5954a Miquel Raynal 2021-01-21  160   * @free_slots: Bit array of available slots
dd3c52846d5954a Miquel Raynal 2021-01-21  161   * @addrs: Array containing the dynamic addresses of each attached device
dd3c52846d5954a Miquel Raynal 2021-01-21  162   * @descs: Array of descriptors, one per attached device
dd3c52846d5954a Miquel Raynal 2021-01-21  163   * @hj_work: Hot-join work
dd3c52846d5954a Miquel Raynal 2021-01-21  164   * @ibi_work: IBI work
dd3c52846d5954a Miquel Raynal 2021-01-21  165   * @irq: Main interrupt
dd3c52846d5954a Miquel Raynal 2021-01-21  166   * @pclk: System clock
dd3c52846d5954a Miquel Raynal 2021-01-21  167   * @fclk: Fast clock (bus)
dd3c52846d5954a Miquel Raynal 2021-01-21  168   * @sclk: Slow clock (other events)
dd3c52846d5954a Miquel Raynal 2021-01-21  169   * @xferqueue: Transfer queue structure
dd3c52846d5954a Miquel Raynal 2021-01-21  170   * @xferqueue.list: List member
dd3c52846d5954a Miquel Raynal 2021-01-21  171   * @xferqueue.cur: Current ongoing transfer
dd3c52846d5954a Miquel Raynal 2021-01-21  172   * @xferqueue.lock: Queue lock
dd3c52846d5954a Miquel Raynal 2021-01-21  173   * @ibi: IBI structure
dd3c52846d5954a Miquel Raynal 2021-01-21  174   * @ibi.num_slots: Number of slots available in @ibi.slots
dd3c52846d5954a Miquel Raynal 2021-01-21  175   * @ibi.slots: Available IBI slots
dd3c52846d5954a Miquel Raynal 2021-01-21  176   * @ibi.tbq_slot: To be queued IBI slot
dd3c52846d5954a Miquel Raynal 2021-01-21  177   * @ibi.lock: IBI lock
dd3c52846d5954a Miquel Raynal 2021-01-21  178   */
dd3c52846d5954a Miquel Raynal 2021-01-21  179  struct svc_i3c_master {
dd3c52846d5954a Miquel Raynal 2021-01-21  180  	struct i3c_master_controller base;
dd3c52846d5954a Miquel Raynal 2021-01-21  181  	struct device *dev;
dd3c52846d5954a Miquel Raynal 2021-01-21  182  	void __iomem *regs;
1c5ee2a77b1bacd Clark Wang    2023-05-17  183  	struct svc_i3c_regs_save saved_regs;
dd3c52846d5954a Miquel Raynal 2021-01-21  184  	u32 free_slots;
dd3c52846d5954a Miquel Raynal 2021-01-21  185  	u8 addrs[SVC_I3C_MAX_DEVS];
dd3c52846d5954a Miquel Raynal 2021-01-21  186  	struct i3c_dev_desc *descs[SVC_I3C_MAX_DEVS];
dd3c52846d5954a Miquel Raynal 2021-01-21  187  	struct work_struct hj_work;
dd3c52846d5954a Miquel Raynal 2021-01-21  188  	struct work_struct ibi_work;
dd3c52846d5954a Miquel Raynal 2021-01-21  189  	int irq;
dd3c52846d5954a Miquel Raynal 2021-01-21  190  	struct clk *pclk;
dd3c52846d5954a Miquel Raynal 2021-01-21  191  	struct clk *fclk;
dd3c52846d5954a Miquel Raynal 2021-01-21  192  	struct clk *sclk;
dd3c52846d5954a Miquel Raynal 2021-01-21  193  	struct {
dd3c52846d5954a Miquel Raynal 2021-01-21  194  		struct list_head list;
dd3c52846d5954a Miquel Raynal 2021-01-21  195  		struct svc_i3c_xfer *cur;
dd3c52846d5954a Miquel Raynal 2021-01-21  196  		/* Prevent races between transfers */
dd3c52846d5954a Miquel Raynal 2021-01-21  197  		spinlock_t lock;
dd3c52846d5954a Miquel Raynal 2021-01-21  198  	} xferqueue;
dd3c52846d5954a Miquel Raynal 2021-01-21  199  	struct {
dd3c52846d5954a Miquel Raynal 2021-01-21  200  		unsigned int num_slots;
dd3c52846d5954a Miquel Raynal 2021-01-21  201  		struct i3c_dev_desc **slots;
dd3c52846d5954a Miquel Raynal 2021-01-21  202  		struct i3c_ibi_slot *tbq_slot;
dd3c52846d5954a Miquel Raynal 2021-01-21  203  		/* Prevent races within IBI handlers */
dd3c52846d5954a Miquel Raynal 2021-01-21  204  		spinlock_t lock;
dd3c52846d5954a Miquel Raynal 2021-01-21  205  	} ibi;
f32ae0219a47f74 Frank Li      2023-10-16  206  	struct mutex lock;
dd3c52846d5954a Miquel Raynal 2021-01-21 @207  };
dd3c52846d5954a Miquel Raynal 2021-01-21  208  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
