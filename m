Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D690C47077
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Jan 2024 13:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxZiTorNIzE3VJkBJz66vQ+L38uGaIjd0x/XLNU/8Y8=; b=H8Gp22FVouGAVY
	97GL5M+h/ePnp6A4Snu+cie3NxFL75e6yR5FLbvAnkL4aqRbFSsrViDlJHp/ukp8haI0o4pZFBUkn
	8q7rdHUIuUzGwiZy9gsc2sDYUzmN5IODI9y58k8GB0qsvW/oPNz9x/yfBdCOYh3e9yoixJfV3KGmO
	EOF0pQwMm9uX7cCaErXkk6XObTr+d232uTLc2piqhacLLBo4TeVkvyEB4y/EEWyQRoaRv2cmV4FtI
	k6LIfxVaI1TuWCczg/bRAzeS3scHOTt9NLoYmfVn2kMcsT2URFaiych9qqbUowycnWFcF2eIRLDSb
	O0sL6UMPNE1nXykLbGKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNvRw-000DXu-2g;
	Thu, 11 Jan 2024 13:50:24 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNvRu-000DXF-09
	for linux-i3c@lists.infradead.org;
	Thu, 11 Jan 2024 13:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704981022; x=1736517022;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=df3bhwFei4ovFhoesxHUexUNJ8++z5Jxwlx+x83xoIQ=;
  b=KdlzgewxvqcwmkXaGHQVrBG7ln8Tfpn5vNRXIX5G0gAx+lAwZU3IEVl3
   peCQnurYFbCC5nQKoFAY37tLqYMTcrlTCg0C354Ojwt63DMk7Pyr49bF2
   UdNkO3DzGX6WKvEkiIlA4MBoZZmmH1xkCpYDqXlYrlUonuBZ5R57TdEol
   cHgaS7pLA8oOWrcWQlW5Ak0pfKWkmT8iM8G4FaIuAIqr12a+QPDCxqygk
   +VfHHq08RV5srKeRFWOQFoTsUNr7tgNlssa+9Yl2mQIcJitit3CmxJDyb
   t64rVNHPRSbV7fhdpt089r9i735DYMKO12d9m9qeVYTtWWhuJ8dEhE5Jb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="5929645"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="5929645"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 05:50:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="926018931"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="926018931"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2024 05:50:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNvRh-0008Jd-2N;
	Thu, 11 Jan 2024 13:50:09 +0000
Date: Thu, 11 Jan 2024 21:49:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, robh@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
	gregkh@linuxfoundation.org, imx@lists.linux.dev,
	jirislaby@kernel.org, joe@perches.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, miquel.raynal@bootlin.com,
	zbigniew.lukwinski@linux.intel.com, devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v2 4/7] i3c: target: add svc target controller support
