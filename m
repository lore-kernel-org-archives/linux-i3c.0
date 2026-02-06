Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB880EE6B60
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Feb 2026 21:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fR7CgOOowX139QNnBFBzxvRE+k+cnWz/V5y9TVAYoeg=; b=PveofKRq7MOi+/
	4azcZwrF5hxlvnau7NoNh0q9YBa8MvBRgByo+Zlm3rOT0IACfejbcV46EboLlIm79QC7TKr6z0tsP
	6N+W/mTYmRhEi9eGw/6EuWiJpAGSJcfkHZus6FZvKFsXkh8n5kEMkUh35+Yb42JtN3mfJr3d9RVcc
	ZcDCEyKbSFC45xj1dw69zesuP+K1KqxvX0JFd9TzCGytZtLKtBfNGZ0d2eUdNSjJ/I0z6hBZ2adi7
	kJYHD44IqK6TdFbrGtxacZT0fRaAjDIgMphBPoWMK8RMji8Nz+Axekgo+GDvFh5AMIA3tZ2761T2O
	x1dXVNRLQYRr6ikZqyIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voTLP-0000000BqPp-40Vr;
	Fri, 06 Feb 2026 21:26:27 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voTLN-0000000BqP4-2ley
	for linux-i3c@lists.infradead.org;
	Fri, 06 Feb 2026 21:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770413185; x=1801949185;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2T07od/0Y6hzmkDiX1RLD/SCXRXmrAUlAOAgu0nEST4=;
  b=H58OKx5w4uB8W02MWFQwDT3Bc7a8YlmF+VMwzTeBZrFxEFY44QH2s3dU
   KLGMlsUw+TZ4dph7XLmzy4VrgsRGKC1Hsz9h10Tar0XivuefINf/IqulN
   04ELl9fqE4ImQ5kZkx6ES0M1Yfl+d0ttICTtqHV81QfDMQJa60eu0bdwg
   JKumTDJQbJHGY1zpS4hCNqlGbmNuxZ4q3QFXm0epE4Jy+qcDe3xCOpIUM
   1HfSEvgGH8mmvCeAQQ4F6x3MGTfPC9ACoV3o0eXTnmAZOJdaI/i2LVqYd
   f0lJEw4gxaZL7gwGPo/WNjFmDGOQlqmEsV8ddvzWtYTG2cSTl5Wm3euV+
   g==;
X-CSE-ConnectionGUID: v4ojwK/xTQ+3qwyOGW6RYg==
X-CSE-MsgGUID: 601rkqd9T+GQz35fy7OWhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71690742"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71690742"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 13:26:21 -0800
X-CSE-ConnectionGUID: IvDzmKR4Rx2FZA72u2qnFA==
X-CSE-MsgGUID: q0BiZXafSBiwMCI4inN3xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="215470966"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Feb 2026 13:26:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voTLE-00000000lAi-03Ux;
	Fri, 06 Feb 2026 21:26:16 +0000
Date: Sat, 7 Feb 2026 05:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH v5 5/5] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <202602070522.fcoiqtPw-lkp@intel.com>
References: <20260206120121.856471-5-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206120121.856471-5-aman.kumarpandey@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_132625_750719_E41B0666 
X-CRM114-Status: GOOD (  10.97  )
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

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes broonie-regulator/for-next linus/master v6.19-rc8]
[cannot apply to i3c/i3c/next next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/dt-bindings-i3c-Add-NXP-P3H2x4x-i3c-hub-support/20260206-200552
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20260206120121.856471-5-aman.kumarpandey%40nxp.com
patch subject: [PATCH v5 5/5] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality
config: m68k-randconfig-r054-20260207 (https://download.01.org/0day-ci/archive/20260207/202602070522.fcoiqtPw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070522.fcoiqtPw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070522.fcoiqtPw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i3c/hub/p3h2840_i3c_hub_smbus.c: In function 'p3h2x4x_ibi_handler':
>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:87:11: warning: unused variable 'i' [-Wunused-variable]
     u32 ret, i;
              ^
>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:87:6: warning: unused variable 'ret' [-Wunused-variable]
     u32 ret, i;
         ^~~
>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:86:44: warning: variable 'payload_byte_two' set but not used [-Wunused-but-set-variable]
     u32 target_port_status, payload_byte_one, payload_byte_two;
                                               ^~~~~~~~~~~~~~~~
>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:86:6: warning: unused variable 'target_port_status' [-Wunused-variable]
     u32 target_port_status, payload_byte_one, payload_byte_two;
         ^~~~~~~~~~~~~~~~~~
>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:85:30: warning: unused variable 'p3h2x4x_i3c_hub' [-Wunused-variable]
     struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(&i3cdev->dev);
                                 ^~~~~~~~~~~~~~~


vim +/i +87 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c

    75	
    76	/**
    77	 * p3h2x4x_ibi_handler - IBI handler.
    78	 * @i3cdev: i3c device.
    79	 * @payload: two byte IBI payload data.
    80	 *
    81	 */
    82	void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
    83				 const struct i3c_ibi_payload *payload)
    84	{
  > 85		struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(&i3cdev->dev);
  > 86		u32 target_port_status, payload_byte_one, payload_byte_two;
  > 87		u32 ret, i;
    88	
    89		payload_byte_one = (*(int *)payload->data);
    90		payload_byte_two = (*(int *)(payload->data + 4));
    91	
    92		if (!(payload_byte_one & P3H2x4x_SMBUS_AGENT_EVENT_FLAG_STATUS))
    93			return;
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
