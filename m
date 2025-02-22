Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C0DC021B2
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Feb 2025 08:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVcjA8WuhXnjD/ofZKL/7TtBUNS2MRqLpuEQEqZwkOw=; b=IE+VTbmbL8EKhU
	XTAfAk4hsPSuzWsXPni6HpltUMkaTqRpOYqSRk3ZHJo7ThB1tVqGkZS+Nf2zTxxpVMZcEnrjsCrAY
	BUUsZ7Aa43R8qZ2fxHJhuPTkXvi+lZmurTmDMqmEsD4rzs/UbcBlJS9t+KVdPuXENoPmsEepVM0YW
	C//OeWqD5ACShZA97+iZSJcuf0K9xBQFmWX8E++blrpF/q/QQYL06SkLzgJM+vK9swIgYSckjIDMr
	PpI9crT1j0qaBP602tTcIfUByOJxm6i9d/mLwxQJXMW6Y5RiASzVQumqd8tGZG5x02K+HNaOaqqh2
	yWgMOYZrM5M1X6yqC0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlkRJ-00000007bX4-25rz;
	Sat, 22 Feb 2025 08:00:45 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlkRG-00000007bW8-0H6q
	for linux-i3c@lists.infradead.org;
	Sat, 22 Feb 2025 08:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740211242; x=1771747242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VDIgSMNF/GuTbpRvpV0HFWzpA8QC7+IdUuqcvSlzDGU=;
  b=JcKMe8ttfHNx9lOGCF2TUHdglxmMmJvg7/VNhVjZwX8PjTLLJWBLjiRO
   5J2cf4iU8N4lDQlVIa4Vt6TBFLCb43PdvZModuYIxQUMnIOyDttd60yQN
   26+kFk5KitYoXaJCAwQk2g+WhIXchhD/nEzOK4u+ke09wsIrxUoJvj3Wr
   xOJOwpVGvpDQjbbTZYL2lGRKUkc0nkHZef6C/mbje1OHnK1SWl2V/CPCa
   wukYxhrYQuSFZSNNc4dtfak0SRXgHr3C76oSMjSjWiB/7Xwc5wVL1JLBH
   3+nlk8PYIo1JVKX+4gZHOjIsV0Amjhkv8GVd3DFwH2f0zWynlYBgdyREQ
   w==;
X-CSE-ConnectionGUID: T+pB6eW0QaCfVRYkcgM0OQ==
X-CSE-MsgGUID: dTd6w1eFTyWS9cKEQe5ZFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41234929"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41234929"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 00:00:35 -0800
X-CSE-ConnectionGUID: lwzyr+XTQNukRQe8y9bwMQ==
X-CSE-MsgGUID: l38OadvYQ0G0LES2hVGxTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="138803309"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Feb 2025 00:00:32 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlkR3-0006ON-31;
	Sat, 22 Feb 2025 08:00:29 +0000
Date: Sat, 22 Feb 2025 15:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: Stanley Chu <stanley.chuys@gmail.com>, frank.li@nxp.com,
	miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v3 2/4] i3c: master: svc: Add support for Nuvoton npcm845
 i3c
