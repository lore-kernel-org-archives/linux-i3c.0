Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50726FD88C3
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 22:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NG3X6HDnYt4K4uAMua4uNY1Qp3wfBtRtVGVVJigEnGU=; b=SCGZDatukZQt/C
	hWkDcHt5HxtJYTmnViyrU/n/UxX76IflUTBIxpJ4MFBgvrpIid9jJecY5xBOUhrlahO32XI4K3q13
	T1MUY5xWcbP8IapOh9k079imh1y7ItSyH7wzXGS4HAT0FhPoUyUlaDWzE3gcov5StVeogRkceT1XT
	/dz1/hfKI+4e/TSNL0VzTxuKXgPSQ0evZiTfMHvlNznJU7D4L/k7vDX86DS09o0cCUYfn4AUQN1bU
	VNbY00OvRmMfm82ow4W4IJNXwNE+0VR3ax9LODXjDsrnd6th+8qKt0R44x3ZQ1N4U82YQuJmJLy/6
	FrUZz+wc6fRZjs55ylaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w05Ho-0000000AKVK-3YJt;
	Tue, 10 Mar 2026 22:10:44 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w05Hi-0000000AKUC-3BJW
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 22:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773180638; x=1804716638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JTxrzO1LrN7eC45YxKGqwh5TfMlDV1uFYWdx36DoldY=;
  b=YBPGlOfcyy0pf9+DWMzm9ONQfHJyi5kxpGX32nUfA8auifRt00QRWEEK
   2AVLV0sWTZg1mRZBhI0b8yR7LRyNqjt0BXRbrlM4ehZ0gltI11Go2RX2K
   NJBvJaw5LYs48HcOvGSL2q07E3K4VRPT+4s/VgLX/VST1uNerO6MLLgRu
   IOTwn5n8p+p/eGSkkSyWWFahGcUzLjApFHAvtKRYRNrbUtLuPBGUzgA11
   zZbmWp7VRUEwMFOeCF+cwxjA1un9DNeHvD8dBWhFf27TKOxIDY7Tto3i3
   RMScu8KaRrhuLx8MMa3Dty124N0r7gxu29o/94yuFqtSP09/CDZNkPpo8
   Q==;
X-CSE-ConnectionGUID: 6xJ45tdaT8i97vmK0oARdg==
X-CSE-MsgGUID: lHjdjCamSgOZTF7Zu6JcIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="76851109"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="76851109"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 15:10:36 -0700
X-CSE-ConnectionGUID: KXOR9kTgTwa6c5Saw/Zndw==
X-CSE-MsgGUID: m6pqQK2fSMiKVyG+HCZfLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="222823144"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Mar 2026 15:10:32 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w05Ha-000000000Mc-1Awe;
	Tue, 10 Mar 2026 22:10:30 +0000
Date: Wed, 11 Mar 2026 06:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>, linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com,
	lakshay.piplani@nxp.com
Subject: Re: [PATCH v6 7/7] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <202603110643.VWCcqjaP-lkp@intel.com>
References: <20260310065727.3759342-7-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310065727.3759342-7-lakshay.piplani@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_151038_813942_C1046BEB 
X-CRM114-Status: GOOD (  13.13  )
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

Hi Lakshay,

kernel test robot noticed the following build errors:

