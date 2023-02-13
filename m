Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30389C636D4
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Feb 2023 20:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsSqWM+Vqp75ecCP1dWlMOne6kBvMqnTa+bzcKZsgCk=; b=UqLBaxLBscsd2R
	EZZsfsRsSjfxCb6g2c+tr1W41qhKcFI+MABQ+vdWEjIA/tKTpkXIsnVVPtPYd+DgrgP0IpFBEBgMz
	jmHf7NoTYiPfoHyu7wvLSTtYK4DZhpvVGDDhSucD2/uO+NEj5rwJgsSLlENm+wzAoBrYvaHEHCXpU
	eAlRHpz0Ihvzag/T6w+5yEdaaFeinpij/2mLrNIh6O7m+pP6TdHTbKzzrEOmotDL5uvCLmaBrVUT0
	mx7EjVkTJb6zsSfcVjHC48nT7C64jxc3clg9FlWy0Hn2zQXYrwQXuuTxwFDVP1BdXSSHv9p2FXZ2c
	Hx0Zfd7/79zKR8oPy3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRfGe-00G92P-TZ; Mon, 13 Feb 2023 20:17:40 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRfGb-00G91V-Gf
	for linux-i3c@lists.infradead.org; Mon, 13 Feb 2023 20:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676319457; x=1707855457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Sz/O16hhPwySqsAXoi0RNWs4GAjLfZ9MP3zySBHD/Q=;
  b=V1Wnr3pTOXCJwrA+D6tSJ2RW7QIJWS3OVQM3oZlCqqDWajCmytbUE62G
   JBpvvcpTmN2Wkvt80HpIpdjB9N9S9e4JQbUpS9HLBRwB0KqTDlap59WVA
   c5kZoNju1IK4kGMwP/+3NEi560JL3IOFLp0eM9UwjwxQZqEbhByhySI4h
   Mn0SFVyOUWrjAJ0sugZ6gWqMkP/oqKM842cXAjUdE/tObqrQKh0n+xA6m
   lC/1HzxfAQsHaVnQxb2L6/JKWwzRJ/Qnga0axtI+UJH+mOjHUpkhBnX0S
   3OhBoDnKOWvF+SibWW7dSy/vlJ6DqB4gu8tmJdtf87DjV460mJekCiwoG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332303419"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="332303419"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 12:17:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="792848288"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="792848288"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 13 Feb 2023 12:17:33 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRfGW-0007zN-2p;
	Mon, 13 Feb 2023 20:17:32 +0000
Date: Tue, 14 Feb 2023 04:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Chen <zenghuchen@google.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jesus Sanchez-Palencia <jesussanp@google.com>,
	Mark Slevinsky <markslevinsky@google.com>,
	Jack Chen <zenghuchen@google.com>
Subject: Re: [PATCH] i3c: update dw-i3c-master i3c_clk_cfg function
Message-ID: <202302140331.EVRBei1L-lkp@intel.com>
References: <20230213142336.192875-1-zenghuchen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230213142336.192875-1-zenghuchen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_121737_682980_FE2E2705 
X-CRM114-Status: GOOD (  13.36  )
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

Hi Jack,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.2-rc8 next-20230213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jack-Chen/i3c-update-dw-i3c-master-i3c_clk_cfg-function/20230213-222533
patch link:    https://lore.kernel.org/r/20230213142336.192875-1-zenghuchen%40google.com
patch subject: [PATCH] i3c: update dw-i3c-master i3c_clk_cfg function
config: hexagon-randconfig-r041-20230213 (https://download.01.org/0day-ci/archive/20230214/202302140331.EVRBei1L-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e85b41ae5bb17077ac7d01bdd13c48ea1f83ea42
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jack-Chen/i3c-update-dw-i3c-master-i3c_clk_cfg-function/20230213-222533
        git checkout e85b41ae5bb17077ac7d01bdd13c48ea1f83ea42
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/i3c/master/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140331.EVRBei1L-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i3c/master/dw-i3c-master.c:13:
   In file included from include/linux/i3c/master.h:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/i3c/master/dw-i3c-master.c:13:
   In file included from include/linux/i3c/master.h:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/i3c/master/dw-i3c-master.c:13:
   In file included from include/linux/i3c/master.h:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/i3c/master/dw-i3c-master.c:544:9: warning: comparison of distinct pointer types ('typeof ((((200) + (core_period) - 1) / (core_period))) *' (aka 'unsigned long *') and 'typeof (lcnt) *' (aka 'unsigned char *')) [-Wcompare-distinct-pointer-types]
           lcnt = max(DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period), lcnt);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:74:19: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   7 warnings generated.


vim +544 drivers/i3c/master/dw-i3c-master.c

   517	
   518	static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
   519	{
   520		unsigned long core_rate, core_period;
   521		u32 scl_timing;
   522		u8 hcnt, lcnt;
   523	
   524		core_rate = clk_get_rate(master->core_clk);
   525		if (!core_rate)
   526			return -EINVAL;
   527	
   528		core_period = DIV_ROUND_UP(1000000000, core_rate);
   529	
   530		hcnt = DIV_ROUND_UP(I3C_BUS_THIGH_MAX_NS, core_period) - 1;
   531		if (hcnt < SCL_I3C_TIMING_CNT_MIN)
   532			hcnt = SCL_I3C_TIMING_CNT_MIN;
   533	
   534		lcnt = DIV_ROUND_UP(core_rate, master->base.bus.scl_rate.i3c) - hcnt;
   535		if (lcnt < SCL_I3C_TIMING_CNT_MIN)
   536			lcnt = SCL_I3C_TIMING_CNT_MIN;
   537	
   538		scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
   539		writel(scl_timing, master->regs + SCL_I3C_PP_TIMING);
   540	
   541		if (!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_I2C_SLAVE_PRESENT))
   542			writel(BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
   543	
 > 544		lcnt = max(DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period), lcnt);
   545		scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
   546		writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
   547	
   548		lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR1_SCL_RATE) - hcnt;
   549		scl_timing = SCL_EXT_LCNT_1(lcnt);
   550		lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR2_SCL_RATE) - hcnt;
   551		scl_timing |= SCL_EXT_LCNT_2(lcnt);
   552		lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR3_SCL_RATE) - hcnt;
   553		scl_timing |= SCL_EXT_LCNT_3(lcnt);
   554		lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_SDR4_SCL_RATE) - hcnt;
   555		scl_timing |= SCL_EXT_LCNT_4(lcnt);
   556		writel(scl_timing, master->regs + SCL_EXT_LCNT_TIMING);
   557	
   558		return 0;
   559	}
   560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