Message-ID: <202401112149.TbWJpRfM-lkp@intel.com>
References: <20240110175221.2335480-5-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240110175221.2335480-5-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_055022_154554_65E988F4 
X-CRM114-Status: GOOD (  16.92  )
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
[also build test WARNING on tty/tty-next tty/tty-linus robh/for-next linus/master v6.7 next-20240111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/i3c-add-target-mode-support/20240111-015711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20240110175221.2335480-5-Frank.Li%40nxp.com
patch subject: [PATCH v2 4/7] i3c: target: add svc target controller support
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240111/202401112149.TbWJpRfM-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401112149.TbWJpRfM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401112149.TbWJpRfM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i3c/target/svc-i3c-target.c:211:40: warning: no previous prototype for function 'svc_i3c_get_features' [-Wmissing-prototypes]
     211 | const struct i3c_target_ctrl_features *svc_i3c_get_features(struct i3c_target_ctrl *ctrl)
         |                                        ^
   drivers/i3c/target/svc-i3c-target.c:211:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
     211 | const struct i3c_target_ctrl_features *svc_i3c_get_features(struct i3c_target_ctrl *ctrl)
         |       ^
         | static 
>> drivers/i3c/target/svc-i3c-target.c:268:63: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
     268 | static int svc_i3c_target_queue(struct i3c_request *req, gfp_t)
         |                                                               ^
>> drivers/i3c/target/svc-i3c-target.c:666:5: warning: no previous prototype for function 'svc_i3c_fifo_status' [-Wmissing-prototypes]
     666 | int svc_i3c_fifo_status(struct i3c_target_ctrl *ctrl, bool tx)
         |     ^
   drivers/i3c/target/svc-i3c-target.c:666:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     666 | int svc_i3c_fifo_status(struct i3c_target_ctrl *ctrl, bool tx)
         | ^
         | static 
   3 warnings generated.


vim +/svc_i3c_get_features +211 drivers/i3c/target/svc-i3c-target.c

   210	
 > 211	const struct i3c_target_ctrl_features *svc_i3c_get_features(struct i3c_target_ctrl *ctrl)
   212	{
   213		struct svc_i3c_target *svc;
   214	
   215		svc = dev_get_drvdata(&ctrl->dev);
   216	
   217		if (!svc)
   218			return NULL;
   219	
   220		return &svc->features;
   221	}
   222	
   223	static void svc_i3c_queue_complete(struct svc_i3c_target *svc, struct i3c_request *complete)
   224	{
   225		unsigned long flags;
   226	
   227		spin_lock_irqsave(&svc->cq_lock, flags);
   228		list_add_tail(&complete->list, &svc->cq);
   229		spin_unlock_irqrestore(&svc->cq_lock, flags);
   230		queue_work(svc->workqueue, &svc->work);
   231	}
   232	
   233	static void svc_i3c_fill_txfifo(struct svc_i3c_target *svc)
   234	{
   235		struct i3c_request *req, *complete = NULL;
   236		unsigned long flags;
   237		int val;
   238	
   239		spin_lock_irqsave(&svc->txq_lock, flags);
   240		while ((!!(req = list_first_entry_or_null(&svc->txq, struct i3c_request, list))) &&
   241		       !((readl_relaxed(svc->regs + I3C_SDATACTRL) & I3C_SDATACTRL_TXFULL_MASK))) {
   242			while (!(readl_relaxed(svc->regs + I3C_SDATACTRL)
   243						& I3C_SDATACTRL_TXFULL_MASK)) {
   244				val = *(u8 *)(req->buf + req->actual);
   245	
   246				if (req->actual + 1 == req->length)
   247					writel_relaxed(val, svc->regs + I3C_SWDATAE);
   248				else
   249					writel_relaxed(val, svc->regs + I3C_SWDATAB);
   250	
   251				req->actual++;
   252	
   253				if (req->actual == req->length) {
   254					list_del(&req->list);
   255					complete = req;
   256					spin_unlock_irqrestore(&svc->txq_lock, flags);
   257	
   258					svc_i3c_queue_complete(svc, complete);
   259	
   260					spin_lock_irqsave(&svc->txq_lock, flags);
   261					break;
   262				}
   263			}
   264		}
   265		spin_unlock_irqrestore(&svc->txq_lock, flags);
   266	}
   267	
 > 268	static int svc_i3c_target_queue(struct i3c_request *req, gfp_t)
   269	{
   270		struct svc_i3c_target *svc;
   271		struct list_head *q;
   272		unsigned long flags;
   273		spinlock_t *lk;
   274	
   275		svc = dev_get_drvdata(&req->ctrl->dev);
   276		if (!svc)
   277			return -EINVAL;
   278	
   279		if (req->tx) {
   280			q = &svc->txq;
   281			lk = &svc->txq_lock;
   282		} else {
   283			q = &svc->rxq;
   284			lk = &svc->rxq_lock;
   285		}
   286	
   287		spin_lock_irqsave(lk, flags);
   288		list_add_tail(&req->list, q);
   289		spin_unlock_irqrestore(lk, flags);
   290	
   291		if (req->tx)
   292			svc_i3c_fill_txfifo(svc);
   293	
   294		if (req->tx)
   295			writel_relaxed(I3C_SINT_TXSEND, svc->regs + I3C_SINTSET);
   296		else
   297			writel_relaxed(I3C_SINT_RXPEND, svc->regs + I3C_SINTSET);
   298	
   299		return 0;
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
