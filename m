Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7C7CAC581
	for <linux-i3c@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AuEjgeuvINfgO4zE6Mwp14tV/2X7VWb82TaOhVUgvB4=; b=pjktXA3Yx6XDaE
	Z/6TKEVDrLnPS723yY8pThtY/HH89I6GfI7Z/D4GJVXpYCNVYp+7rXlF3LXU+mtCqQvVdwA7gUqj/
	x37LlsnGaqBfKzHcPLxnxBZFn6dEk25nqfL5hcN/LsQFjPGvFbPlpHfebMNL3X+mo0Y3Mo7HDSRM3
	PJ7Zd4ocbf0Ww6/rmrhaSjEJQD90lCnQp4cRMgK4Bz9YDsbbH9vM1GOc5gOziTTxbcJcTyVYw3sHZ
	e6Yys6RbbHsgbQh5cdjRhmLaxzU7a4/5kkHUx4JK4k4SnHTbu38CyJy5IbkU4OXs7UqDT5xkSA0gf
	URVfUsJjf5i5bnabvScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuClR-0000000CqmQ-2nq6;
	Thu, 04 Sep 2025 16:24:45 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu94u-0000000BZEo-2KQC
	for linux-i3c@lists.infradead.org;
	Thu, 04 Sep 2025 12:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756988917; x=1788524917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3kXMsEvtVTGzcyhvJNBolHNZKok6L0CuTxiUsIfG3nk=;
  b=GYXUn7Venk2Ju6c8kjSzVUrWfDJMyA2mP2PWnuYyhjgt92KNPpui1IDJ
   OE5KCMZCzGxRDtflY8osrUmOrJVFatX0mfv/b8j1RrEqtoQLe66zLAHrY
   dodD4K/zoCOYpKNY9xC2wN8+jb9gnN5rffTfTsjgXFF+SpzUGOZN/8s3e
   EJMx9TjFZSoiPDfdz8BwCg6CLc8wAOLGobouLw9EtisvowG1lz7L5M6fc
   kWhgZn0TLzp/FJVX9Ok3kOBZhsjYNi9jCzqRoQC9mCGG9fVHjk3cPP4jd
   AV+JWqwA9BCBoGgMt/ydwQFKkW/x6Shl7zek5Yn3g7f6/R7blev/uEbLq
   A==;
X-CSE-ConnectionGUID: Ym45E/ZaTTSYEnDGCuLrcg==
X-CSE-MsgGUID: hUr/hNGKRy2NlH1HRyLxdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="70420815"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; 
   d="scan'208";a="70420815"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2025 05:28:36 -0700
X-CSE-ConnectionGUID: IDJ6lS2mTt2m9S789U3zXQ==
X-CSE-MsgGUID: nKkv4LIVRSW6f7ykFF5arQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Sep 2025 05:28:27 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uu93x-0005Hz-0p;
	Thu, 04 Sep 2025 12:27:56 +0000
Date: Thu, 4 Sep 2025 20:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>, git@amd.com,
	michal.simek@amd.com, alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, kees@kernel.org, gustavoars@kernel.org,
	jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
	shubhrajyoti.datta@amd.com, manion05gk@gmail.com,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Subject: Re: [PATCH V3 2/2] i3c: master: Add AMD I3C bus controller driver
Message-ID: <202509042018.CCuFpnkb-lkp@intel.com>
References: <20250903095906.3260804-3-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250903095906.3260804-3-manikanta.guntupalli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_052836_643528_EE743496 
X-CRM114-Status: GOOD (  11.22  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.17-rc4 next-20250904]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Guntupalli/dt-bindings-i3c-Add-AMD-I3C-master-controller-support/20250903-220233
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250903095906.3260804-3-manikanta.guntupalli%40amd.com
patch subject: [PATCH V3 2/2] i3c: master: Add AMD I3C bus controller driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250904/202509042018.CCuFpnkb-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509042018.CCuFpnkb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509042018.CCuFpnkb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/i3c/master/amd-i3c-master.c:182:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     182 |         return FIELD_GET(XI3C_RESP_CODE_MASK, response_data);
         |                ^
   drivers/i3c/master/amd-i3c-master.c:338:29: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     338 |         while (cmd->rx_len > 0 && !xi3c_is_resp_available(master)) {
         |                                    ^
   drivers/i3c/master/amd-i3c-master.c:102:8: note: expanded from macro 'xi3c_is_resp_available'
     102 |         ((u8)(FIELD_GET(XI3C_SR_RESP_NOT_EMPTY_MASK,                            \
         |               ^
   drivers/i3c/master/amd-i3c-master.c:382:29: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     382 |         while (cmd->tx_len > 0 && !xi3c_is_resp_available(master)) {
         |                                    ^
   drivers/i3c/master/amd-i3c-master.c:102:8: note: expanded from macro 'xi3c_is_resp_available'
     102 |         ((u8)(FIELD_GET(XI3C_SR_RESP_NOT_EMPTY_MASK,                            \
         |               ^
   drivers/i3c/master/amd-i3c-master.c:592:20: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     592 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                  ^
>> drivers/i3c/master/amd-i3c-master.c:592:30: warning: shift count >= width of type [-Wshift-count-overflow]
     592 |                 pid_bcr_dcr[i] = FIELD_GET(XI3C_PID_MASK,
         |                                            ^~~~~~~~~~~~~
   drivers/i3c/master/amd-i3c-master.c:53:26: note: expanded from macro 'XI3C_PID_MASK'
      53 | #define XI3C_PID_MASK                           GENMASK(63, 16)
         |                                                 ^~~~~~~~~~~~~~~
   include/linux/bits.h:51:24: note: expanded from macro 'GENMASK'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:20: note: expanded from macro 'GENMASK_TYPE'
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i3c/master/amd-i3c-master.c:835:6: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     835 |         if (xi3c_getrevisionnumber(master) == 0)
         |             ^
   drivers/i3c/master/amd-i3c-master.c:90:8: note: expanded from macro 'xi3c_getrevisionnumber'
      90 |         ((u8)(FIELD_GET(XI3C_REV_NUM_MASK,                                      \
         |               ^
   drivers/i3c/master/amd-i3c-master.c:925:15: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     925 |         info.pid = ((FIELD_GET(XI3C_PID1_MASK, pid1_bcr_dcr) << 32) |
         |                      ^
   drivers/i3c/master/amd-i3c-master.c:925:55: warning: shift count >= width of type [-Wshift-count-overflow]
     925 |         info.pid = ((FIELD_GET(XI3C_PID1_MASK, pid1_bcr_dcr) << 32) |
         |                                                              ^  ~~
   2 warnings and 6 errors generated.


vim +/FIELD_GET +182 drivers/i3c/master/amd-i3c-master.c

   164	
   165	static int xi3c_get_response(struct xi3c_master *master)
   166	{
   167		u32 resp_reg, response_data;
   168		int ret;
   169	
   170		ret = readl_poll_timeout(master->membase + XI3C_SR_OFFSET,
   171					 resp_reg,
   172					 resp_reg & XI3C_SR_RESP_NOT_EMPTY_MASK,
   173					 0, XI3C_XFER_TIMEOUT_MS);
   174		if (ret) {
   175			dev_err(master->dev, "AXI I3C response timeout\n");
   176			return ret;
   177		}
   178	
   179		response_data = readl(master->membase + XI3C_RESP_STATUS_FIFO_OFFSET);
   180	
   181		/* Return response code */
 > 182		return FIELD_GET(XI3C_RESP_CODE_MASK, response_data);
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
