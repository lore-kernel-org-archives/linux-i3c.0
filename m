Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B5AC47422
	for <linux-i3c@archiver.kernel.org>; Sat, 27 Jan 2024 00:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDjdEvgy3s9Z73uDjjWqLN/NGig8uEL/65atbNAtYkE=; b=UUqNzrf7nkYkHo
	CHEjqABsT2H0UGPWq2iykRQoCFbXGBRjJh2znQYhNHxQauh7cPoRCm/vxfxZi+hPoDuyoB4rPacQi
	+FWdQhsmhYebBEHTPaNDpM6XRp81qjy6lyCN5zsiaw3SJA8OVGToxzvFSYNvHMpgBBjkgH7rm7nnG
	qkqxebwQwLMHr3VX3KPP8MHT4vWpfUvIurj+wL4GZJX8xCxqkeYRbsMSw3nHIjEVQBBskXtT0TeBN
	NPWHaZKR/uN/kuKKTJ1DkT7UplhyT/yR0rdoarvipBg2WJcxTkMyCL6puWiNQRiRQHKMjKNVXPZGX
	zoc9NAeX3F0Qhmi6m+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTX2D-0000000622y-1GA1;
	Sat, 27 Jan 2024 00:59:01 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTX2A-0000000622M-16CE
	for linux-i3c@lists.infradead.org;
	Sat, 27 Jan 2024 00:58:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706317138; x=1737853138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7W44hQbjWJUDeDb618E3eurSBWCBLQAykx5uVsOx6TY=;
  b=VJos57dmrCzZSPrjncSwSj1Dsvp/2uBsgrC+1R0/gA16i6FiAPGF5yaI
   LCp+jxFdpbMFwDtbpT0LPXLjLd9zXAilSknE43B2efsYBq/fj9CUe1/49
   hXPJx5qP2OTSSNCkmCIkCgvfa0c+lanRADLZ8Lscxtit0V/EBrSlEd0oj
   JP4/r9hXJera8uC8yRsWB4/ipccPbQvuH2Eoxfkcm5okjetVNgja9y3O4
   Yuv7aVPpzq6SkGG4AS9RNQcnwTrtqUGfUdXZOgLCgn7Kzg3sFmfAJxjLl
   k3EJ/B7dYOe9K0cfFSYsWkAZ/WM2hA84jkapLK1iJMBdDiaJih/nLcEIN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="24080958"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="24080958"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 16:58:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="35585165"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jan 2024 16:58:51 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTX20-0001V8-2f;
	Sat, 27 Jan 2024 00:58:48 +0000
Date: Sat, 27 Jan 2024 08:58:28 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com, devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org, imx@lists.linux.dev,
	jirislaby@kernel.org, joe@perches.com,
	krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, miquel.raynal@bootlin.com,
	robh@kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v4 5/8] i3c: target: add svc target controller support
Message-ID: <202401270838.wdxHPaAT-lkp@intel.com>
References: <20240123231043.3891847-6-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240123231043.3891847-6-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_165858_380809_E34EFC24 
X-CRM114-Status: GOOD (  13.04  )
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

