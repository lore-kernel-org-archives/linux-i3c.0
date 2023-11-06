Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53881C4167D
	for <linux-i3c@archiver.kernel.org>; Mon,  6 Nov 2023 20:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jg8YFcOlRIkrXdSrz7cS50QPdeBtD8WeQaTJLXNdIrU=; b=t8rkGo16hzEe8U
	k+a+nZYLckPsAPa5zSLkO5j2OfaIaxoU+Rvb018bS5SGj5NesuqoZHbTlSaDcO/82Mzv3sahxHLZv
	C4gjt9P6GbBk8sjUt2oRvszUuR/Hnddt/OdlxHAz8novd3pE9ALu8uE0IKbKoR9Wv9xMYNKwyNODu
	XHl3vy1Xc/ptQrtPan0TNcXF7DvU+l/AqO83QmYo9Zqwe6bvJbhhsVV5TE/G3cX7sAa/VYHTyeuKt
	+cNChGbbENmIvvN8K05HbJkYYuw9zpYHvZYL0S2dZQZUQ7qSdjV3Mh7Orn/phhDS2VA/fPgFX9Y4E
	bIZhitHpXqhlGxQSpUNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r068s-00HUck-0v;
	Mon, 06 Nov 2023 20:24:14 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r068p-00HUc1-15
	for linux-i3c@lists.infradead.org;
	Mon, 06 Nov 2023 20:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699302251; x=1730838251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HUQJarH/crV1JopZJb9YSb1wHfMu7JhiXQvXe0faobI=;
  b=ZmA2lpqJz+OhGfhI1LzsPlepTr4WdpepwQS1bmqgOcA2Y4Pt+9VpR5sx
   3m67tp9Iv7RchHsqkkyCVB+YQ+xrhzgBUf4/HA0SFaCkw2i4C7ATq5Xke
   rym6I6QQXNrkCUNoPvMzjFWN1HSaubvhWib3mXdircGw15/G3CKgE9Yef
   S0WsCqw4EFnnRlkf4Hdhgj1plPg8BD48nblm2LIaHqv4bFC8H2UIuETTt
   OhLbszhCKE9W7WMgfHwGaiIzStOse9cNxh9y2NpvOyNkXKZSZDQpbsoIT
   7lZg4pj3xTjj4Wflq0U1fftg++aWaFlKFETSdhGbJMgBl4N9VRXUbd/w9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="453670648"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="453670648"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 12:24:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="797421965"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="797421965"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Nov 2023 12:24:06 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r068i-0006i4-0B;
	Mon, 06 Nov 2023 20:24:04 +0000
Date: Tue, 7 Nov 2023 04:22:44 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com, imx@lists.linux.dev, joe@perches.com,
	linux-i3c@lists.infradead.org, miquel.raynal@bootlin.com
Subject: Re: [PATCH 1/1] tty: i3c: add tty over i3c master support
Message-ID: <202311070330.5mylauLR-lkp@intel.com>
References: <20231018211111.3437929-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231018211111.3437929-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_122411_418322_FBBB683B 
X-CRM114-Status: GOOD (  15.92  )
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
[also build test ERROR on tty/tty-next tty/tty-linus linus/master v6.6 next-20231106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/tty-i3c-add-tty-over-i3c-master-support/20231019-051407
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231018211111.3437929-1-Frank.Li%40nxp.com
patch subject: [PATCH 1/1] tty: i3c: add tty over i3c master support
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20231107/202311070330.5mylauLR-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311070330.5mylauLR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311070330.5mylauLR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/i3c_tty.c: In function 'tty_i3c_rxwork':
>> drivers/tty/i3c_tty.c:265:26: error: 'struct i3c_priv_xfer' has no member named 'actual_len'
     265 |                 if (xfers.actual_len) {
         |                          ^
   drivers/tty/i3c_tty.c:266:82: error: 'struct i3c_priv_xfer' has no member named 'actual_len'
     266 |                         tty_insert_flip_string(&sport->port, sport->buffer, xfers.actual_len);
         |                                                                                  ^
>> drivers/tty/i3c_tty.c:271:25: error: implicit declaration of function 'i3c_device_getstatus_format1' [-Werror=implicit-function-declaration]
     271 |                         i3c_device_getstatus_format1(sport->i3cdev, &status);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/i3c_tty.c: At top level:
   drivers/tty/i3c_tty.c:400:6: warning: no previous prototype for 'i3c_remove' [-Wmissing-prototypes]
     400 | void i3c_remove(struct i3c_device *dev)
         |      ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +265 drivers/tty/i3c_tty.c

   246	
   247	static void tty_i3c_rxwork(struct work_struct *work)
   248	{
   249		struct ttyi3c_port *sport = container_of(work, struct ttyi3c_port, rxwork);
   250		struct i3c_priv_xfer xfers;
   251		int retry = I3C_TTY_RETRY;
   252		u16 status = BIT(0);
   253	
   254		do {
   255			memset(&xfers, 0, sizeof(xfers));
   256			xfers.data.in = sport->buffer;
   257			xfers.len = I3C_TTY_TRANS_SIZE;
   258			xfers.rnw = 1;
   259	
   260			if (I3C_TTY_RX_STOP & atomic_read(&sport->status))
   261				break;
   262	
   263			i3c_device_do_priv_xfers(sport->i3cdev, &xfers, 1);
   264	
 > 265			if (xfers.actual_len) {
   266				tty_insert_flip_string(&sport->port, sport->buffer, xfers.actual_len);
   267				retry = 20;
   268				continue;
   269			} else {
   270				status = BIT(0);
 > 271				i3c_device_getstatus_format1(sport->i3cdev, &status);
   272				/*
   273				 * Target side need some time to fill data into fifo. Target side may not
   274				 * have hardware update status in real time. Software update status always
   275				 * need some delays.
   276				 *
   277				 * Generally, target side have cicular buffer in memory, it will be moved
   278				 * into FIFO by CPU or DMA. 'status' just show if cicular buffer empty. But
   279				 * there are gap, espcially CPU have not response irq to fill FIFO in time.
   280				 * So xfers.actual will be zero, wait for little time to avoid flood
   281				 * transfer in i3c bus.
   282				 */
   283				usleep_range(I3C_TTY_YIELD_US, 10 * I3C_TTY_YIELD_US);
   284				retry--;
   285			}
   286	
   287		} while (retry && (status & BIT(0)));
   288	
   289		tty_flip_buffer_push(&sport->port);
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
