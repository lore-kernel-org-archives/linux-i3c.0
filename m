Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EB4D12688
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 23:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VnTBF06cOLDyqXLLRxS15TfAZ97x5Uo9tueQFjhen+U=; b=L3qh5BAVMPsUI4
	QItB6gmeVTPcbhOSZQQWhMOQ90iSAXOz2J9k7PBPpEtpHcm83yz4uRGt2gGY2v+uThaI4SxqnPit7
	FXyAN+kN0MhYzK29DW8momdchkxgoMqdsNd/05csMdWUQ8WCR7fQg7fhScVwXfe2+MH7prrp6Xil/
	dU0zc6sSYP3o+WYdMAkeh2pOulZMqqntC6aOJBPCQwAq1e4wUeWyMewN1mMeCfpQTxW5boR6Qznxo
	eB7R8muo2PzGovdqeT9w7Tib84OAHL5IcxlmzHt3+/hCG3sXQwNNOrSmYCqL9NFRQO2/0FKghFZT0
	w8MFPHpqHf59R/za9JEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQa0R-00000005wWT-11rT;
	Tue, 02 Dec 2025 23:42:03 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQa0O-00000005wW7-2RpO
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 23:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764718920; x=1796254920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r0nkihzFxZI/i+s45y+M6yZMT2ED5o7DuIyKTn9go30=;
  b=YBrLll2ZFsuX0RNKmiTU/hud/8tM/sikNxj69gmej3lvhe3w6McyQWSm
   RRtSrXQFVgiCCWhTSS50q8/g48Tl0t+TJ7zHELWU3ULoBW15V/7qirXUl
   Cw8cPX5r4xWTrycLiLibxIDZ8i3X0yPlOoZy+gcYB/IXZei1F9T8KthoH
   Frgcr+qFjtFYO0cF+cCu+rcun3udmegh/2eA6hlUww/K1UIMOFbEBfFBX
   KDhrRqdtgwrmBOb7ZpEYQVBGWi1PerFjYgtRH6IkI0Bi2HTfN27mDaLua
   4qASs538k96pqSSTQKVng46vxXEJel7UjrsUho7yEQpyEI3c3DP3UTtl7
   g==;
X-CSE-ConnectionGUID: aGbzxAAnQg6yZixuW7ClFg==
X-CSE-MsgGUID: tExB8y9LR8yqJ6JT/K9Ypg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78049787"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="78049787"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 15:41:58 -0800
X-CSE-ConnectionGUID: W7mfCgFAQEKbgEIIPaesJA==
X-CSE-MsgGUID: nHr+0vDATTeKHv8cvZTbfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="198925877"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Dec 2025 15:41:56 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQa0I-00000000AJ3-03Hk;
	Tue, 02 Dec 2025 23:41:54 +0000
Date: Wed, 3 Dec 2025 07:41:18 +0800
From: kernel test robot <lkp@intel.com>
To: adrianhoyin.ng@altera.com, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	adrianhoyin.ng@altera.com
Subject: Re: [PATCH v5 4/5] i3c: dw: use FIELD_PREP for device address table
 macros
