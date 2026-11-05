Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEDC606A335
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Nov 2026 04:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WbiENDL8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fBTikumb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q2NyD/S+DqdgoTyKoNMkBMRW5F6CUeB+PhqsJ2rREJk=; b=WbiENDL819D98z/kxwcODkFEHJ
	RWN0R6Py1FpUQcaFYJpFP8kVBlhfQiAM4W7q13YauU5NYkVSPwOOpLHRLobceFt0ZIP9yMp1ag6fP
	iKnx04aX/PGYv7teq/JTq+RwduTFpZ1q8d/mK4137rXBzmTrByh1zffiIH5lggM+FhX6JfiqqBwDn
	hV2GYYoop0zrgX2jZQMD7G9G452Yq0pSWxim6/hjRA0IWaGfOwIPyf4JMe+rAxKo2X1gCoCcKrAS2
	L38jEcjNx6gd26SPq9TVy9gqZ40uEsZ2/dTf7xpis7Yf5m900HAUjYtuvT6TQXIzo9ZjuatnQ2rnG
	WSuKZs6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpGa-00000007mwS-0lpz;
	Thu, 05 Nov 2026 04:40:00 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpGX-00000007mw7-2azA
	for linux-i3c@lists.infradead.org;
	Thu, 05 Nov 2026 04:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793853598; x=1825389598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cg6TXdUQ/S/YEBupqmRpvnVcb10mKF5zLcGTufA14os=;
  b=fBTikumbgJHAKa2C8pPA6vNuXyLAW0/di6uthASW+sAjnWJmdHVU0z1X
   GFf0CvZ7wH1jAQBgeJJ5aE/qQzUvgvGWwqBu64MYDgVS/oQnLwg4qRAnI
   GCfs5nXhXx3qJGZO/GaMTfYmIz2pTo2MjrxLla5llFb7C7Dt7Pc/m9YE6
   ospPyQqGrjlmOC0bO9T/HsWwMouwyL+FBNfIbA49hiXHDfgQ9tUW8It/j
   DxoM4lOKjR9auO8rDcuRlZLdmN3XqQGSxWYmsNq2uTyDxz9ym7dc8zn6w
   g6SDnnavIOP1I056mMHOONqb3iNJdi/YeiWCnlXyHooCNaXuppdaO2aVS
   w==;
X-CSE-ConnectionGUID: RZgOsFcdTumhHRzYbytkMg==
X-CSE-MsgGUID: ZLN56It+R8Cdq9K4g3Q46g==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2721226"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2721226"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 20:39:56 -0800
X-CSE-ConnectionGUID: xMu0NX5JSZCSk9HnB+kG2g==
X-CSE-MsgGUID: l1MXlwLESS+Vr3DdlRGzhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="8669882"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 04 Nov 2026 20:39:50 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOpGM-00000000leH-3jM7;
	Thu, 05 Nov 2026 04:39:46 +0000
Date: Thu, 5 Nov 2026 12:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shubhrajyoti.datta@amd.com,
	shubhamsanjay.patil@amd.com, adrian.hunter@intel.com,
	manikanta.guntupalli@amd.com, linux-i3c@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
	wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
	jyothi.seerapu@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
	aniket.randive@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
