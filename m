Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBFCC0219D
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Feb 2025 11:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/XITWgwWAYAtx+FW+Iq192L2RWLkyOOCZu5V9GBPiw=; b=BF0yIw8HMHd0QS
	KJ3rRRHd1Smh48w3G9VvkbQFHl+2X+pxNGnHKMSoHXZx8RHig8GNeeUruC/z0PIeO9eCB3P9gyHv3
	3LGvHlbyS+nv0D48yPQFqmPp44rCk8MpPQi1kN2aj8n42CZJmpqvP5x8Tu01u8jzl4OAjKsnVkGdI
	rHdaFBCGXIjfWKI/dWQ+YYZNfrFuwKAvtwAAuPZn4d6L6uqQGDRJRBLVyUBxQxAWtMT23KfZMtmcr
	YcyPq5XM7khiQuJZvwBtu4AstUBHfqtBVohDBzd4310sCyYme4adje/2n5qgkXagl8k12qfrzujCE
	jJ84Pz5lKleU1MmmIF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXji-0000000AutS-37BI;
	Thu, 13 Feb 2025 11:50:30 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXjg-0000000Ausj-0FPi
	for linux-i3c@lists.infradead.org;
	Thu, 13 Feb 2025 11:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739447428; x=1770983428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s7y+vsG1sqQYMMb3Rkr13a4BlT3RJ2jFTe/m5yWCJJQ=;
  b=JtnXb2CV5ADlXuoN/UGNpn1f32Pv4TzKANNVmrZ1XMKYE2AG/Cp8bgkQ
   8D94atw+EFZkssHDy9NBMvSR+az+LOSk2tB/gq7kTCzPAP6gZGM5Wkg2n
   bSjHiyIQVebYfKm8O621jGTfYD8ClQnqTjRLjuKSoEjKyjj0zfiJb0yLv
   ZrBCFQO8nx/mg6FJUyVntcM6KuQv/X0umKGVv0uJa3AmmOy3Kd2BW2jmV
   ueRpg7hnuXc2x4AXK4hVunF/9gb3EnHkUTFkU0k6wOQzfnJ/+z/2359jf
   Sr+zOrxmy7Z9YX4FmjJqkrcqWh+CkYTj1lobS7382ArHikgGe8OuRw9SW
   Q==;
X-CSE-ConnectionGUID: ZCWXclsORLGx82GRnaUVOw==
X-CSE-MsgGUID: vQ/RiqfITE+qj0AajePMYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65497241"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="65497241"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 03:50:27 -0800
X-CSE-ConnectionGUID: Lwl8CKFPTzC6uqNi0kIL2g==
X-CSE-MsgGUID: UZfww+L/QsCVplzJI2MNzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144067437"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Feb 2025 03:50:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiXja-0016zn-06;
	Thu, 13 Feb 2025 11:50:22 +0000
Date: Thu, 13 Feb 2025 19:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com, Frank.Li@nxp.com,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-hub
 device
Message-ID: <202502131947.VmPYnXuz-lkp@intel.com>
References: <20250212132227.1348374-2-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250212132227.1348374-2-aman.kumarpandey@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_035028_142826_4EF1C590 
X-CRM114-Status: GOOD (  15.41  )
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

Hi Aman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.14-rc2 next-20250213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/drivers-i3c-Add-driver-for-NXP-P3H2x4x-i3c-hub-device/20250212-213659
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250212132227.1348374-2-aman.kumarpandey%40nxp.com
patch subject: [PATCH 2/2] drivers: i3c: Add driver for NXP P3H2x4x i3c-hub device
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250213/202502131947.VmPYnXuz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131947.VmPYnXuz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131947.VmPYnXuz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:6:
   In file included from drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub.h:12:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:52:7: warning: variable 'flag_clear' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
      52 |                 if (ret)
         |                     ^~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:80:62: note: uninitialized use occurs here
      80 |         regmap_write(priv->regmap, P3H2x4x_TP0_SMBUS_AGNT_STS + tp, flag_clear);
         |                                                                     ^~~~~~~~~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:52:3: note: remove the 'if' if its condition is always false
      52 |                 if (ret)
         |                 ^~~~~~~~
      53 |                         goto ibi_err;
         |                         ~~~~~~~~~~~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:45:6: warning: variable 'flag_clear' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
      45 |         if (ret)
         |             ^~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:80:62: note: uninitialized use occurs here
      80 |         regmap_write(priv->regmap, P3H2x4x_TP0_SMBUS_AGNT_STS + tp, flag_clear);
         |                                                                     ^~~~~~~~~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:45:2: note: remove the 'if' if its condition is always false
      45 |         if (ret)
         |         ^~~~~~~~
      46 |                 goto ibi_err;
         |                 ~~~~~~~~~~~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:32:6: warning: variable 'flag_clear' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
      32 |         if (ret)
         |             ^~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:80:62: note: uninitialized use occurs here
      80 |         regmap_write(priv->regmap, P3H2x4x_TP0_SMBUS_AGNT_STS + tp, flag_clear);
         |                                                                     ^~~~~~~~~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:32:2: note: remove the 'if' if its condition is always false
      32 |         if (ret)
         |         ^~~~~~~~
      33 |                 goto ibi_err;
         |                 ~~~~~~~~~~~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:27:6: warning: variable 'flag_clear' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
      27 |         if (ret)
         |             ^~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:80:62: note: uninitialized use occurs here
      80 |         regmap_write(priv->regmap, P3H2x4x_TP0_SMBUS_AGNT_STS + tp, flag_clear);
         |                                                                     ^~~~~~~~~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:27:2: note: remove the 'if' if its condition is always false
      27 |         if (ret)
         |         ^~~~~~~~
      28 |                 goto ibi_err;
         |                 ~~~~~~~~~~~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:20:35: note: initialize the variable 'flag_clear' to silence this warning
      20 |         u8 target_buffer_page, flag_clear, rx_data, temp, i;
         |                                          ^
         |                                           = '\0'
>> drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:453:2: warning: variable 'write_length' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     453 |         default:
         |         ^~~~~~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:460:12: note: uninitialized use occurs here
     460 |         desc[2] = write_length;
         |                   ^~~~~~~~~~~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:372:30: note: initialize the variable 'write_length' to silence this warning
     372 |         u8 read_length, write_length;
         |                                     ^
         |                                      = '\0'
>> drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:453:2: warning: variable 'read_length' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     453 |         default:
         |         ^~~~~~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:461:12: note: uninitialized use occurs here
     461 |         desc[3] = read_length;
         |                   ^~~~~~~~~~~
   drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c:372:16: note: initialize the variable 'read_length' to silence this warning
     372 |         u8 read_length, write_length;
         |                       ^
         |                        = '\0'
   9 warnings generated.


vim +52 drivers/i3c/p3h2x4x/p3h2x4x_i3c_hub_smbus.c

    12	
    13	static void p3h2x4x_read_smbus_agent_rx_buf(struct i3c_device *i3cdev, enum p3h2x4x_rcv_buf rfbuf,
    14									enum p3h2x4x_tp tp, bool is_of)
    15	{
    16		struct device *dev = i3cdev_to_dev(i3cdev);
    17		struct p3h2x4x *priv = dev_get_drvdata(dev);
    18		struct smbus_device *backend = NULL;
    19	
    20		u8 target_buffer_page, flag_clear, rx_data, temp, i;
    21		u8 slave_rx_buffer[P3H2x4x_SMBUS_TARGET_PAYLOAD_SIZE] = { 0 };
    22		u32 packet_len, slave_address, ret;
    23	
    24		target_buffer_page = (((rfbuf) ? P3H2x4x_TARGET_BUFF_1_PAGE : P3H2x4x_TARGET_BUFF_0_PAGE)
    25								+  (P3H2x4x_NO_PAGE_PER_TP * tp));
    26		ret = regmap_write(priv->regmap, P3H2x4x_PAGE_PTR, target_buffer_page);
    27		if (ret)
    28			goto ibi_err;
    29	
    30		/* read buffer length */
    31		ret = regmap_read(priv->regmap, P3H2x4x_TARGET_BUFF_LENGTH, &packet_len);
    32		if (ret)
    33			goto ibi_err;
    34	
    35		if (packet_len)
    36			packet_len = packet_len - 1;
    37	
    38		if (packet_len > P3H2x4x_SMBUS_TARGET_PAYLOAD_SIZE) {
    39			dev_err(dev, "Received message too big for p3h2x4x buffer\n");
    40			return;
    41		}
    42	
    43		/* read slave  address */
    44		ret = regmap_read(priv->regmap, P3H2x4x_TARGET_BUFF_ADDRESS, &slave_address);
    45		if (ret)
    46			goto ibi_err;
    47	
    48		/* read data */
    49		if (packet_len) {
    50			ret = regmap_bulk_read(priv->regmap, P3H2x4x_TARGET_BUFF_DATA,
    51					slave_rx_buffer, packet_len);
  > 52			if (ret)
    53				goto ibi_err;
    54		}
    55	
    56		if (is_of)
    57			flag_clear = BUF_RECEIVED_FLAG_TF_MASK;
    58		else
    59			flag_clear = (((rfbuf == RCV_BUF_0) ? P3H2x4x_TARGET_BUF_0_RECEIVE :
    60						P3H2x4x_TARGET_BUF_1_RECEIVE));
    61	
    62		/* notify slave driver about received data */
    63		list_for_each_entry(backend, &priv->tp_bus[tp].tp_device_entry, list) {
    64			if ((slave_address >> 1 == backend->addr) && (priv->is_slave_reg)) {
    65				i2c_slave_event(backend->client, I2C_SLAVE_WRITE_REQUESTED,
    66					(u8 *)&slave_address);
    67	
    68				for (i = 0; i < packet_len; i++) {
    69					rx_data = slave_rx_buffer[i];
    70					i2c_slave_event(backend->client, I2C_SLAVE_WRITE_RECEIVED,
    71							&rx_data);
    72				}
    73				i2c_slave_event(backend->client, I2C_SLAVE_STOP, &temp);
    74				break;
    75			}
    76		}
    77	
    78	ibi_err:
    79		regmap_write(priv->regmap, P3H2x4x_PAGE_PTR, 0x00);
    80		regmap_write(priv->regmap, P3H2x4x_TP0_SMBUS_AGNT_STS + tp, flag_clear);
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
