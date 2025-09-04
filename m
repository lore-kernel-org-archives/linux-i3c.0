Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCF7CA1015
	for <linux-i3c@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tuiGULvlNTrtccS9WcvV3+aYPpOWUtjX8qcJzw+VSq4=; b=AbDVzMtNYgjVRX
	RgwsM3Jj9+AJuosFyQses7cz2uIf2krswGMnuyQ53Vdt0qqcLY/xPWKWkPXFZ/s6qYZghVoMTeTGG
	yzRjwUPrRk/dE6Z+mV4snQdneD/G7ariafGdxpwPnBerSV2zgQOImKbNR7C8anXGxBpJ6jzRyIShR
	YIm/YOFFvU8sHDQITNO8TPHIlkjJRPpoigdHC2xWovJJXY5UkHJkEMlu2RS9qr+F6SrhdL8sDd7ix
	VBeFKLwB32FEfNXgZ5oIxKWYWymRZjoU5XeFzE6LZ+M5cOBfZqMZLa6LIazhADSdN9bi8zZlPhI/K
	sG0YNzA2UCFKogqlua/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuClT-0000000Cqr7-49iQ;
	Thu, 04 Sep 2025 16:24:47 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9ET-0000000BcS8-1WJf
	for linux-i3c@lists.infradead.org;
	Thu, 04 Sep 2025 12:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756989509; x=1788525509;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FBGLD3KXpGnBfJUXJqFViPTZk56264NLPCfYoX+fVpM=;
  b=IQllowljP42qk8AS32F4Oa1RiLgs7LDy2yWv3YDYvp6NpQB23Tj1ODKJ
   TiP0bfwOfHAQ6AGZpJctqI4fiWm4uTgH1+uj09/fmdTGUONt+KxCpUCBT
   pd5RvfFt2cXZsNPm+ePQB9uuGNLVuTZNx3GGIRt4BT6fKJlvm1Bp+sqgA
   e4C7X+GIG471B/O02G4tRgbjNSIh7C3uL4wzXLE+V9RbYdNz9HYNze5dL
   7c93yrbiqp9bbjtGGFlEg92BUdGQsD+IvlLa3BQJfsqsm6xxh26dJb/6f
   8Eml9Fz0ErsOhUgKZQu9AHGKSP0xD8yRQk7/4yr2yxdaSNNuD/t7zFUVx
   w==;
X-CSE-ConnectionGUID: ESmViP6xT1W+gdpOq4nAww==
X-CSE-MsgGUID: XL5NIVJuRFmDJyzzRmP5fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="70030659"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="70030659"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 05:38:27 -0700
X-CSE-ConnectionGUID: nO4eeNixTqKJl6ZGSDOJpg==
X-CSE-MsgGUID: uVrUxsVqSRSnPCJvRO0NNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="176223164"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 04 Sep 2025 05:38:22 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uu9E1-0005IF-0F;
	Thu, 04 Sep 2025 12:38:06 +0000
Date: Thu, 4 Sep 2025 20:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com,
	michal.simek@amd.com, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
	jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, radhey.shyam.pandey@amd.com,
	srinivas.goud@amd.com, shubhrajyoti.datta@amd.com,
	manion05gk@gmail.com,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Subject: Re: [PATCH V3 2/2] i3c: master: Add AMD I3C bus controller driver
Message-ID: <202509042006.MI4nEHWs-lkp@intel.com>
References: <20250903095906.3260804-3-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250903095906.3260804-3-manikanta.guntupalli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_053829_612189_2409E4ED 
X-CRM114-Status: GOOD (  10.71  )
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

Hi Manikanta,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17-rc4 next-20250904]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Guntupalli/dt-bindings-i3c-Add-AMD-I3C-master-controller-support/20250903-220233
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250903095906.3260804-3-manikanta.guntupalli%40amd.com
patch subject: [PATCH V3 2/2] i3c: master: Add AMD I3C bus controller driver
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250904/202509042006.MI4nEHWs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509042006.MI4nEHWs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509042006.MI4nEHWs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/i3c/master/amd-i3c-master.c:156 struct member 'daa' not described in 'xi3c_master'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