[auto build test ERROR on i3c/i3c/next]
[also build test ERROR on lee-mfd/for-mfd-next broonie-regulator/for-next linus/master v7.0-rc3 next-20260310]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lakshay-Piplani/i3c-master-Add-the-APIs-to-support-I3C-hub/20260310-150040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/20260310065727.3759342-7-lakshay.piplani%40nxp.com
patch subject: [PATCH v6 7/7] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality
config: riscv-randconfig-001-20260311 (https://download.01.org/0day-ci/archive/20260311/202603110643.VWCcqjaP-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110643.VWCcqjaP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110643.VWCcqjaP-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i3c/hub/p3h2840_i3c_hub_smbus.c: In function 'p3h2x4x_tp_i2c_xfer_msg':
>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:263:2: error: a label can only be part of a statement and a declaration is not a statement
     int ret2;
     ^~~


vim +263 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c

   176	
   177	/**
   178	 * p3h2x4x_tp_i2c_xfer_msg() - This starts a SMBus write transaction by writing a descriptor
   179	 * and a message to the p3h2x4x registers. Controller buffer page is determined by multiplying the
   180	 * target port index by four and adding the base page number to it.
   181	 */
   182	static int p3h2x4x_tp_i2c_xfer_msg(struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub,
   183					   struct i2c_msg *xfers,
   184					   u8 target_port,
   185					   u8 nxfers_i, u8 rw)
   186	{
   187		u8 controller_buffer_page = P3H2x4x_CONTROLLER_BUFFER_PAGE + 4 * target_port;
   188		u8 target_port_status = P3H2x4x_TP0_SMBUS_AGNT_STS + target_port;
   189		u8 desc[P3H2x4x_SMBUS_DESCRIPTOR_SIZE] = { 0 };
   190		u8 transaction_type = P3H2x4x_SMBUS_400kHz;
   191		int write_length, read_length;
   192		u8 addr = xfers[nxfers_i].addr;
   193		u8 rw_address = 2 * addr;
   194		int ret;
   195	
   196		if (rw == 2) { /* write and read */
   197			write_length = xfers[nxfers_i].len;
   198			read_length =  xfers[nxfers_i + 1].len;
   199		} else if (rw == 1) {
   200			rw_address |= P3H2x4x_SET_BIT(0);
   201			write_length = 0;
   202			read_length =  xfers[nxfers_i].len;
   203		} else {
   204			write_length = xfers[nxfers_i].len;
   205			read_length = 0;
   206		}
   207	
   208		desc[0] = rw_address;
   209		if (rw == 2)
   210			desc[1] = transaction_type | P3H2x4x_SET_BIT(0);
   211		else
   212			desc[1] = transaction_type;
   213		desc[2] = write_length;
   214		desc[3] = read_length;
   215	
   216		ret = regmap_write(p3h2x4x_i3c_hub->regmap, target_port_status,
   217				   P3H2x4x_TP_BUFFER_STATUS_MASK);
   218		if (ret)
   219			goto out;
   220	
   221		ret = regmap_write(p3h2x4x_i3c_hub->regmap, P3H2x4x_PAGE_PTR, controller_buffer_page);
   222	
   223		if (ret)
   224			goto out;
   225	
   226		ret = regmap_bulk_write(p3h2x4x_i3c_hub->regmap, P3H2x4x_CONTROLLER_AGENT_BUFF,
   227					desc, P3H2x4x_SMBUS_DESCRIPTOR_SIZE);
   228	
   229		if (ret)
   230			goto out;
   231	
   232		if (!(rw % 2)) {
   233			ret = regmap_bulk_write(p3h2x4x_i3c_hub->regmap,
   234						P3H2x4x_CONTROLLER_AGENT_BUFF_DATA,
   235						xfers[nxfers_i].buf, xfers[nxfers_i].len);
   236			if (ret)
   237				goto out;
   238		}
   239	
   240		ret = regmap_write(p3h2x4x_i3c_hub->regmap, P3H2x4x_TP_SMBUS_AGNT_TRANS_START,
   241				   p3h2x4x_i3c_hub->tp_bus[target_port].tp_mask);
   242	
   243		if (ret)
   244			goto out;
   245	
   246		ret = p3h2x4x_read_smbus_transaction_status(p3h2x4x_i3c_hub,
   247							    target_port_status,
   248							    (write_length + read_length));
   249		if (ret)
   250			goto out;
   251	
   252		if (rw) {
   253			if (rw == 2)
   254				nxfers_i += 1;
   255	
   256			ret = regmap_bulk_read(p3h2x4x_i3c_hub->regmap,
   257					       P3H2x4x_CONTROLLER_AGENT_BUFF_DATA + write_length,
   258					       xfers[nxfers_i].buf, xfers[nxfers_i].len);
   259			if (ret)
   260				goto out;
   261		}
   262	out:
 > 263		int ret2;
   264	
   265		ret2 = regmap_write(p3h2x4x_i3c_hub->regmap,
   266				    P3H2x4x_PAGE_PTR, 0x00);
   267		if (!ret && ret2)
   268			ret = ret2;
   269	
   270		return ret;
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
