Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5E1D1267F
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 22:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ulDFvNeYdEn1q5nCpyJVHjB1intESsaJcoEH5hYAp+g=; b=BeZ9wkHjWGPvlp
	WNB5bAWdrBYRtFv1NAngyLYh1HxeEdLisJY1HeTdIrJNZBuPrlblC/bZgWkDmPTaGAFmAuFtTJ8bO
	wU2nn4noBK2YK+JCM9LdZ8I4g7e0J5BFxmbUjA5vUuFqEudbis2k3waCf9Z5auxwLp31JhSVyPXZ1
	KSUVffq5+xKqTdNNEqhntzx+YYs1Syh8vDwpOT3K41qKC5dRdylhEM5/ayzdYM2CFskWcLEKVaFz1
	NUL0tYTwxHKdBa5WZePhvUpYheEKHt3mL8nWZj0sPYOUEb6Al9ubr8FwavIrrFKsCJIUlR1Xwx4PU
	GCmCtp+PPiaouN/6RZgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQZCD-00000005uh0-21Hs;
	Tue, 02 Dec 2025 22:50:09 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQZCB-00000005uge-012m
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 22:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764715807; x=1796251807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G4oPXrPI8PwJJLVy+NJqGPdaksfb/5A6sgtJVTFuEAo=;
  b=lHhdr5Y47PnUaglF5O28ND0CO9nmfWqFlq6feCImA1oL5HsvbnVHLRVy
   KIyXAf982ukE3NNKznUpNFtVBnCEGyKgW0XiNJsDiQJ+PdYN1FOFQpPfC
   AjTWL3Vh83LYJRL92bgYAJ469pOebzVnaCCzkB3r8VynBno+S54RFLxh4
   RcfSAcABbqYbNDc49b71f9oZzdTcDaya0RS1tlilsxuRvmlHuVB8cz3Lf
   QKqn6xpE4QEiV/RnvlP0UTtJnRuiOlHRUfkuHeM08VaeczH7Y/IjpG8kg
   lCkQXETxPofAN0aGz6wRuV7Jc7Y16t346GGGH/ETAeU/hJVrMq/07YUBO
   Q==;
X-CSE-ConnectionGUID: Tl8ExeiRT/SEMYOCnNXOVg==
X-CSE-MsgGUID: U037c6l5RRGRY1RPHi2Q7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66420975"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66420975"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 14:49:59 -0800
X-CSE-ConnectionGUID: rVvzLVFqTCKrPMQzuuHqwA==
X-CSE-MsgGUID: hjzNXh/LSAqGS7RjtkXM2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="231840756"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Dec 2025 14:49:55 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQZBw-00000000AHF-2htP;
	Tue, 02 Dec 2025 22:49:52 +0000
Date: Wed, 3 Dec 2025 06:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: adrianhoyin.ng@altera.com, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, adrianhoyin.ng@altera.com
Subject: Re: [PATCH v5 4/5] i3c: dw: use FIELD_PREP for device address table
 macros
Message-ID: <202512030652.72UiYSSA-lkp@intel.com>
References: <4c4791c018d61beb9ff85ca68c5bf48940d2398e.1764663888.git.adrianhoyin.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c4791c018d61beb9ff85ca68c5bf48940d2398e.1764663888.git.adrianhoyin.ng@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_145007_153081_10055EA8 
X-CRM114-Status: GOOD (  10.46  )
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

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on i3c/i3c/next]
[also build test ERROR on linus/master v6.18 next-20251202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/adrianhoyin-ng-altera-com/i3c-add-sysfs-entry-for-Device-NACK-Retry-count/20251202-163150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/4c4791c018d61beb9ff85ca68c5bf48940d2398e.1764663888.git.adrianhoyin.ng%40altera.com
patch subject: [PATCH v5 4/5] i3c: dw: use FIELD_PREP for device address table macros
config: powerpc64-randconfig-r073-20251203 (https://download.01.org/0day-ci/archive/20251203/202512030652.72UiYSSA-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030652.72UiYSSA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512030652.72UiYSSA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i3c/master/dw-i3c-master.c: In function 'dw_i3c_master_daa':
>> drivers/i3c/master/dw-i3c-master.c:214:40: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
    #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
                                           ^~~~~~~~~~
   drivers/i3c/master/dw-i3c-master.c:862:10: note: in expansion of macro 'DEV_ADDR_TABLE_DYNAMIC_ADDR'
      writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(ret),
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +214 drivers/i3c/master/dw-i3c-master.c

   206	
   207	#define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
   208	#define DEV_ADDR_TABLE_DYNAMIC_MASK		GENMASK(23, 16)
   209	#define DEV_ADDR_TABLE_STATIC_MASK		GENMASK(6, 0)
   210	#define DEV_ADDR_TABLE_IBI_MDB		BIT(12)
   211	#define DEV_ADDR_TABLE_SIR_REJECT	BIT(13)
   212	#define DEV_ADDR_TABLE_DEV_NACK_RETRY_CNT(x)	(((x) << 29) & GENMASK(30, 29))
   213	#define DEV_ADDR_TABLE_LEGACY_I2C_DEV	BIT(31)
 > 214	#define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
   215	#define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
   216	#define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
   217	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
