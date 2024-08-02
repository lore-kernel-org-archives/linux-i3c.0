Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7010FC3DA7F
	for <linux-i3c@archiver.kernel.org>; Fri,  2 Aug 2024 23:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7O/npNPrkN2eOEU+PUqOBwlc2uVPCWc3echw8Z1m34=; b=x421B0rz49nurs
	29kDZO9E6umGKrlZleLOdQuAyKSdX8Oqq/koEiM/KMKIYpaBniDv0YH63hSJlzQnnHjo7ut26pboM
	W4wKSvhE19/B1r6VHaNtyRpBXIKapMjbJrZ9M/Gxf8WM6rDP16OA7vaB6GSHa9cZjOsSd1OLCRCmr
	U6QhNtEd+Yr1IIM2+97HXczmpCUBsRxBtxmmyLuPD2HKlGs/6zxlRipJFct95pWJw5HV8J1ReAhSx
	Xh28PtlB0l5y4wKMOvBgY6n1v9iImXNq1PyNHO1pvbM1jN0k8HvpYF8H+e1bFEeS1eVczt9vY8JKw
	iUz35CH3ZuQ/nLYi04Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sa1fP-0000000AL3j-3LZf;
	Fri, 02 Aug 2024 23:26:35 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sa1fN-0000000AL35-0A35
	for linux-i3c@lists.infradead.org;
	Fri, 02 Aug 2024 23:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722641193; x=1754177193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jcbz/gg6+XN0P/pOczsu0ej73zhPm485GKcdKVXxrxw=;
  b=TyzOk+x7HGTc3lSKYhQc0NWUEeJ9OnO9brs+ZB+3mE5qwMpOhSOjnlPw
   8N4cUNlT26c832MIl60mZODORL9AfcurS7MuyFZVp9+NW8mYgzP5o+OaR
   Urjh+hgz0eNYf2mAViOod+UXLCScEnGbB/NaayARdbqghJOPz+jhNOam8
   lKY4HIkSlKud94ybUVmyFcsGm97xgBEI6wVFg5wdHH78Rkst7GVVA5G1u
   VjVVfuLq47KYhCRGUfAbXwM+M4TIGFtt6WDqc0l2GLEi0bI1xrDICJ+QI
   MHT0+1MVztYRYM57OFhDSgrpjoqCaDkpKNim3huFzsj66MD3TVxkaQ2Li
   g==;
X-CSE-ConnectionGUID: VyPdl5guTKqLqlDvqFrRgg==
X-CSE-MsgGUID: K+4HTJ2ISySmsmEoBoa2xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="31302941"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="31302941"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 16:26:08 -0700
X-CSE-ConnectionGUID: RUOZqdf4TWqzhKsdVGEqzQ==
X-CSE-MsgGUID: URWv0Wf2Q9+Bu6lYSUhg7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="86496105"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Aug 2024 16:26:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa1es-000xXP-1m;
	Fri, 02 Aug 2024 23:26:02 +0000
Date: Sat, 3 Aug 2024 07:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: Stanley Chu <stanley.chuys@gmail.com>, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, linux-i3c@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, yschu@nuvoton.com, cpchiang1@nuvoton.com
Subject: Re: [PATCH v1 2/2] i3c: master: Add Nuvoton npcm845 i3c master driver
Message-ID: <202408030639.LBZ5zgGw-lkp@intel.com>
References: <20240801071946.43266-3-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240801071946.43266-3-yschu@nuvoton.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_162633_113765_B687F988 
X-CRM114-Status: GOOD (  12.95  )
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

Hi Stanley,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanley-Chu/dt-bindings-i3c-Add-NPCM845-i3c-controller/20240802-183617
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240801071946.43266-3-yschu%40nuvoton.com
patch subject: [PATCH v1 2/2] i3c: master: Add Nuvoton npcm845 i3c master driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240803/202408030639.LBZ5zgGw-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408030639.LBZ5zgGw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408030639.LBZ5zgGw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/i3c/master/npcm845-i3c-master.c:655:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     655 |         default:
         |         ^
   drivers/i3c/master/npcm845-i3c-master.c:655:2: note: insert 'break;' to avoid fall-through
     655 |         default:
         |         ^
         |         break; 
>> drivers/i3c/master/npcm845-i3c-master.c:1112:9: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
    1112 |                         if ((NPCM_I3C_MSTATUS_STATE_IDLE(reg) |
         |                             ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                               ||
    1113 |                              NPCM_I3C_MSTATUS_STATE_SLVREQ(reg)) &&
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/npcm845-i3c-master.c:67:42: note: expanded from macro 'NPCM_I3C_MSTATUS_STATE_IDLE'
      67 | #define   NPCM_I3C_MSTATUS_STATE_IDLE(x) (NPCM_I3C_MSTATUS_STATE(x) == 0)
         |                                          ^
   drivers/i3c/master/npcm845-i3c-master.c:1112:9: note: cast one or both operands to int to silence this warning
   drivers/i3c/master/npcm845-i3c-master.c:67:42: note: expanded from macro 'NPCM_I3C_MSTATUS_STATE_IDLE'
      67 | #define   NPCM_I3C_MSTATUS_STATE_IDLE(x) (NPCM_I3C_MSTATUS_STATE(x) == 0)
         |                                          ^
>> drivers/i3c/master/npcm845-i3c-master.c:2353:12: error: incompatible function pointer types initializing 'void (*)(struct platform_device *)' with an expression of type 'int (struct platform_device *)' [-Wincompatible-function-pointer-types]
    2353 |         .remove = npcm_i3c_master_remove,
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.


vim +2353 drivers/i3c/master/npcm845-i3c-master.c

  2350	
  2351	static struct platform_driver npcm_i3c_master = {
  2352		.probe = npcm_i3c_master_probe,
> 2353		.remove = npcm_i3c_master_remove,
  2354		.driver = {
  2355			.name = "npcm845-i3c-master",
  2356			.of_match_table = npcm_i3c_master_of_match_tbl,
  2357		},
  2358	};
  2359	module_platform_driver(npcm_i3c_master);
  2360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
