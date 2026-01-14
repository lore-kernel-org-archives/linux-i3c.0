Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C3ED38FEF
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 16:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LskHdOdjyLIxOV0jCxlC1zdDyW8pkc135Jc3MzJSD7M=; b=Ei33e68g2smxzy
	Td+5K5zk0AY1ohAHagCSYqoHMRcKTyGsqHCxfYvoJywPpXym3/3JRhV/gs1/foAv+BxxgZy3/e/Io
	zZhk7mqPhSb00lgPMQHhhifXoO2mZAnLYwuxPKgruBaYmktwV/BP5klgdpK6DSMr0Wzn9Ryi3Uhh6
	GxglUN5PO2GvkrLYraBOba+e3nd8D1ce+e6tuR1t587O9FNqNCI1iRnIRyZ2EWAp/eBZ+4i+X3brv
	OK7V7OMDn6gK9nyIpx1NLuAl47jS6fYy+CsQtO6XZXx/swZs1b4UZaPlrIilXHOMKFhIoYjKS8pOb
	pMwvFIiF+tYq2MyZKvxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4DB-0000000A1NH-11YI;
	Wed, 14 Jan 2026 16:59:13 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4D8-0000000A1Lh-0Jsy
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 16:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768409950; x=1799945950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l/D1TjygnWEWBcgI5iokuhGrTQs0+FYsNCYqU6v2yGc=;
  b=T33q6XSUYkBoWeSNiiEjSOf3g1aTTsjqBye6C0o6SBPBf71YmdFLfkgr
   72zBylTOcL46OqbNmCh8K3kOxHA9EXQItxOIKG044uoXu/nDkO1vfp1Qz
   oAlAigKMa4eExy3ICn+m5WK0+d2+ruooRCCk2cNCa7b3YmdfvpEgN2V/q
   u6nheXKYCEaqthQmCmppTMXunYjWzfJEtmxHVpxfgsOczCdYUD7hyIdWg
   zbpol5I96ltf9TV5DMCtuKAy1gAtAy4CKVbF/+uc6uSGwy/OGiiwJxn/c
   2qitMdPb45v0555WxA4WB9JlcSwwP0buH60EROndDRVfBf5OpB7YO4VUK
   g==;
X-CSE-ConnectionGUID: 8SUDCQkcQBqeGqmYN1mtCA==
X-CSE-MsgGUID: S8L7k9EYSMKzm3BAdDqF2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69622276"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69622276"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 08:59:08 -0800
X-CSE-ConnectionGUID: hiJq6ta9SsmrXZbr06YeDA==
X-CSE-MsgGUID: lpm2i9eFSwqISEJpuvKHDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="204757271"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Jan 2026 08:59:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vg4Cy-00000000GhU-3jLB;
	Wed, 14 Jan 2026 16:59:00 +0000
Date: Thu, 15 Jan 2026 00:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	vikash.bansal@nxp.com, priyanka.jain@nxp.com,
	shashank.rebbapragada@nxp.com,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH v4 5/5] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <202601150056.yaKfBjXc-lkp@intel.com>
References: <20260113114529.1692213-5-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113114529.1692213-5-aman.kumarpandey@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_085910_723330_A56862F5 
X-CRM114-Status: GOOD (  10.50  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on i3c/i3c/next]
[also build test ERROR on lee-mfd/for-mfd-next lee-mfd/for-mfd-fixes broonie-regulator/for-next linus/master v6.19-rc5 next-20260114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/dt-bindings-i3c-Add-NXP-P3H2x4x-i3c-hub-support/20260113-195318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/20260113114529.1692213-5-aman.kumarpandey%40nxp.com
patch subject: [PATCH v4 5/5] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260115/202601150056.yaKfBjXc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150056.yaKfBjXc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150056.yaKfBjXc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i3c/hub/p3h2840_i3c_hub_common.c:51:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      51 |         pullup = P3H2x4x_TP0145_PULLUP_CONF(p3h2x4x_pullup_dt_to_reg
         |                  ^
   drivers/i3c/hub/p3h2840_i3c_hub.h:64:3: note: expanded from macro 'P3H2x4x_TP0145_PULLUP_CONF'
      64 |                 FIELD_PREP(P3H2x4x_TP0145_PULLUP_CONF_MASK, x)
         |                 ^
   drivers/i3c/hub/p3h2840_i3c_hub_common.c:80:16: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      80 |         io_strength = P3H2x4x_CP0_IO_STRENGTH(p3h2x4x_io_strength_dt_to_reg
         |                       ^
   drivers/i3c/hub/p3h2840_i3c_hub.h:51:3: note: expanded from macro 'P3H2x4x_CP0_IO_STRENGTH'
      51 |                 FIELD_PREP(P3H2x4x_CP0_IO_STRENGTH_MASK, x)
         |                 ^
   2 errors generated.


vim +/FIELD_PREP +51 drivers/i3c/hub/p3h2840_i3c_hub_common.c

    45	
    46	static int p3h2x4x_configure_pullup(struct device *dev)
    47	{
    48		struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(dev);
    49		u8 pullup;
    50	
  > 51		pullup = P3H2x4x_TP0145_PULLUP_CONF(p3h2x4x_pullup_dt_to_reg
    52							(p3h2x4x_i3c_hub->hub_config.tp0145_pullup));
    53	
    54		pullup |= P3H2x4x_TP2367_PULLUP_CONF(p3h2x4x_pullup_dt_to_reg
    55							(p3h2x4x_i3c_hub->hub_config.tp2367_pullup));
    56	
    57		return regmap_update_bits(p3h2x4x_i3c_hub->regmap, P3H2x4x_LDO_AND_PULLUP_CONF,
    58								  P3H2x4x_PULLUP_CONF_MASK, pullup);
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
