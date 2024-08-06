Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B06C52D6F
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Aug 2024 23:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krhQDw2o/5I6dE4U56mgjQs97UX1zylHcs4AHgVbY6Y=; b=mkHtRiXNW1kvmx
	lnjdyLD1DR3ELW4uKiSDhyB9M3WaMwwm634BNfqXr6t2kCifQDRG3sYpsQroM+R6Bzl6EksjYlW+6
	E/yUMtIWo5TVbkDCbuyJhzS1jqtNaQwj85fGvJhfnNaOZaPcNeAvu8+FpjXkceOi5lv62yJgw9I7O
	kClQgAVfJ4vDx/n4pOFlMmMHZ8yz+eETVz7GeACANKTSbEsecFLDqv1k/egRUyx2zOSZmDnsUPsUF
	Z727GXgjlom4nLcO8R+3S94qyyYqZUfiFo7FeVh+cQAKdIdz1cVcxNtdB0aKU6dOzsU6sit70aUy0
	AaLpLYdWAPttW3lSyEAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbTkd-00000003LKW-0jJ5;
	Tue, 06 Aug 2024 23:37:59 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbTkZ-00000003LJq-3Jvl
	for linux-i3c@lists.infradead.org;
	Tue, 06 Aug 2024 23:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722987476; x=1754523476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QQem/7ix+rF/krZnyfwpRhr5WE3PESIoqQ4YBeS/Eww=;
  b=V/yBYIXyYz6Mzkb6oxmqtTclwqKlpDW15bfRKMoCFQo98VDCuLNdZdQ5
   zoDcv8tQUc3mdAGBWLAjbTw/Nm7afwhpnkPr5lY+80rDMgr8TQj3uoHfq
   1AstmgTO2aYyEOINzagYxKCFEsCbqlHY+lIoI3XqMd6n97UCSP8Q027xN
   9vbsTKcdH4IDxDUHETZoppYvJsWS2xqsa51Ql1bnlVHrCTz7rNgrhAPSe
   IFzSkHb824pjHaCpPH5VnXa5lfs3LIGrDSUGQXrZ8F5NrQH0R8RfAgBji
   BYQ3yjbQeqj7pUSQfJHpT2pu4agxadUS0DsEc+NFbQmvDCM0qAqWx6sY0
   g==;
X-CSE-ConnectionGUID: y/eE3LPoSdKAjcY9F7dQkQ==
X-CSE-MsgGUID: A5T16uRJRmW4y5GY7ib9iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="32184580"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="32184580"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 16:37:51 -0700
X-CSE-ConnectionGUID: Dr4ab4qVQOWNW6dInnPB8g==
X-CSE-MsgGUID: +XelNfyLS5Kc7TPHq7rDYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="87606859"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 06 Aug 2024 16:37:48 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbTkN-0004ui-0S;
	Tue, 06 Aug 2024 23:37:44 +0000
Date: Wed, 7 Aug 2024 07:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v3 1/5] i3c: mipi-i3c-hci: Add MIPI0100 ACPI ID to the
 I3C Support List
Message-ID: <202408070758.Twn4OAwy-lkp@intel.com>
References: <20240806075843.277969-2-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240806075843.277969-2-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_163755_923732_2DDC336E 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

Hi Shyam,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc2 next-20240806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/i3c-mipi-i3c-hci-Add-MIPI0100-ACPI-ID-to-the-I3C-Support-List/20240806-165640
base:   linus/master
patch link:    https://lore.kernel.org/r/20240806075843.277969-2-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH v3 1/5] i3c: mipi-i3c-hci: Add MIPI0100 ACPI ID to the I3C Support List
config: hexagon-randconfig-001-20240806 (https://download.01.org/0day-ci/archive/20240807/202408070758.Twn4OAwy-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070758.Twn4OAwy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408070758.Twn4OAwy-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
>> ERROR: modpost: drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci: sizeof(struct platform_device_id)=24 is not a modulo of the size of section __mod_platform__<identifier>_device_table=56.
>> Fix definition of struct platform_device_id in mod_devicetable.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
