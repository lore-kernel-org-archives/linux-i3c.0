Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F22AD3CC84
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 23:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/WAdODGfeuZY1KS9cn3AoB2i/N70Q7KPqZaLRJkzUg=; b=CbSrxvmtTdVrCB
	376RlR50lj74BMLkCgxAjaUbXj+jPB5LoghI1i9/7Rhees3YuVf24Fn6kULAkP8EPv1lPloa6j8V8
	j4hdiCOWBthakSk0DUCTQ42W9OVJtHFsYBt43I5mTb3FpUpCbmE561BaMOowjN8fLkiTUWZ6VtjKy
	tXnkWaCMp9tTScQAfybYVu/S5ysUPbhKHap0pZ12hQigdjYTIR0Wp07xK6SIy8yJpvJYgOXmji8aF
	9eeUM3OuSMSS+lKLALSUDJmRAzA21jxK7YCyfvuXPiD0t9BOFotamA4xRhnXlB/PjoqMlxsNqe1On
	HZ4mvfv5mFNpnwiROGbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgAbQ-0000000B8U0-3bBV;
	Wed, 14 Jan 2026 23:48:40 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgAbM-0000000B8TQ-2yMP
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 23:48:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768434516; x=1799970516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fpZXJ3A96OROTDJRswE/08njjePXZh4rpSkE8q4iKxk=;
  b=Stb8ea/bUfF3T3/0f+fTHUnqGM+yDZxX+d1QbqKiaDQh+hXCOg3qbLum
   Fhdetuk2hu9/6UEIJboBimT+xFrpyinPuEwEFmv/bxvrbQx9SSIY7yZBm
   eIaD8RJtiPxWUa4YNb3UqH7FtdE7rMOurkfRdJb8BWcbNG8SJJlfDT458
   8LCXNkYeKvKRK9tUYMZY5+A4kBdwBaAoe/cXRv/aclZMa41miwUhkjQ3B
   HaEjOXf8vBtMNmlsIRtyMG1hPb9zvZd5SsaThDTgJMsQOH7IYDkUa3sYU
   GiwRDr/ufUsBiJB14W/Ug1faUN4JmtAeAELZAqdYpcUUap4ES5KEopzco
   A==;
X-CSE-ConnectionGUID: iI0O5uedTb+HJ/hl8vSAMQ==
X-CSE-MsgGUID: PrYAX9C+RCqefEOvmTRIkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69718406"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="69718406"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 15:48:36 -0800
X-CSE-ConnectionGUID: UdvjGCikQzS8ThzmgRTS7g==
X-CSE-MsgGUID: /9XX4dGIS8mnyB/rVlwF4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="205226157"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jan 2026 15:48:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgAbF-00000000HDY-4A5R;
	Wed, 14 Jan 2026 23:48:29 +0000
Date: Thu, 15 Jan 2026 07:48:20 +0800
From: kernel test robot <lkp@intel.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH v4 5/5] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <202601150750.NiEqaaGg-lkp@intel.com>
References: <20260113114529.1692213-5-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260113114529.1692213-5-aman.kumarpandey@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_154838_574575_0334317B 
X-CRM114-Status: GOOD (  10.34  )
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260115/202601150750.NiEqaaGg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601150750.NiEqaaGg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601150750.NiEqaaGg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i3c/hub/p3h2840_i3c_hub_common.c:12:
   drivers/i3c/hub/p3h2840_i3c_hub_common.c: In function 'p3h2x4x_configure_pullup':
>> drivers/i3c/hub/p3h2840_i3c_hub.h:64:17: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      64 |                 FIELD_PREP(P3H2x4x_TP0145_PULLUP_CONF_MASK, x)
         |                 ^~~~~~~~~~
   drivers/i3c/hub/p3h2840_i3c_hub_common.c:51:18: note: in expansion of macro 'P3H2x4x_TP0145_PULLUP_CONF'
      51 |         pullup = P3H2x4x_TP0145_PULLUP_CONF(p3h2x4x_pullup_dt_to_reg
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/FIELD_PREP +64 drivers/i3c/hub/p3h2840_i3c_hub.h

    61	
    62	#define P3H2x4x_TP0145_PULLUP_CONF_MASK				GENMASK(7, 6)
    63	#define P3H2x4x_TP0145_PULLUP_CONF(x)	\
  > 64			FIELD_PREP(P3H2x4x_TP0145_PULLUP_CONF_MASK, x)
    65	#define P3H2x4x_TP2367_PULLUP_CONF_MASK				GENMASK(5, 4)
    66	#define P3H2x4x_TP2367_PULLUP_CONF(x)	\
    67			FIELD_PREP(P3H2x4x_TP2367_PULLUP_CONF_MASK, x)
    68	#define P3H2x4x_PULLUP_CONF_MASK					GENMASK(7, 4)
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
