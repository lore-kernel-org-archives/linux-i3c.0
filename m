Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A28AC52D71
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Aug 2024 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMy0J5LrR8UqWdi7MGqvldYW1O7OpTXlwdD/hmwkH3E=; b=pyBlBwtqtZDbpH
	OO44YMo6IWjoLyALWThY8IHKQL1g0qHa1HiEs2i7ycUdudnnQWtLSycQ4qVmIFVe2F1sqczzDnySW
	RiZE/tm7SUDhln6zYf4h5KNEQpHOpSapTIcDGKbq9JnEpIIa+auntnQgLUusIsvIOm4hX6kKHixk6
	BZOyElZRgnnx/VomDqyEgLRMsfo7eGxG2EDU3uRkExMEgFylqBiaVcIcRWhdRb4QrqMPjwNwGUe+z
	21OK9Kh+xv5hZvSAFpRKYPx4hfbwwxkdEEJkd5++DUtsB747PMbrLjpAJa+9DgstEdAo/ZXKjktBC
	5ioQfiprv38f/MhU8twA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbMPE-00000002EDX-3AoD;
	Tue, 06 Aug 2024 15:47:24 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbMPA-00000002EDA-3TOu
	for linux-i3c@lists.infradead.org;
	Tue, 06 Aug 2024 15:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722959241; x=1754495241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B5W64/YtAb0TWD/SCkxVwqRn9FRktUCb7dR2fufvfHQ=;
  b=BWzNIM9TBOmkOt4Z3X2zXH8ISfU7L9Jy03qn7IEde1ifvDC5aR7v/0A2
   SPza7aMnOb7GEn8W8KhKbCoS9fcrqbzHrzdsL1BFxxvWYeafnb4wYWhqM
   RKQTJpbq7JBrPZ3Zz/RvywTgAFkRdi29Sw+k4NfNAaOjcZSwY0qguvKCN
   SlCTAPcw25fiug+0DMre3HgG7wFAhGET947+t7eiqKzoAsVzpp7ZtMt3z
   ygtrO+F3iajx1LBnEOK1Bp+IemFg+MtH88obJqLOVl4RmzWV6OQhYbbw2
   8xppuExcHC5e1OtuZlCM6bZbNC3HGq7Kv27yFzosVnjg8echFNGDtSnAx
   Q==;
X-CSE-ConnectionGUID: eAJ5gVArRvqTtowLKP7hIg==
X-CSE-MsgGUID: Z2zlxlikTbyhhA0r5V5kTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="43512442"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="43512442"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 08:47:19 -0700
X-CSE-ConnectionGUID: qYKSYn55Qom1+YpqxB4m4w==
X-CSE-MsgGUID: Y76qsy3gR9OiH9MxETeWxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="56629159"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 06 Aug 2024 08:47:17 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbMP4-0004cm-15;
	Tue, 06 Aug 2024 15:47:14 +0000
Date: Tue, 6 Aug 2024 23:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: carlos.song@nxp.com, alexandre.belloni@bootlin.com, frank.li@nxp.com,
	miquel.raynal@bootlin.com, conor.culhane@silvaco.com
Cc: oe-kbuild-all@lists.linux.dev, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-imx@nxp.com
Subject: Re: [PATCH 2/2] i3c: master: svc: use slow speed for first broadcast
 address
