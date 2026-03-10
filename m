Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAC7FD88CE
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 23:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rq9K8kIQd9v1JLyUnbbRu8v7rkwsy7VpAhWPhLaqn44=; b=iNet7Rn0LAhxs+
	OkaB/sc9IC7KftYcdgFPjBQEECqWDaAL0/89hqZV9oPP3NTiux1mJLR0+bMwEh8MdHJxDHjO8OM13
	1OIiacZ42/AuA+ndZfNmAGV3CPeRiCJyyEjZE1cecsKyPyxkU6S0i5tn+2Afd7IYDQCv7jEl2MtwZ
	GoR7+OjgpyTRCa9LmGpGEGyjzwgF8ZMczr0M6AB4+cgzPq5Rb7EKY/AqJN0LGAj2iPYSb845T4TG+
	Pn5IWb7vmXpiBfesmEtJjRq1zNMArKB6mU1bypPos9gQ0950snjYPuFVuKWIKHmLYP/8/K1JsQ7Eb
	M+t/V+zWwcz1qTx8XPOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w06TS-0000000ANon-24fY;
	Tue, 10 Mar 2026 23:26:50 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w06TO-0000000ANnr-3afL
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 23:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773185206; x=1804721206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e479cCwfOF7vRTYlVkMohlsKN6yVc0hD7vBF60a45fo=;
  b=Nsilcs0Hkan7p7NxiGfb3pXS88v5pEOlPf0Bp3Db6UgxX4BRuucXzr6o
   h8sri41Tk2BG7ePMp4ltoDnIQAyLOWVvvFWk0NiLHR0km8yjGLMeej9lI
   c91cCOvPFO1r05a5fOaCskL8ZFhHA1urmj2hSRW9UUX4PUBdro+lNWqrs
   B4TviI/783BIUGGrupUwMJKBwPKXwYgxAJ7c5NVxb8686IwdE2S8vAmcQ
   5m3541iqCKFohU88k57W5hb9VbNbtFrKkLhZhWrwySX8ixrW10KiJguMj
   WqO/mvE/XwsSw6p7x+A1yVShu6CrGXL/vu9JxOEqN/mJwcd9JOU/tyxY8
   w==;
X-CSE-ConnectionGUID: 4WbOQMDgSiKO24iO772WKw==
X-CSE-MsgGUID: g8ahj7JaTfK1Oj4YXpYFsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="73443087"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="73443087"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 16:26:42 -0700
X-CSE-ConnectionGUID: I1yiwG8kR3OQNfM3PvA6cA==
X-CSE-MsgGUID: yXIbYWUTQ0uhucbUBDMF2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="225235382"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Mar 2026 16:26:38 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w06TD-000000000P4-0miZ;
	Tue, 10 Mar 2026 23:26:35 +0000
Date: Wed, 11 Mar 2026 07:26:27 +0800
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
Message-ID: <202603110741.nkI3lGfN-lkp@intel.com>
References: <20260310065727.3759342-7-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310065727.3759342-7-lakshay.piplani@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_162646_911428_915D83C7 
X-CRM114-Status: GOOD (  10.85  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on i3c/i3c/next]
[also build test WARNING on lee-mfd/for-mfd-next broonie-regulator/for-next linus/master v7.0-rc3 next-20260310]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lakshay-Piplani/i3c-master-Add-the-APIs-to-support-I3C-hub/20260310-150040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/20260310065727.3759342-7-lakshay.piplani%40nxp.com
patch subject: [PATCH v6 7/7] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260311/202603110741.nkI3lGfN-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110741.nkI3lGfN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110741.nkI3lGfN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/i3c/hub/p3h2840_i3c_hub_i3c.c:62 function parameter 'p3h2x4x_hub' not described in 'p3h2x4x_tp_i3c_algo'
>> Warning: drivers/i3c/hub/p3h2840_i3c_hub_i3c.c:62 function parameter 'p3h2x4x_hub' not described in 'p3h2x4x_tp_i3c_algo'
--
>> Warning: drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:185 function parameter 'p3h2x4x_i3c_hub' not described in 'p3h2x4x_tp_i2c_xfer_msg'
>> Warning: drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:185 function parameter 'xfers' not described in 'p3h2x4x_tp_i2c_xfer_msg'
>> Warning: drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:185 function parameter 'target_port' not described in 'p3h2x4x_tp_i2c_xfer_msg'
>> Warning: drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:185 function parameter 'nxfers_i' not described in 'p3h2x4x_tp_i2c_xfer_msg'
>> Warning: drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:185 function parameter 'rw' not described in 'p3h2x4x_tp_i2c_xfer_msg'
>> Warning: drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:185 function parameter 'p3h2x4x_i3c_hub' not described in 'p3h2x4x_tp_i2c_xfer_msg'
>> Warning: drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:185 function parameter 'xfers' not described in 'p3h2x4x_tp_i2c_xfer_msg'
>> Warning: drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:185 function parameter 'target_port' not described in 'p3h2x4x_tp_i2c_xfer_msg'
>> Warning: drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:185 function parameter 'nxfers_i' not described in 'p3h2x4x_tp_i2c_xfer_msg'
>> Warning: drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:185 function parameter 'rw' not described in 'p3h2x4x_tp_i2c_xfer_msg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