Hi Frank,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus robh/for-next linus/master v6.8-rc1 next-20240125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/i3c-add-target-mode-support/20240124-071453
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20240123231043.3891847-6-Frank.Li%40nxp.com
patch subject: [PATCH v4 5/8] i3c: target: add svc target controller support
config: i386-buildonly-randconfig-003-20240127 (https://download.01.org/0day-ci/archive/20240127/202401270838.wdxHPaAT-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401270838.wdxHPaAT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401270838.wdxHPaAT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/i3c/master/svc-i3c-target.c:12:0:
   include/linux/i3c/target.h: In function 'i3c_target_ctrl_alloc_request':
   include/linux/i3c/target.h:280:9: error: implicit declaration of function 'kzalloc'; did you mean 'xa_alloc'? [-Werror=implicit-function-declaration]
      req = kzalloc(sizeof(*req), gfp_flags);
            ^~~~~~~
            xa_alloc
>> include/linux/i3c/target.h:280:7: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      req = kzalloc(sizeof(*req), gfp_flags);
          ^
   include/linux/i3c/target.h: In function 'i3c_target_ctrl_free_request':
   include/linux/i3c/target.h:306:3: error: implicit declaration of function 'kfree'; did you mean '__free'? [-Werror=implicit-function-declaration]
      kfree(req);
      ^~~~~
      __free
   In file included from include/linux/resource_ext.h:11:0,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from include/linux/i3c/device.h:13,
                    from drivers/i3c/master/svc-i3c-target.c:24:
   include/linux/slab.h: At top level:
>> include/linux/slab.h:227:6: warning: conflicting types for 'kfree'
    void kfree(const void *objp);
         ^~~~~
   In file included from drivers/i3c/master/svc-i3c-target.c:12:0:
   include/linux/i3c/target.h:306:3: note: previous implicit declaration of 'kfree' was here
      kfree(req);
      ^~~~~
   In file included from include/linux/resource_ext.h:11:0,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from include/linux/i3c/device.h:13,
                    from drivers/i3c/master/svc-i3c-target.c:24:
>> include/linux/slab.h:709:37: error: conflicting types for 'kzalloc'
    static inline __alloc_size(1) void *kzalloc(size_t size, gfp_t flags)
                                        ^~~~~~~
   In file included from drivers/i3c/master/svc-i3c-target.c:12:0:
   include/linux/i3c/target.h:280:9: note: previous implicit declaration of 'kzalloc' was here
      req = kzalloc(sizeof(*req), gfp_flags);
            ^~~~~~~
   cc1: some warnings being treated as errors


vim +280 include/linux/i3c/target.h

ebda81e6094f36 Frank Li 2024-01-23  264  
ebda81e6094f36 Frank Li 2024-01-23  265  /**
ebda81e6094f36 Frank Li 2024-01-23  266   * i3c_target_ctrl_alloc_request() - Alloc an I3C transfer
ebda81e6094f36 Frank Li 2024-01-23  267   * @ctrl: I3C target controller device
ebda81e6094f36 Frank Li 2024-01-23  268   * @gfp_flags: additional gfp flags used when allocating the buffers
ebda81e6094f36 Frank Li 2024-01-23  269   *
ebda81e6094f36 Frank Li 2024-01-23  270   * Returns: Zero for success, or an error code in case of failure
ebda81e6094f36 Frank Li 2024-01-23  271   */
ebda81e6094f36 Frank Li 2024-01-23  272  static inline struct i3c_request *
ebda81e6094f36 Frank Li 2024-01-23  273  i3c_target_ctrl_alloc_request(struct i3c_target_ctrl *ctrl, gfp_t gfp_flags)
ebda81e6094f36 Frank Li 2024-01-23  274  {
ebda81e6094f36 Frank Li 2024-01-23  275  	struct i3c_request *req = NULL;
ebda81e6094f36 Frank Li 2024-01-23  276  
ebda81e6094f36 Frank Li 2024-01-23  277  	if (ctrl && ctrl->ops && ctrl->ops->alloc_request)
ebda81e6094f36 Frank Li 2024-01-23  278  		req = ctrl->ops->alloc_request(ctrl, gfp_flags);
ebda81e6094f36 Frank Li 2024-01-23  279  	else
ebda81e6094f36 Frank Li 2024-01-23 @280  		req = kzalloc(sizeof(*req), gfp_flags);
ebda81e6094f36 Frank Li 2024-01-23  281  
ebda81e6094f36 Frank Li 2024-01-23  282  	if (req)
ebda81e6094f36 Frank Li 2024-01-23  283  		req->ctrl = ctrl;
ebda81e6094f36 Frank Li 2024-01-23  284  
ebda81e6094f36 Frank Li 2024-01-23  285  	return req;
ebda81e6094f36 Frank Li 2024-01-23  286  }
ebda81e6094f36 Frank Li 2024-01-23  287  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