Subject: Re: [PATCH v7 2/3] i3c: master: Add Qualcomm I3C controller driver
Message-ID: <202611051252.K0VIpVGq-lkp@intel.com>
References: <20261104111610.3739095-2-mukesh.savaliya@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261104111610.3739095-2-mukesh.savaliya@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_203957_757016_E1AA88A9 
X-CRM114-Status: GOOD (  11.92  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on i3c/i3c/next]
[also build test ERROR on linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Kumar-Savaliya/i3c-master-Add-Qualcomm-I3C-controller-driver/20261104-164609
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/20261104111610.3739095-2-mukesh.savaliya%40oss.qualcomm.com
patch subject: [PATCH v7 2/3] i3c: master: Add Qualcomm I3C controller driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261105/202611051252.K0VIpVGq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 812626a41399a1d464a0d69627ab45c83b8ebfb9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051252.K0VIpVGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051252.K0VIpVGq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i3c/master/i3c-qcom-geni.c:19:
   include/linux/soc/qcom/geni-se.h:378:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     378 |         val = readl_relaxed(se->base + GENI_FW_REVISION_RO);
         |               ^
   include/linux/soc/qcom/geni-se.h:397:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     397 |         writel(m_cmd, se->base + SE_GENI_M_CMD0);
         |         ^
   include/linux/soc/qcom/geni-se.h:413:10: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     413 |         s_cmd = readl_relaxed(se->base + SE_GENI_S_CMD0);
         |                 ^
   include/linux/soc/qcom/geni-se.h:417:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     417 |         writel(s_cmd, se->base + SE_GENI_S_CMD0);
         |         ^
   include/linux/soc/qcom/geni-se.h:430:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     430 |         writel_relaxed(M_GENI_CMD_CANCEL, se->base + SE_GENI_M_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:443:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     443 |         writel_relaxed(S_GENI_CMD_CANCEL, se->base + SE_GENI_S_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:455:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     455 |         writel_relaxed(M_GENI_CMD_ABORT, se->base + SE_GENI_M_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:468:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     468 |         writel_relaxed(S_GENI_CMD_ABORT, se->base + SE_GENI_S_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:494:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     494 |         val = readl_relaxed(se->base + SE_HW_PARAM_0);
         |               ^
   include/linux/soc/qcom/geni-se.h:512:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     512 |         val = readl_relaxed(se->base + SE_HW_PARAM_0);
         |               ^
   include/linux/soc/qcom/geni-se.h:540:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     540 |         val = readl_relaxed(se->base + SE_HW_PARAM_1);
         |               ^
   In file included from drivers/i3c/master/i3c-qcom-geni.c:22:
   In file included from drivers/i3c/master/../internals.h:12:
   In file included from include/linux/io.h:12:
   In file included from arch/s390/include/asm/io.h:93:
>> include/asm-generic/io.h:288:20: error: static declaration of 'writel' follows non-static declaration
     288 | static inline void writel(u32 value, volatile void __iomem *addr)
         |                    ^
   include/asm-generic/io.h:287:16: note: expanded from macro 'writel'
     287 | #define writel writel
         |                ^
   include/linux/soc/qcom/geni-se.h:397:2: note: previous implicit declaration is here
     397 |         writel(m_cmd, se->base + SE_GENI_M_CMD0);
         |         ^
   In file included from drivers/i3c/master/i3c-qcom-geni.c:22:
   In file included from drivers/i3c/master/../internals.h:12:
   In file included from include/linux/io.h:12:
   In file included from arch/s390/include/asm/io.h:93:
>> include/asm-generic/io.h:353:19: error: static declaration of 'readl_relaxed' follows non-static declaration
     353 | static inline u32 readl_relaxed(const volatile void __iomem *addr)
         |                   ^
   include/asm-generic/io.h:352:23: note: expanded from macro 'readl_relaxed'
     352 | #define readl_relaxed readl_relaxed
         |                       ^
   include/linux/soc/qcom/geni-se.h:378:8: note: previous implicit declaration is here
     378 |         val = readl_relaxed(se->base + GENI_FW_REVISION_RO);
         |               ^
   In file included from drivers/i3c/master/i3c-qcom-geni.c:22:
   In file included from drivers/i3c/master/../internals.h:12:
   In file included from include/linux/io.h:12:
   In file included from arch/s390/include/asm/io.h:93:
>> include/asm-generic/io.h:407:20: error: static declaration of 'writel_relaxed' follows non-static declaration
     407 | static inline void writel_relaxed(u32 value, volatile void __iomem *addr)
         |                    ^
   include/asm-generic/io.h:406:24: note: expanded from macro 'writel_relaxed'
     406 | #define writel_relaxed writel_relaxed
         |                        ^
   include/linux/soc/qcom/geni-se.h:430:2: note: previous implicit declaration is here
     430 |         writel_relaxed(M_GENI_CMD_CANCEL, se->base + SE_GENI_M_CMD_CTRL_REG);
         |         ^
>> drivers/i3c/master/i3c-qcom-geni.c:284:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     284 |         val = FIELD_PREP(CLK_DIV_VALUE_MASK, clk_idx->clk_div);
         |               ^
   drivers/i3c/master/i3c-qcom-geni.c:363:6: warning: variable 'm_stat_mask' set but not used [-Wunused-but-set-variable]
     363 |         u32 m_stat_mask, dm_tx_st, dm_rx_st;
         |             ^
   drivers/i3c/master/i3c-qcom-geni.c:579:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     579 |                 pid = FIELD_PREP(GENMASK_ULL(47, 40), (u64)rx_buf[0]) |
         |                       ^
   drivers/i3c/master/i3c-qcom-geni.c:637:20: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     637 |                         xfer.m_param |= FIELD_PREP(CCC_HDR_CMD_MSK, cmd->id);
         |                                         ^
   drivers/i3c/master/i3c-qcom-geni.c:737:20: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     737 |                         xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, dev->info.dyn_addr);
         |                                         ^
   drivers/i3c/master/i3c-qcom-geni.c:791:19: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     791 |                 xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, msgs[i].addr);
         |                                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.
--
   In file included from i3c-qcom-geni.c:19:
   include/linux/soc/qcom/geni-se.h:378:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     378 |         val = readl_relaxed(se->base + GENI_FW_REVISION_RO);
         |               ^
   include/linux/soc/qcom/geni-se.h:397:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     397 |         writel(m_cmd, se->base + SE_GENI_M_CMD0);
         |         ^
   include/linux/soc/qcom/geni-se.h:413:10: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     413 |         s_cmd = readl_relaxed(se->base + SE_GENI_S_CMD0);
         |                 ^
   include/linux/soc/qcom/geni-se.h:417:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     417 |         writel(s_cmd, se->base + SE_GENI_S_CMD0);
         |         ^
   include/linux/soc/qcom/geni-se.h:430:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     430 |         writel_relaxed(M_GENI_CMD_CANCEL, se->base + SE_GENI_M_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:443:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     443 |         writel_relaxed(S_GENI_CMD_CANCEL, se->base + SE_GENI_S_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:455:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     455 |         writel_relaxed(M_GENI_CMD_ABORT, se->base + SE_GENI_M_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:468:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     468 |         writel_relaxed(S_GENI_CMD_ABORT, se->base + SE_GENI_S_CMD_CTRL_REG);
         |         ^
   include/linux/soc/qcom/geni-se.h:494:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     494 |         val = readl_relaxed(se->base + SE_HW_PARAM_0);
         |               ^
   include/linux/soc/qcom/geni-se.h:512:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     512 |         val = readl_relaxed(se->base + SE_HW_PARAM_0);
         |               ^
   include/linux/soc/qcom/geni-se.h:540:8: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     540 |         val = readl_relaxed(se->base + SE_HW_PARAM_1);
         |               ^
   In file included from i3c-qcom-geni.c:22:
   In file included from ./../internals.h:12:
   In file included from include/linux/io.h:12:
   In file included from arch/s390/include/asm/io.h:93:
>> include/asm-generic/io.h:288:20: error: static declaration of 'writel' follows non-static declaration
     288 | static inline void writel(u32 value, volatile void __iomem *addr)
         |                    ^
   include/asm-generic/io.h:287:16: note: expanded from macro 'writel'
     287 | #define writel writel
         |                ^
   include/linux/soc/qcom/geni-se.h:397:2: note: previous implicit declaration is here
     397 |         writel(m_cmd, se->base + SE_GENI_M_CMD0);
         |         ^
   In file included from i3c-qcom-geni.c:22:
   In file included from ./../internals.h:12:
   In file included from include/linux/io.h:12:
   In file included from arch/s390/include/asm/io.h:93:
>> include/asm-generic/io.h:353:19: error: static declaration of 'readl_relaxed' follows non-static declaration
     353 | static inline u32 readl_relaxed(const volatile void __iomem *addr)
         |                   ^
   include/asm-generic/io.h:352:23: note: expanded from macro 'readl_relaxed'
     352 | #define readl_relaxed readl_relaxed
         |                       ^
   include/linux/soc/qcom/geni-se.h:378:8: note: previous implicit declaration is here
     378 |         val = readl_relaxed(se->base + GENI_FW_REVISION_RO);
         |               ^
   In file included from i3c-qcom-geni.c:22:
   In file included from ./../internals.h:12:
   In file included from include/linux/io.h:12:
   In file included from arch/s390/include/asm/io.h:93:
>> include/asm-generic/io.h:407:20: error: static declaration of 'writel_relaxed' follows non-static declaration
     407 | static inline void writel_relaxed(u32 value, volatile void __iomem *addr)
         |                    ^
   include/asm-generic/io.h:406:24: note: expanded from macro 'writel_relaxed'
     406 | #define writel_relaxed writel_relaxed
         |                        ^
   include/linux/soc/qcom/geni-se.h:430:2: note: previous implicit declaration is here
     430 |         writel_relaxed(M_GENI_CMD_CANCEL, se->base + SE_GENI_M_CMD_CTRL_REG);
         |         ^
   i3c-qcom-geni.c:284:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     284 |         val = FIELD_PREP(CLK_DIV_VALUE_MASK, clk_idx->clk_div);
         |               ^
   i3c-qcom-geni.c:363:6: warning: variable 'm_stat_mask' set but not used [-Wunused-but-set-variable]
     363 |         u32 m_stat_mask, dm_tx_st, dm_rx_st;
         |             ^
   i3c-qcom-geni.c:579:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     579 |                 pid = FIELD_PREP(GENMASK_ULL(47, 40), (u64)rx_buf[0]) |
         |                       ^
   i3c-qcom-geni.c:637:20: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     637 |                         xfer.m_param |= FIELD_PREP(CCC_HDR_CMD_MSK, cmd->id);
         |                                         ^
   i3c-qcom-geni.c:737:20: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     737 |                         xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, dev->info.dyn_addr);
         |                                         ^
   i3c-qcom-geni.c:791:19: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     791 |                 xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, msgs[i].addr);
         |                                 ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.


vim +/readl_relaxed +353 include/asm-generic/io.h

3f7e212df82ca04 Arnd Bergmann      2009-05-13  285  
9216efafc52ff99 Thierry Reding     2014-10-01  286  #ifndef writel
9216efafc52ff99 Thierry Reding     2014-10-01  287  #define writel writel
9216efafc52ff99 Thierry Reding     2014-10-01 @288  static inline void writel(u32 value, volatile void __iomem *addr)
3f7e212df82ca04 Arnd Bergmann      2009-05-13  289  {
8327bd4fcb6c1da Varad Gautam       2025-03-30  290  	if (rwmmio_tracepoint_enabled(rwmmio_write))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  291  		log_write_mmio(value, 32, addr, _THIS_IP_, _RET_IP_);
755bd04aaf4bf7c Sinan Kaya         2018-04-05  292  	__io_bw();
c1d55d50139bea6 Stafford Horne     2020-07-29  293  	__raw_writel((u32 __force)__cpu_to_le32(value), addr);
755bd04aaf4bf7c Sinan Kaya         2018-04-05  294  	__io_aw();
8327bd4fcb6c1da Varad Gautam       2025-03-30  295  	if (rwmmio_tracepoint_enabled(rwmmio_post_write))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  296  		log_post_write_mmio(value, 32, addr, _THIS_IP_, _RET_IP_);
3f7e212df82ca04 Arnd Bergmann      2009-05-13  297  }
9216efafc52ff99 Thierry Reding     2014-10-01  298  #endif
3f7e212df82ca04 Arnd Bergmann      2009-05-13  299  
9216efafc52ff99 Thierry Reding     2014-10-01  300  #ifdef CONFIG_64BIT
9216efafc52ff99 Thierry Reding     2014-10-01  301  #ifndef writeq
9216efafc52ff99 Thierry Reding     2014-10-01  302  #define writeq writeq
9216efafc52ff99 Thierry Reding     2014-10-01  303  static inline void writeq(u64 value, volatile void __iomem *addr)
3f7e212df82ca04 Arnd Bergmann      2009-05-13  304  {
8327bd4fcb6c1da Varad Gautam       2025-03-30  305  	if (rwmmio_tracepoint_enabled(rwmmio_write))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  306  		log_write_mmio(value, 64, addr, _THIS_IP_, _RET_IP_);
755bd04aaf4bf7c Sinan Kaya         2018-04-05  307  	__io_bw();
d564fa1ff19e893 Vladimir Oltean    2023-01-09  308  	__raw_writeq((u64 __force)__cpu_to_le64(value), addr);
755bd04aaf4bf7c Sinan Kaya         2018-04-05  309  	__io_aw();
8327bd4fcb6c1da Varad Gautam       2025-03-30  310  	if (rwmmio_tracepoint_enabled(rwmmio_post_write))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  311  		log_post_write_mmio(value, 64, addr, _THIS_IP_, _RET_IP_);
3f7e212df82ca04 Arnd Bergmann      2009-05-13  312  }
9216efafc52ff99 Thierry Reding     2014-10-01  313  #endif
9216efafc52ff99 Thierry Reding     2014-10-01  314  #endif /* CONFIG_64BIT */
3f7e212df82ca04 Arnd Bergmann      2009-05-13  315  
1c8d29696f0d799 Arnd Bergmann      2014-11-11  316  /*
1c8d29696f0d799 Arnd Bergmann      2014-11-11  317   * {read,write}{b,w,l,q}_relaxed() are like the regular version, but
1c8d29696f0d799 Arnd Bergmann      2014-11-11  318   * are not guaranteed to provide ordering against spinlocks or memory
1c8d29696f0d799 Arnd Bergmann      2014-11-11  319   * accesses.
1c8d29696f0d799 Arnd Bergmann      2014-11-11  320   */
1c8d29696f0d799 Arnd Bergmann      2014-11-11  321  #ifndef readb_relaxed
8875c55437617fa Sinan Kaya         2018-04-06  322  #define readb_relaxed readb_relaxed
8875c55437617fa Sinan Kaya         2018-04-06  323  static inline u8 readb_relaxed(const volatile void __iomem *addr)
8875c55437617fa Sinan Kaya         2018-04-06  324  {
210031971cdd25a Sai Prakash Ranjan 2022-05-18  325  	u8 val;
210031971cdd25a Sai Prakash Ranjan 2022-05-18  326  
8327bd4fcb6c1da Varad Gautam       2025-03-30  327  	if (rwmmio_tracepoint_enabled(rwmmio_read))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  328  		log_read_mmio(8, addr, _THIS_IP_, _RET_IP_);
210031971cdd25a Sai Prakash Ranjan 2022-05-18  329  	val = __raw_readb(addr);
8327bd4fcb6c1da Varad Gautam       2025-03-30  330  	if (rwmmio_tracepoint_enabled(rwmmio_post_read))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  331  		log_post_read_mmio(val, 8, addr, _THIS_IP_, _RET_IP_);
210031971cdd25a Sai Prakash Ranjan 2022-05-18  332  	return val;
8875c55437617fa Sinan Kaya         2018-04-06  333  }
1c8d29696f0d799 Arnd Bergmann      2014-11-11  334  #endif
1c8d29696f0d799 Arnd Bergmann      2014-11-11  335  
1c8d29696f0d799 Arnd Bergmann      2014-11-11  336  #ifndef readw_relaxed
8875c55437617fa Sinan Kaya         2018-04-06  337  #define readw_relaxed readw_relaxed
8875c55437617fa Sinan Kaya         2018-04-06  338  static inline u16 readw_relaxed(const volatile void __iomem *addr)
8875c55437617fa Sinan Kaya         2018-04-06  339  {
210031971cdd25a Sai Prakash Ranjan 2022-05-18  340  	u16 val;
210031971cdd25a Sai Prakash Ranjan 2022-05-18  341  
8327bd4fcb6c1da Varad Gautam       2025-03-30  342  	if (rwmmio_tracepoint_enabled(rwmmio_read))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  343  		log_read_mmio(16, addr, _THIS_IP_, _RET_IP_);
05d3855b4d21ef3 Vladimir Oltean    2023-01-09  344  	val = __le16_to_cpu((__le16 __force)__raw_readw(addr));
8327bd4fcb6c1da Varad Gautam       2025-03-30  345  	if (rwmmio_tracepoint_enabled(rwmmio_post_read))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  346  		log_post_read_mmio(val, 16, addr, _THIS_IP_, _RET_IP_);
210031971cdd25a Sai Prakash Ranjan 2022-05-18  347  	return val;
8875c55437617fa Sinan Kaya         2018-04-06  348  }
1c8d29696f0d799 Arnd Bergmann      2014-11-11  349  #endif
1c8d29696f0d799 Arnd Bergmann      2014-11-11  350  
1c8d29696f0d799 Arnd Bergmann      2014-11-11  351  #ifndef readl_relaxed
8875c55437617fa Sinan Kaya         2018-04-06  352  #define readl_relaxed readl_relaxed
8875c55437617fa Sinan Kaya         2018-04-06 @353  static inline u32 readl_relaxed(const volatile void __iomem *addr)
8875c55437617fa Sinan Kaya         2018-04-06  354  {
210031971cdd25a Sai Prakash Ranjan 2022-05-18  355  	u32 val;
210031971cdd25a Sai Prakash Ranjan 2022-05-18  356  
8327bd4fcb6c1da Varad Gautam       2025-03-30  357  	if (rwmmio_tracepoint_enabled(rwmmio_read))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  358  		log_read_mmio(32, addr, _THIS_IP_, _RET_IP_);
05d3855b4d21ef3 Vladimir Oltean    2023-01-09  359  	val = __le32_to_cpu((__le32 __force)__raw_readl(addr));
8327bd4fcb6c1da Varad Gautam       2025-03-30  360  	if (rwmmio_tracepoint_enabled(rwmmio_post_read))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  361  		log_post_read_mmio(val, 32, addr, _THIS_IP_, _RET_IP_);
210031971cdd25a Sai Prakash Ranjan 2022-05-18  362  	return val;
8875c55437617fa Sinan Kaya         2018-04-06  363  }
1c8d29696f0d799 Arnd Bergmann      2014-11-11  364  #endif
1c8d29696f0d799 Arnd Bergmann      2014-11-11  365  
e511267bc25e189 Robin Murphy       2016-04-26  366  #if defined(readq) && !defined(readq_relaxed)
8875c55437617fa Sinan Kaya         2018-04-06  367  #define readq_relaxed readq_relaxed
8875c55437617fa Sinan Kaya         2018-04-06  368  static inline u64 readq_relaxed(const volatile void __iomem *addr)
8875c55437617fa Sinan Kaya         2018-04-06  369  {
210031971cdd25a Sai Prakash Ranjan 2022-05-18  370  	u64 val;
210031971cdd25a Sai Prakash Ranjan 2022-05-18  371  
8327bd4fcb6c1da Varad Gautam       2025-03-30  372  	if (rwmmio_tracepoint_enabled(rwmmio_read))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  373  		log_read_mmio(64, addr, _THIS_IP_, _RET_IP_);
05d3855b4d21ef3 Vladimir Oltean    2023-01-09  374  	val = __le64_to_cpu((__le64 __force)__raw_readq(addr));
8327bd4fcb6c1da Varad Gautam       2025-03-30  375  	if (rwmmio_tracepoint_enabled(rwmmio_post_read))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  376  		log_post_read_mmio(val, 64, addr, _THIS_IP_, _RET_IP_);
210031971cdd25a Sai Prakash Ranjan 2022-05-18  377  	return val;
8875c55437617fa Sinan Kaya         2018-04-06  378  }
1c8d29696f0d799 Arnd Bergmann      2014-11-11  379  #endif
3f7e212df82ca04 Arnd Bergmann      2009-05-13  380  
9439eb3ab9d1ece Will Deacon        2013-09-03  381  #ifndef writeb_relaxed
a71e7c44ffb7bae Sinan Kaya         2018-04-06  382  #define writeb_relaxed writeb_relaxed
a71e7c44ffb7bae Sinan Kaya         2018-04-06  383  static inline void writeb_relaxed(u8 value, volatile void __iomem *addr)
a71e7c44ffb7bae Sinan Kaya         2018-04-06  384  {
8327bd4fcb6c1da Varad Gautam       2025-03-30  385  	if (rwmmio_tracepoint_enabled(rwmmio_write))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  386  		log_write_mmio(value, 8, addr, _THIS_IP_, _RET_IP_);
a71e7c44ffb7bae Sinan Kaya         2018-04-06  387  	__raw_writeb(value, addr);
8327bd4fcb6c1da Varad Gautam       2025-03-30  388  	if (rwmmio_tracepoint_enabled(rwmmio_post_write))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  389  		log_post_write_mmio(value, 8, addr, _THIS_IP_, _RET_IP_);
a71e7c44ffb7bae Sinan Kaya         2018-04-06  390  }
9439eb3ab9d1ece Will Deacon        2013-09-03  391  #endif
9439eb3ab9d1ece Will Deacon        2013-09-03  392  
9439eb3ab9d1ece Will Deacon        2013-09-03  393  #ifndef writew_relaxed
a71e7c44ffb7bae Sinan Kaya         2018-04-06  394  #define writew_relaxed writew_relaxed
a71e7c44ffb7bae Sinan Kaya         2018-04-06  395  static inline void writew_relaxed(u16 value, volatile void __iomem *addr)
a71e7c44ffb7bae Sinan Kaya         2018-04-06  396  {
8327bd4fcb6c1da Varad Gautam       2025-03-30  397  	if (rwmmio_tracepoint_enabled(rwmmio_write))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  398  		log_write_mmio(value, 16, addr, _THIS_IP_, _RET_IP_);
05d3855b4d21ef3 Vladimir Oltean    2023-01-09  399  	__raw_writew((u16 __force)cpu_to_le16(value), addr);
8327bd4fcb6c1da Varad Gautam       2025-03-30  400  	if (rwmmio_tracepoint_enabled(rwmmio_post_write))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  401  		log_post_write_mmio(value, 16, addr, _THIS_IP_, _RET_IP_);
a71e7c44ffb7bae Sinan Kaya         2018-04-06  402  }
9439eb3ab9d1ece Will Deacon        2013-09-03  403  #endif
9439eb3ab9d1ece Will Deacon        2013-09-03  404  
9439eb3ab9d1ece Will Deacon        2013-09-03  405  #ifndef writel_relaxed
a71e7c44ffb7bae Sinan Kaya         2018-04-06  406  #define writel_relaxed writel_relaxed
a71e7c44ffb7bae Sinan Kaya         2018-04-06 @407  static inline void writel_relaxed(u32 value, volatile void __iomem *addr)
a71e7c44ffb7bae Sinan Kaya         2018-04-06  408  {
8327bd4fcb6c1da Varad Gautam       2025-03-30  409  	if (rwmmio_tracepoint_enabled(rwmmio_write))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  410  		log_write_mmio(value, 32, addr, _THIS_IP_, _RET_IP_);
05d3855b4d21ef3 Vladimir Oltean    2023-01-09  411  	__raw_writel((u32 __force)__cpu_to_le32(value), addr);
8327bd4fcb6c1da Varad Gautam       2025-03-30  412  	if (rwmmio_tracepoint_enabled(rwmmio_post_write))
5e5ff73c2e5863f Sai Prakash Ranjan 2022-10-17  413  		log_post_write_mmio(value, 32, addr, _THIS_IP_, _RET_IP_);
a71e7c44ffb7bae Sinan Kaya         2018-04-06  414  }
9439eb3ab9d1ece Will Deacon        2013-09-03  415  #endif
3f7e212df82ca04 Arnd Bergmann      2009-05-13  416  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