Message-ID: <202512030728.3yMG8FZJ-lkp@intel.com>
References: <4c4791c018d61beb9ff85ca68c5bf48940d2398e.1764663888.git.adrianhoyin.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c4791c018d61beb9ff85ca68c5bf48940d2398e.1764663888.git.adrianhoyin.ng@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_154200_663773_849846A3 
X-CRM114-Status: GOOD (  11.14  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on i3c/i3c/next]
[also build test ERROR on linus/master v6.18 next-20251202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/adrianhoyin-ng-altera-com/i3c-add-sysfs-entry-for-Device-NACK-Retry-count/20251202-163150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/4c4791c018d61beb9ff85ca68c5bf48940d2398e.1764663888.git.adrianhoyin.ng%40altera.com
patch subject: [PATCH v5 4/5] i3c: dw: use FIELD_PREP for device address table macros
config: i386-buildonly-randconfig-005-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030728.3yMG8FZJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030728.3yMG8FZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030728.3yMG8FZJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i3c/master/dw-i3c-master.c:862:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     862 |                 writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
         |                        ^
   drivers/i3c/master/dw-i3c-master.c:214:40: note: expanded from macro 'DEV_ADDR_TABLE_DYNAMIC_ADDR'
     214 | #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
         |                                        ^
   drivers/i3c/master/dw-i3c-master.c:1017:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1017 |         writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
         |                ^
   drivers/i3c/master/dw-i3c-master.c:214:40: note: expanded from macro 'DEV_ADDR_TABLE_DYNAMIC_ADDR'
     214 | #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
         |                                        ^
   drivers/i3c/master/dw-i3c-master.c:1046:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1046 |         writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr),
         |                ^
   drivers/i3c/master/dw-i3c-master.c:214:40: note: expanded from macro 'DEV_ADDR_TABLE_DYNAMIC_ADDR'
     214 | #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
         |                                        ^
   drivers/i3c/master/dw-i3c-master.c:1165:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1165 |                DEV_ADDR_TABLE_STATIC_ADDR(dev->addr),
         |                ^
   drivers/i3c/master/dw-i3c-master.c:215:39: note: expanded from macro 'DEV_ADDR_TABLE_STATIC_ADDR'
     215 | #define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
         |                                       ^
   drivers/i3c/master/dw-i3c-master.c:1719:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1719 |                                DEV_ADDR_TABLE_STATIC_ADDR(master->devs[pos].addr);
         |                                ^
   drivers/i3c/master/dw-i3c-master.c:215:39: note: expanded from macro 'DEV_ADDR_TABLE_STATIC_ADDR'
     215 | #define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
         |                                       ^
   5 errors generated.


vim +/FIELD_PREP +862 drivers/i3c/master/dw-i3c-master.c