Message-ID: <202408062304.MtyfBIl7-lkp@intel.com>
References: <20240806064851.2425797-2-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240806064851.2425797-2-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_084720_970673_8E6ECC96 
X-CRM114-Status: GOOD (  11.06  )
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

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.11-rc2 next-20240806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/carlos-song-nxp-com/i3c-master-svc-use-slow-speed-for-first-broadcast-address/20240806-144941
base:   linus/master
patch link:    https://lore.kernel.org/r/20240806064851.2425797-2-carlos.song%40nxp.com
patch subject: [PATCH 2/2] i3c: master: svc: use slow speed for first broadcast address
config: i386-buildonly-randconfig-001-20240806 (https://download.01.org/0day-ci/archive/20240806/202408062304.MtyfBIl7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408062304.MtyfBIl7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408062304.MtyfBIl7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i3c/master/svc-i3c-master.c:216: warning: Function parameter or struct member 'mctrl_config' not described in 'svc_i3c_master'


vim +216 drivers/i3c/master/svc-i3c-master.c

1c5ee2a77b1bac Clark Wang    2023-05-17  158  
dd3c52846d5954 Miquel Raynal 2021-01-21  159  /**
dd3c52846d5954 Miquel Raynal 2021-01-21  160   * struct svc_i3c_master - Silvaco I3C Master structure
dd3c52846d5954 Miquel Raynal 2021-01-21  161   * @base: I3C master controller
dd3c52846d5954 Miquel Raynal 2021-01-21  162   * @dev: Corresponding device
dd3c52846d5954 Miquel Raynal 2021-01-21  163   * @regs: Memory mapping
5496eac6ad7428 Miquel Raynal 2023-08-17  164   * @saved_regs: Volatile values for PM operations
dd3c52846d5954 Miquel Raynal 2021-01-21  165   * @free_slots: Bit array of available slots
dd3c52846d5954 Miquel Raynal 2021-01-21  166   * @addrs: Array containing the dynamic addresses of each attached device
dd3c52846d5954 Miquel Raynal 2021-01-21  167   * @descs: Array of descriptors, one per attached device
dd3c52846d5954 Miquel Raynal 2021-01-21  168   * @hj_work: Hot-join work
dd3c52846d5954 Miquel Raynal 2021-01-21  169   * @ibi_work: IBI work
dd3c52846d5954 Miquel Raynal 2021-01-21  170   * @irq: Main interrupt
dd3c52846d5954 Miquel Raynal 2021-01-21  171   * @pclk: System clock
dd3c52846d5954 Miquel Raynal 2021-01-21  172   * @fclk: Fast clock (bus)
dd3c52846d5954 Miquel Raynal 2021-01-21  173   * @sclk: Slow clock (other events)
dd3c52846d5954 Miquel Raynal 2021-01-21  174   * @xferqueue: Transfer queue structure
dd3c52846d5954 Miquel Raynal 2021-01-21  175   * @xferqueue.list: List member
dd3c52846d5954 Miquel Raynal 2021-01-21  176   * @xferqueue.cur: Current ongoing transfer
dd3c52846d5954 Miquel Raynal 2021-01-21  177   * @xferqueue.lock: Queue lock
dd3c52846d5954 Miquel Raynal 2021-01-21  178   * @ibi: IBI structure
dd3c52846d5954 Miquel Raynal 2021-01-21  179   * @ibi.num_slots: Number of slots available in @ibi.slots
dd3c52846d5954 Miquel Raynal 2021-01-21  180   * @ibi.slots: Available IBI slots
dd3c52846d5954 Miquel Raynal 2021-01-21  181   * @ibi.tbq_slot: To be queued IBI slot
dd3c52846d5954 Miquel Raynal 2021-01-21  182   * @ibi.lock: IBI lock
6bf3fc26818381 Frank Li      2023-10-23  183   * @lock: Transfer lock, protect between IBI work thread and callbacks from master
05b26c31a4859a Frank Li      2023-12-01  184   * @enabled_events: Bit masks for enable events (IBI, HotJoin).
dd3c52846d5954 Miquel Raynal 2021-01-21  185   */
dd3c52846d5954 Miquel Raynal 2021-01-21  186  struct svc_i3c_master {
dd3c52846d5954 Miquel Raynal 2021-01-21  187  	struct i3c_master_controller base;
dd3c52846d5954 Miquel Raynal 2021-01-21  188  	struct device *dev;
dd3c52846d5954 Miquel Raynal 2021-01-21  189  	void __iomem *regs;
1c5ee2a77b1bac Clark Wang    2023-05-17  190  	struct svc_i3c_regs_save saved_regs;
dd3c52846d5954 Miquel Raynal 2021-01-21  191  	u32 free_slots;
dd3c52846d5954 Miquel Raynal 2021-01-21  192  	u8 addrs[SVC_I3C_MAX_DEVS];
dd3c52846d5954 Miquel Raynal 2021-01-21  193  	struct i3c_dev_desc *descs[SVC_I3C_MAX_DEVS];
dd3c52846d5954 Miquel Raynal 2021-01-21  194  	struct work_struct hj_work;
dd3c52846d5954 Miquel Raynal 2021-01-21  195  	struct work_struct ibi_work;
dd3c52846d5954 Miquel Raynal 2021-01-21  196  	int irq;
dd3c52846d5954 Miquel Raynal 2021-01-21  197  	struct clk *pclk;
dd3c52846d5954 Miquel Raynal 2021-01-21  198  	struct clk *fclk;
dd3c52846d5954 Miquel Raynal 2021-01-21  199  	struct clk *sclk;
dd3c52846d5954 Miquel Raynal 2021-01-21  200  	struct {
dd3c52846d5954 Miquel Raynal 2021-01-21  201  		struct list_head list;
dd3c52846d5954 Miquel Raynal 2021-01-21  202  		struct svc_i3c_xfer *cur;
dd3c52846d5954 Miquel Raynal 2021-01-21  203  		/* Prevent races between transfers */
dd3c52846d5954 Miquel Raynal 2021-01-21  204  		spinlock_t lock;
dd3c52846d5954 Miquel Raynal 2021-01-21  205  	} xferqueue;
dd3c52846d5954 Miquel Raynal 2021-01-21  206  	struct {
dd3c52846d5954 Miquel Raynal 2021-01-21  207  		unsigned int num_slots;
dd3c52846d5954 Miquel Raynal 2021-01-21  208  		struct i3c_dev_desc **slots;
dd3c52846d5954 Miquel Raynal 2021-01-21  209  		struct i3c_ibi_slot *tbq_slot;
dd3c52846d5954 Miquel Raynal 2021-01-21  210  		/* Prevent races within IBI handlers */
dd3c52846d5954 Miquel Raynal 2021-01-21  211  		spinlock_t lock;
dd3c52846d5954 Miquel Raynal 2021-01-21  212  	} ibi;
6bf3fc26818381 Frank Li      2023-10-23  213  	struct mutex lock;
05b26c31a4859a Frank Li      2023-12-01  214  	int enabled_events;
7f8771c6b3f96d Carlos Song   2024-08-06  215  	u32 mctrl_config;
dd3c52846d5954 Miquel Raynal 2021-01-21 @216  };
dd3c52846d5954 Miquel Raynal 2021-01-21  217  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