Message-ID: <202502221511.0BCyUyEU-lkp@intel.com>
References: <20250221063528.1810007-3-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250221063528.1810007-3-yschu@nuvoton.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_000042_178915_EB231A1A 
X-CRM114-Status: GOOD (  11.63  )
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
[also build test WARNING on linus/master v6.14-rc3 next-20250221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanley-Chu/dt-bindings-i3c-silvaco-Add-npcm845-compatible-string/20250221-143909
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250221063528.1810007-3-yschu%40nuvoton.com
patch subject: [PATCH v3 2/4] i3c: master: svc: Add support for Nuvoton npcm845 i3c
config: arm-randconfig-003-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221511.0BCyUyEU-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221511.0BCyUyEU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221511.0BCyUyEU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i3c/master/svc-i3c-master.c:240: warning: Function parameter or struct member 'drvdata' not described in 'svc_i3c_master'


vim +240 drivers/i3c/master/svc-i3c-master.c

28c82e7b13d49b1 Stanley Chu   2025-02-21  180  
dd3c52846d5954a Miquel Raynal 2021-01-21  181  /**
dd3c52846d5954a Miquel Raynal 2021-01-21  182   * struct svc_i3c_master - Silvaco I3C Master structure
dd3c52846d5954a Miquel Raynal 2021-01-21  183   * @base: I3C master controller
dd3c52846d5954a Miquel Raynal 2021-01-21  184   * @dev: Corresponding device
dd3c52846d5954a Miquel Raynal 2021-01-21  185   * @regs: Memory mapping
5496eac6ad7428f Miquel Raynal 2023-08-17  186   * @saved_regs: Volatile values for PM operations
dd3c52846d5954a Miquel Raynal 2021-01-21  187   * @free_slots: Bit array of available slots
dd3c52846d5954a Miquel Raynal 2021-01-21  188   * @addrs: Array containing the dynamic addresses of each attached device
dd3c52846d5954a Miquel Raynal 2021-01-21  189   * @descs: Array of descriptors, one per attached device
dd3c52846d5954a Miquel Raynal 2021-01-21  190   * @hj_work: Hot-join work
dd3c52846d5954a Miquel Raynal 2021-01-21  191   * @ibi_work: IBI work
dd3c52846d5954a Miquel Raynal 2021-01-21  192   * @irq: Main interrupt
dd3c52846d5954a Miquel Raynal 2021-01-21  193   * @pclk: System clock
dd3c52846d5954a Miquel Raynal 2021-01-21  194   * @fclk: Fast clock (bus)
dd3c52846d5954a Miquel Raynal 2021-01-21  195   * @sclk: Slow clock (other events)
dd3c52846d5954a Miquel Raynal 2021-01-21  196   * @xferqueue: Transfer queue structure
dd3c52846d5954a Miquel Raynal 2021-01-21  197   * @xferqueue.list: List member
dd3c52846d5954a Miquel Raynal 2021-01-21  198   * @xferqueue.cur: Current ongoing transfer
dd3c52846d5954a Miquel Raynal 2021-01-21  199   * @xferqueue.lock: Queue lock
dd3c52846d5954a Miquel Raynal 2021-01-21  200   * @ibi: IBI structure
dd3c52846d5954a Miquel Raynal 2021-01-21  201   * @ibi.num_slots: Number of slots available in @ibi.slots
dd3c52846d5954a Miquel Raynal 2021-01-21  202   * @ibi.slots: Available IBI slots
dd3c52846d5954a Miquel Raynal 2021-01-21  203   * @ibi.tbq_slot: To be queued IBI slot
dd3c52846d5954a Miquel Raynal 2021-01-21  204   * @ibi.lock: IBI lock
6bf3fc268183816 Frank Li      2023-10-23  205   * @lock: Transfer lock, protect between IBI work thread and callbacks from master
05b26c31a4859af Frank Li      2023-12-01  206   * @enabled_events: Bit masks for enable events (IBI, HotJoin).
20ade67bb1645f5 Carlos Song   2024-09-10  207   * @mctrl_config: Configuration value in SVC_I3C_MCTRL for setting speed back.
dd3c52846d5954a Miquel Raynal 2021-01-21  208   */
dd3c52846d5954a Miquel Raynal 2021-01-21  209  struct svc_i3c_master {
dd3c52846d5954a Miquel Raynal 2021-01-21  210  	struct i3c_master_controller base;
dd3c52846d5954a Miquel Raynal 2021-01-21  211  	struct device *dev;
dd3c52846d5954a Miquel Raynal 2021-01-21  212  	void __iomem *regs;
1c5ee2a77b1bacd Clark Wang    2023-05-17  213  	struct svc_i3c_regs_save saved_regs;
dd3c52846d5954a Miquel Raynal 2021-01-21  214  	u32 free_slots;
dd3c52846d5954a Miquel Raynal 2021-01-21  215  	u8 addrs[SVC_I3C_MAX_DEVS];
dd3c52846d5954a Miquel Raynal 2021-01-21  216  	struct i3c_dev_desc *descs[SVC_I3C_MAX_DEVS];
dd3c52846d5954a Miquel Raynal 2021-01-21  217  	struct work_struct hj_work;
dd3c52846d5954a Miquel Raynal 2021-01-21  218  	struct work_struct ibi_work;
dd3c52846d5954a Miquel Raynal 2021-01-21  219  	int irq;
dd3c52846d5954a Miquel Raynal 2021-01-21  220  	struct clk *pclk;
dd3c52846d5954a Miquel Raynal 2021-01-21  221  	struct clk *fclk;
dd3c52846d5954a Miquel Raynal 2021-01-21  222  	struct clk *sclk;
dd3c52846d5954a Miquel Raynal 2021-01-21  223  	struct {
dd3c52846d5954a Miquel Raynal 2021-01-21  224  		struct list_head list;
dd3c52846d5954a Miquel Raynal 2021-01-21  225  		struct svc_i3c_xfer *cur;
dd3c52846d5954a Miquel Raynal 2021-01-21  226  		/* Prevent races between transfers */
dd3c52846d5954a Miquel Raynal 2021-01-21  227  		spinlock_t lock;
dd3c52846d5954a Miquel Raynal 2021-01-21  228  	} xferqueue;
dd3c52846d5954a Miquel Raynal 2021-01-21  229  	struct {
dd3c52846d5954a Miquel Raynal 2021-01-21  230  		unsigned int num_slots;
dd3c52846d5954a Miquel Raynal 2021-01-21  231  		struct i3c_dev_desc **slots;
dd3c52846d5954a Miquel Raynal 2021-01-21  232  		struct i3c_ibi_slot *tbq_slot;
dd3c52846d5954a Miquel Raynal 2021-01-21  233  		/* Prevent races within IBI handlers */
dd3c52846d5954a Miquel Raynal 2021-01-21  234  		spinlock_t lock;
dd3c52846d5954a Miquel Raynal 2021-01-21  235  	} ibi;
6bf3fc268183816 Frank Li      2023-10-23  236  	struct mutex lock;
28c82e7b13d49b1 Stanley Chu   2025-02-21  237  	const struct svc_i3c_drvdata *drvdata;
25bc99be5fe5385 Frank Li      2024-11-01  238  	u32 enabled_events;
20ade67bb1645f5 Carlos Song   2024-09-10  239  	u32 mctrl_config;
dd3c52846d5954a Miquel Raynal 2021-01-21 @240  };
dd3c52846d5954a Miquel Raynal 2021-01-21  241  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