1dd728f5d4d4b8 Vitor Soares 2018-11-13  826  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  827  static int dw_i3c_master_daa(struct i3c_master_controller *m)
1dd728f5d4d4b8 Vitor Soares 2018-11-13  828  {
1dd728f5d4d4b8 Vitor Soares 2018-11-13  829  	struct dw_i3c_master *master = to_dw_i3c_master(m);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  830  	struct dw_i3c_xfer *xfer;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  831  	struct dw_i3c_cmd *cmd;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  832  	u32 olddevs, newdevs;
e89cc14e96a99c Wolfram Sang 2025-01-07  833  	u8 last_addr = 0;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  834  	int ret, pos;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  835  
62fe9d06f5709c Aniket       2024-07-08  836  	ret = pm_runtime_resume_and_get(master->dev);
62fe9d06f5709c Aniket       2024-07-08  837  	if (ret < 0) {
62fe9d06f5709c Aniket       2024-07-08  838  		dev_err(master->dev,
62fe9d06f5709c Aniket       2024-07-08  839  			"<%s> cannot resume i3c bus master, err: %d\n",
62fe9d06f5709c Aniket       2024-07-08  840  			__func__, ret);
62fe9d06f5709c Aniket       2024-07-08  841  		return ret;
62fe9d06f5709c Aniket       2024-07-08  842  	}
62fe9d06f5709c Aniket       2024-07-08  843  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  844  	olddevs = ~(master->free_pos);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  845  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  846  	/* Prepare DAT before launching DAA. */
1dd728f5d4d4b8 Vitor Soares 2018-11-13  847  	for (pos = 0; pos < master->maxdevs; pos++) {
1dd728f5d4d4b8 Vitor Soares 2018-11-13  848  		if (olddevs & BIT(pos))
1dd728f5d4d4b8 Vitor Soares 2018-11-13  849  			continue;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  850  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  851  		ret = i3c_master_get_free_addr(m, last_addr + 1);
62fe9d06f5709c Aniket       2024-07-08  852  		if (ret < 0) {
62fe9d06f5709c Aniket       2024-07-08  853  			ret = -ENOSPC;
62fe9d06f5709c Aniket       2024-07-08  854  			goto rpm_out;
62fe9d06f5709c Aniket       2024-07-08  855  		}
1dd728f5d4d4b8 Vitor Soares 2018-11-13  856  
e2d43101f61d6e Jeremy Kerr  2023-03-30  857  		master->devs[pos].addr = ret;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  858  		last_addr = ret;
e89cc14e96a99c Wolfram Sang 2025-01-07  859  
e89cc14e96a99c Wolfram Sang 2025-01-07  860  		ret |= parity8(ret) ? 0 : BIT(7);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  861  
1dd728f5d4d4b8 Vitor Soares 2018-11-13 @862  		writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
1dd728f5d4d4b8 Vitor Soares 2018-11-13  863  		       master->regs +
1dd728f5d4d4b8 Vitor Soares 2018-11-13  864  		       DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
62fe9d06f5709c Aniket       2024-07-08  865  
62fe9d06f5709c Aniket       2024-07-08  866  		ret = 0;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  867  	}
1dd728f5d4d4b8 Vitor Soares 2018-11-13  868  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  869  	xfer = dw_i3c_master_alloc_xfer(master, 1);
62fe9d06f5709c Aniket       2024-07-08  870  	if (!xfer) {
62fe9d06f5709c Aniket       2024-07-08  871  		ret = -ENOMEM;
62fe9d06f5709c Aniket       2024-07-08  872  		goto rpm_out;
62fe9d06f5709c Aniket       2024-07-08  873  	}
1dd728f5d4d4b8 Vitor Soares 2018-11-13  874  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  875  	pos = dw_i3c_master_get_free_pos(master);
13462ba1815db5 Tom Rix      2022-01-08  876  	if (pos < 0) {
13462ba1815db5 Tom Rix      2022-01-08  877  		dw_i3c_master_free_xfer(xfer);
62fe9d06f5709c Aniket       2024-07-08  878  		ret = pos;
62fe9d06f5709c Aniket       2024-07-08  879  		goto rpm_out;
13462ba1815db5 Tom Rix      2022-01-08  880  	}
1dd728f5d4d4b8 Vitor Soares 2018-11-13  881  	cmd = &xfer->cmds[0];
1dd728f5d4d4b8 Vitor Soares 2018-11-13  882  	cmd->cmd_hi = 0x1;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  883  	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - pos) |
1dd728f5d4d4b8 Vitor Soares 2018-11-13  884  		      COMMAND_PORT_DEV_INDEX(pos) |
1dd728f5d4d4b8 Vitor Soares 2018-11-13  885  		      COMMAND_PORT_CMD(I3C_CCC_ENTDAA) |
1dd728f5d4d4b8 Vitor Soares 2018-11-13  886  		      COMMAND_PORT_ADDR_ASSGN_CMD |
1dd728f5d4d4b8 Vitor Soares 2018-11-13  887  		      COMMAND_PORT_TOC |
1dd728f5d4d4b8 Vitor Soares 2018-11-13  888  		      COMMAND_PORT_ROC;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  889  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  890  	dw_i3c_master_enqueue_xfer(master, xfer);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  891  	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
1dd728f5d4d4b8 Vitor Soares 2018-11-13  892  		dw_i3c_master_dequeue_xfer(master, xfer);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  893  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  894  	newdevs = GENMASK(master->maxdevs - cmd->rx_len - 1, 0);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  895  	newdevs &= ~olddevs;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  896  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  897  	for (pos = 0; pos < master->maxdevs; pos++) {
1dd728f5d4d4b8 Vitor Soares 2018-11-13  898  		if (newdevs & BIT(pos))
e2d43101f61d6e Jeremy Kerr  2023-03-30  899  			i3c_master_add_i3c_dev_locked(m, master->devs[pos].addr);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  900  	}
1dd728f5d4d4b8 Vitor Soares 2018-11-13  901  
1dd728f5d4d4b8 Vitor Soares 2018-11-13  902  	dw_i3c_master_free_xfer(xfer);
1dd728f5d4d4b8 Vitor Soares 2018-11-13  903  
62fe9d06f5709c Aniket       2024-07-08  904  rpm_out:
62fe9d06f5709c Aniket       2024-07-08  905  	pm_runtime_put_autosuspend(master->dev);
62fe9d06f5709c Aniket       2024-07-08  906  	return ret;
1dd728f5d4d4b8 Vitor Soares 2018-11-13  907  }
1dd728f5d4d4b8 Vitor Soares 2018-11-13  908  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
