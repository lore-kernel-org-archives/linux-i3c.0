Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1516AC001DF
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 12:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WmCJ1Bm1DmI3sowRW6wOJF2hydA9jRv/pu642AsOVk=; b=oiyV9Dz0BiWIxQ
	OUWNtgQHtJSYdEB29dGErZQdodg6kh/cKYNO1FASBczH613aTmGRf3ahs0AGRwYR+XFxYS6spQzTQ
	I9CQZukCQ6QQlAdG5G2nSOlKzI3RNm4Grlhbvtzfq5XQITSi+erB9FI3VnDaEUV/Ep9z3xtFXmpKx
	5DkUJmXYgd9T07qUgJAjZ+1MvLqzar/ijt+2vHsPqcnvYDrkM5XGAk5G8QaEe++lvrB7SxvSe+lIo
	OWcdeUMyAdT9hKGg6sQ3etBqML8vQtIwZhhShzFC00LNndrSF5TlOrO/EwvLSBp7im2AZnGsrFMdr
	+0bm8pXPRUBN9ZTxeUWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtoDl-002Cuw-11;
	Fri, 20 Oct 2023 12:03:17 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtoDi-002Cta-1M
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 12:03:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697803394; x=1729339394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a0cCePIIEGKptYoyh7Pp+IV6nY/vFaOdAf4qBUS5Nws=;
  b=MzT+K88wd7m3RJ/hZKaN/ZTWaAyDzlJX/nr7snbKDczkYh2QtjQAZslh
   HcisdV4nocGmAc2mcynfruXhL9V+ljZJ/v9sB3uGEMO2qz62itRv5CNsN
   rxvCo/PA3PTWpQxoItJl/KaZzgKXA5iK1cebHN6/RTkl7ihcQXjbbH+WU
   YmX2BQ27M38X3qBXnrvX2PPmXYeXxzlgpts2oV28uEQIdW/QO5hcXClCH
   wIEH2YLAqkHFfkFv/5xnzV3YVie/qxwkMfttxofxBu5hNWu8jr+PCSQI+
   6mlUkjnUB9Fr9RpitlfEdoOrKxS4mrm35MOVi7kDKoYu4wpTj9MI4oK68
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="452962004"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="452962004"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 05:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="901123585"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="901123585"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Oct 2023 05:00:58 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtoDZ-0003Uk-22;
	Fri, 20 Oct 2023 12:03:05 +0000
Date: Fri, 20 Oct 2023 20:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com, imx@lists.linux.dev, joe@perches.com,
	linux-i3c@lists.infradead.org, miquel.raynal@bootlin.com
Subject: Re: [PATCH 1/1] tty: i3c: add tty over i3c master support
Message-ID: <202310201933.9lZn2Ebl-lkp@intel.com>
References: <20231018211111.3437929-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231018211111.3437929-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_050314_514402_5D583EF6 
X-CRM114-Status: GOOD (  13.36  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus linus/master v6.6-rc6 next-20231019]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/tty-i3c-add-tty-over-i3c-master-support/20231019-051407
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231018211111.3437929-1-Frank.Li%40nxp.com
patch subject: [PATCH 1/1] tty: i3c: add tty over i3c master support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310201933.9lZn2Ebl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201933.9lZn2Ebl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201933.9lZn2Ebl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/i3c_tty.c: In function 'tty_i3c_rxwork':
   drivers/tty/i3c_tty.c:265:26: error: 'struct i3c_priv_xfer' has no member named 'actual_len'
     265 |                 if (xfers.actual_len) {
         |                          ^
   drivers/tty/i3c_tty.c:266:82: error: 'struct i3c_priv_xfer' has no member named 'actual_len'
     266 |                         tty_insert_flip_string(&sport->port, sport->buffer, xfers.actual_len);
         |                                                                                  ^
   drivers/tty/i3c_tty.c:271:25: error: implicit declaration of function 'i3c_device_getstatus_format1' [-Werror=implicit-function-declaration]
     271 |                         i3c_device_getstatus_format1(sport->i3cdev, &status);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/i3c_tty.c: At top level:
>> drivers/tty/i3c_tty.c:400:6: warning: no previous prototype for 'i3c_remove' [-Wmissing-prototypes]
     400 | void i3c_remove(struct i3c_device *dev)
         |      ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/i3c_remove +400 drivers/tty/i3c_tty.c

   399	
 > 400	void i3c_remove(struct i3c_device *dev)
   401	{
   402		struct ttyi3c_port *sport = dev_get_drvdata(&dev->dev);
   403	
   404		tty_port_unregister_device(&sport->port, i3c_tty_driver, sport->minor);
   405		cancel_work_sync(&sport->txwork);
   406		destroy_workqueue(sport->workqueue);
   407	}
   408	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
