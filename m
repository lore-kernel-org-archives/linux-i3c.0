Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73258EB1054
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/q24+oddayvdlK1LgoRmsjQXuGj2x/BqcNaZaEbpFu8=; b=Rrt2b0ofthSo5D
	eoeDmwb8i0JhloSEg6GeGobtAL1RkhWwomb6iWyPU8QAfEy6RgmtYszcJIKrTacZFySNNdor/ivTJ
	Ztifmv79JGzkvCxI45XsWm064nO/RA3CRYv+gRkV7obQDaDXvN/OnlmSqFGiNRUqrMdP9lSkaCbLF
	CTq00nuesw+IIGQsG3ryVvUexU91JK4fzK+up19+eDZwWiSqtt8Qr6OjjBBsdmTirXcNuS6GXkWAv
	19OX63BlkhsMqs1qHvorX34/uXC8ldP/kQAbKVkqWQKsDCRnVlORrQ/ZC7lL5Lk0c2ERtXZ1mymdx
	H1nnrwmRA9Tugdx6ghhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyFx-00000009idl-0p9x;
	Tue, 10 Mar 2026 14:40:21 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzyFq-00000009id4-2AtM
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 14:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773153615; x=1804689615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8T67TVdhSVtvvdepFz9J1Xlz8I4C54onclSvxO6OHRs=;
  b=VKQ77PMS59Zivk4vXDFaoN+3WEXlpgObjvqnNp2auk1dJQifTUemlPU0
   EHPF0gZuzWmccuM7wzamnQIPTF1WXVfJAcprxOMIHcl2CSJskwDHH2gG4
   Mb5YkgLL2A7Hq15Bn9Wymg/oa7arouUv5K7BWscAMYQGKId2AhJD/QhCc
   xDliYRDPsBJQEl1EffxExxcsHXvG+oOjtxeZjqh137flcI3ZLsdoCppwR
   iQ/3bGOclodKIKaqiq54Tj6wecuq4prTMrd+HrElY3178wZCPbTAMMO+3
   H0fWdlkd9skeh6Z0ZSItupJC9uoT6E2e0mZRAPHSb2SWtRnYqb3z3RNF0
   w==;
X-CSE-ConnectionGUID: tUmtIaCjQ0eNTQfQ3wo1pA==
X-CSE-MsgGUID: QLHISQHkSKO89Fl9NIkbow==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85679951"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="85679951"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 07:40:12 -0700
X-CSE-ConnectionGUID: KDrZC1mQTqq3uRBDsVX0dQ==
X-CSE-MsgGUID: d5gc+KztSySnXUEngiDR5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="218094562"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Mar 2026 07:40:07 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzyFg-0000000025C-3tHG;
	Tue, 10 Mar 2026 14:40:04 +0000
Date: Tue, 10 Mar 2026 22:40:02 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>, linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org, alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, broonie@kernel.org, lee@kernel.org,
	Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com,
	lakshay.piplani@nxp.com
Subject: Re: [PATCH v6 1/7] i3c: master: Expose the APIs to support I3C hub
Message-ID: <202603102243.IVWJtjqQ-lkp@intel.com>
References: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_074014_895250_0B7EEBEA 
X-CRM114-Status: GOOD (  10.28  )
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
[also build test WARNING on lee-mfd/for-mfd-next broonie-regulator/for-next linus/master lee-mfd/for-mfd-fixes v7.0-rc3 next-20260309]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lakshay-Piplani/i3c-master-Add-the-APIs-to-support-I3C-hub/20260310-150040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/20260310065727.3759342-1-lakshay.piplani%40nxp.com
patch subject: [PATCH v6 1/7] i3c: master: Expose the APIs to support I3C hub
config: loongarch-randconfig-001-20260310 (https://download.01.org/0day-ci/archive/20260310/202603102243.IVWJtjqQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603102243.IVWJtjqQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603102243.IVWJtjqQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/i3c/master.c:3197 expecting prototype for i3c_dev_disable_ibi(). Prototype was for i3c_dev_disable_ibi_locked() instead
>> Warning: drivers/i3c/master.c:3263 expecting prototype for i3c_dev_request_ibi(). Prototype was for i3c_dev_request_ibi_locked() instead
>> Warning: drivers/i3c/master.c:3312 expecting prototype for i3c_dev_free_ibi(). Prototype was for i3c_dev_free_ibi_locked() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
