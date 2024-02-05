Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D216CC48295
	for <linux-i3c@archiver.kernel.org>; Mon,  5 Feb 2024 13:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q7gENoGCT8L8UIYr+0SeLlxZz6oux74EcOAPS0KKEyU=; b=JxGcyV+g5oe/tU
	6ZufJo1w7f7jApSs5I0ZwpZ0O/V7ghydQ56YEUYYrFUddl3XO+TQp+hdtwusa5MBJJLaZYA6Q8n+J
	STQ431ONnlAU6L4BhYZuXbP+U7weIXe78TsdBNOHG9cRfv9BMD9MU7IyreffExVngcDAdO2J9qixu
	P5YVv2xIB3ymW36tQgn3BOSCmAWvvzmS93vlv2scJatwgoYbpB2HRzOoeMKPsR98sK/I2VLEmcv2r
	pH+4CyFiNF+SGfQOX125BOqCH2byq3wjpXYG39J2TERya5n2DOPy+bBC21/P64wA0Owrer2fxu7T+
	yy2aCy1jbcvwrNwsjSsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWyp0-00000003NeN-0jfd;
	Mon, 05 Feb 2024 13:15:38 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWyow-00000003Nda-491z
	for linux-i3c@lists.infradead.org;
	Mon, 05 Feb 2024 13:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707138936; x=1738674936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jxi9hBIW/u/xN1/3l39jSDwYER6jWurCP3CAR9bpTUM=;
  b=ZrJNL145FxdWsNMp2URdyxSDB7/lw/8a60rxJFj1cP7dAT1bdSWKKy0H
   ibFv8FTi10Vhmq0t2JP2IEcJvQ9/EL8qE6D8OHa5Al8lGU/wrfX90+lkT
   C88AeQz+X1UMDAzGcZu7d3L3HEuvIKjbmGdYlWc8n3JLY4Y3ye5+TFZ/B
   zx0BsMD7sPIRzlwKNqdSJe2O8LoKOuIhy9lF1cVQYGkH2U8KTKGb+ZCZI
   N93DfOpW1Cx4ij23qgNDipk46yCJ0kBUMRHLqaY+0L00xsN3BCOFk3sAO
   Cp5BwTQiIeIrMtjIX3qDVUnxAlnUmjHU0t+2mbXm7Ybnuu5kW0eSVnfyT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11105845"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="11105845"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 05:15:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="1014816"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2024 05:15:29 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWyoo-0000Xk-32;
	Mon, 05 Feb 2024 13:15:26 +0000
Date: Mon, 5 Feb 2024 21:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com, devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org, ilpo.jarvinen@linux.intel.com,
	imx@lists.linux.dev, jirislaby@kernel.org, joe@perches.com,
	krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, miquel.raynal@bootlin.com,
	robh@kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v6 8/8] tty: i3c: add TTY over I3C master support
Message-ID: <202402052026.UNrmrB2M-lkp@intel.com>
References: <20240202230925.1000659-9-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240202230925.1000659-9-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_051535_182340_9CD741BC 
X-CRM114-Status: GOOD (  10.36  )
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

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus robh/for-next linus/master v6.8-rc3 next-20240205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/i3c-add-target-mode-support/20240203-071519
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20240202230925.1000659-9-Frank.Li%40nxp.com
patch subject: [PATCH v6 8/8] tty: i3c: add TTY over I3C master support
config: powerpc-randconfig-r071-20240205 (https://download.01.org/0day-ci/archive/20240205/202402052026.UNrmrB2M-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402052026.UNrmrB2M-lkp@intel.com/

smatch warnings:
drivers/tty/i3c_tty.c:237 tty_i3c_rxwork() error: uninitialized symbol 'status'.

vim +/status +237 drivers/tty/i3c_tty.c

   191	
   192	static void tty_i3c_rxwork(struct work_struct *work)
   193	{
   194		struct ttyi3c_port *sport = container_of(work, struct ttyi3c_port, rxwork);
   195		struct i3c_priv_xfer xfers;
   196		u32 retry = I3C_TTY_RETRY;
   197		u16 status;
   198		int ret;
   199	
   200		memset(&xfers, 0, sizeof(xfers));
   201		xfers.data.in = sport->rx_buff;
   202		xfers.len = I3C_TTY_TRANS_SIZE;
   203		xfers.rnw = 1;
   204	
   205		do {
   206			if (test_bit(I3C_TTY_RX_STOP, &sport->status))
   207				break;
   208	
   209			i3c_device_do_priv_xfers(sport->i3cdev, &xfers, 1);
   210	
   211			if (xfers.actual_len) {
   212				ret = tty_insert_flip_string(&sport->port, sport->rx_buff,
   213							     xfers.actual_len);
   214				if (ret < xfers.actual_len)
   215					sport->buf_overrun++;
   216	
   217				retry = I3C_TTY_RETRY;
   218				continue;
   219			}
   220	
   221			status = I3C_TTY_TARGET_RX_READY;
   222			i3c_device_getstatus_format1(sport->i3cdev, &status);
   223			/*
   224			 * Target side needs some time to fill data into fifo. Target side may not
   225			 * have hardware update status in real time. Software update status always
   226			 * needs some delays.
   227			 *
   228			 * Generally, target side have circular buffer in memory, it will be moved
   229			 * into FIFO by CPU or DMA. 'status' just show if circular buffer empty. But
   230			 * there are gap, especially CPU have not response irq to fill FIFO in time.
   231			 * So xfers.actual will be zero, wait for little time to avoid flood
   232			 * transfer in i3c bus.
   233			 */
   234			usleep_range(I3C_TTY_YIELD_US, 10 * I3C_TTY_YIELD_US);
   235			retry--;
   236	
 > 237		} while (retry && (status & I3C_TTY_TARGET_RX_READY));
   238	
   239		tty_flip_buffer_push(&sport->port);
   240	}
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
