Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B54FD4F34
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 20:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7H6196nhPb0JJzM/yJUhJKK2furMetW9s52Z1lmC3hg=; b=0bXrW843RZjAIH
	kBlvDzrwPsu6IFD7bXmiBSaXhhApWgqOOmH5kMhkobWDNql0rLo8Dv1lz8CPbxg99QqwYLQyWCw9E
	D9CHpazgGceR9VT9+qTVQDcXx5m4KPoURvDBHuy2KBvgts1ivXnOpmBPhk/iUbAkS0htA9ohLcvxD
	1TNw5IzUyacBkqAuvberTjX7j5n44wI33fjLvfK9Np2MjaJEB9xrgSj+54IZ5D0fWjWr1z/Y4UqPS
	hrJerhYxK6gHwV4zfdVphpq/0cnzZ/HED5re1PgKQdC+Bj66dINAUcfdKS1uxKYYDUw3X+3U7y3dY
	7/4QyaDeK/YecBqRGtzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03b6-0000000AFTe-1ZuI;
	Tue, 10 Mar 2026 20:22:32 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03b1-0000000AFSl-04w2
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 20:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773174147; x=1804710147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PMkXFNkNV+Amu/MmJHelepozqduhcpCJ9xFUO5KFsGo=;
  b=eZO30DSHZPRONWowr3QGNMScHavJosGzRvr0bNOlQ1ne0TEV3eDUiE29
   Xt6E93raSXnOkQCy9husUupI5g8wDdwFWumNB2ayE8gU1azP5lp9UEhoQ
   UQb1hMmTmryZKasKgY9w+CSBi8NJSIy57ErnqAvkwSWYqq/xCYrg0bUg0
   /akpV8O0GCN1SMiL896de+V68fUVe4RT0PjL8A1vgiNy6iovTmSbWyrKF
   6MMV6BaCcO0OFK0DLuth+9jDHUxxyi18H5emRHxgt0ugewK6ITtlvzq5V
   X2KKZIC8CA1Xs/D/l4pG1HwvM0zLhLmgBZKVCab2jlXva4Zj/u1dQT/VY
   Q==;
X-CSE-ConnectionGUID: 4hCqYslbTs6hnDbVoRXKWA==
X-CSE-MsgGUID: OTgWRA3QT4i6B1nGLfjDww==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74149281"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="74149281"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 13:22:23 -0700
X-CSE-ConnectionGUID: LO42DsZbRwCd5l0mnq/mbg==
X-CSE-MsgGUID: jvhGnfGMSuqPb7fZI3DogQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="225193909"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Mar 2026 13:22:19 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w03aq-000000000Fq-2wxt;
	Tue, 10 Mar 2026 20:22:16 +0000
Date: Wed, 11 Mar 2026 04:21:52 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>, linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com,
	lakshay.piplani@nxp.com
Subject: Re: [PATCH v6 6/7] i3c: hub: Add support for the I3C interface in
 the I3C hub
Message-ID: <202603110450.w8GEwjjv-lkp@intel.com>
References: <20260310065727.3759342-6-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310065727.3759342-6-lakshay.piplani@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_132227_114535_832C5B71 
X-CRM114-Status: GOOD (  11.02  )
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
[also build test WARNING on lee-mfd/for-mfd-next broonie-regulator/for-next linus/master v7.0-rc3 next-20260309]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lakshay-Piplani/i3c-master-Add-the-APIs-to-support-I3C-hub/20260310-150040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/20260310065727.3759342-6-lakshay.piplani%40nxp.com
patch subject: [PATCH v6 6/7] i3c: hub: Add support for the I3C interface in the I3C hub
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260311/202603110450.w8GEwjjv-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603110450.w8GEwjjv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603110450.w8GEwjjv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/i3c/hub.c:120 function parameter 'mode' not described in 'i3c_hub_master_priv_xfers'
>> Warning: drivers/i3c/hub.c:120 function parameter 'mode' not described in 'i3c_hub_master_priv_xfers'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
