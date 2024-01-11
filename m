Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79ECC4707B
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Jan 2024 23:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bejwHDwF/CwlkM9iZfbL7oJr1xyA33nsQ0Xm92kInrs=; b=jyVxekZ3LVRWhv
	Fkz2r9Em0Iu09JC0OJJnOtXirLlHuwnaQJn3w0tHAEe5+IrJftQRvWO3OgXdwyQPExxsx4pgctNG+
	DKQmBXeoEYqy24OSOEift+sMW1nY4qaKKHUZeHDiNXWedSOHk0oUDUEle9zIi/h8nMucs9W1HSdYn
	7c24j+O5GrqxDkufOCpuuvjerSR/2ZtLWN1SplDhVUvIrbZAMlYxj/xR9uUpOre88EGA2yzsQLNrZ
	kjkAM7IeVn803x3tKK+stjSId02mJrLiK9o+UfsRW5VhGtsgszy3ndUQkHfXYO5OzViKodf+B6Iu0
	oU5UmRNKXeGUZJ3nii6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO4l7-001TfE-3C;
	Thu, 11 Jan 2024 23:46:49 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO4l5-001Tep-1G
	for linux-i3c@lists.infradead.org;
	Thu, 11 Jan 2024 23:46:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705016807; x=1736552807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tDQ+Y25+9tjVLydR7nv5+2kZe3IxdEqqQlgXmpvEyYk=;
  b=YfCh/zIr4BSuq/DREp1bN/5li/yueQesotdrfvccTIxhYU/yEvfTTqt+
   YIFDaeOSu1EPflBeQxUaVjimniwHenTQM9RoEHa04Tk+e/XhcW7lnIWOY
   6HY4EpRwBH3SjamSgFzoJDIUPrpf8wkXBiCuzKs39kv6RuvvA1/0DL9Qi
   O0PP9ATiqlxJhV+u/AvjoVpSLWSrlbxeG7Vf70iCJ/8KHva2pMxqmjR63
   M9tu/lDcY0507EV1lqiGOY3/gafm5Vda5wW4502Uaqew2mPpxY9UoA5TG
   Z0oU5qbCVqUqXuFzMtPEoplKhpjWGQ8pzegfAiWhTBnlYtr69u9TJpLXr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="20500693"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="20500693"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 15:46:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="17208593"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Jan 2024 15:46:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rO4kR-0008rG-0N;
	Thu, 11 Jan 2024 23:46:07 +0000
Date: Fri, 12 Jan 2024 07:45:07 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>, robh@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com, gregkh@linuxfoundation.org,
	imx@lists.linux.dev, jirislaby@kernel.org, joe@perches.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, miquel.raynal@bootlin.com,
	zbigniew.lukwinski@linux.intel.com, devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v2 3/7] Documentation: i3c: Add I3C target mode
 controller and function
Message-ID: <202401120713.p7a3HyFl-lkp@intel.com>
References: <20240110175221.2335480-4-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240110175221.2335480-4-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_154647_464926_884F90A0 
X-CRM114-Status: GOOD (  11.91  )
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
[also build test WARNING on tty/tty-next tty/tty-linus robh/for-next linus/master v6.7 next-20240111]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/i3c-add-target-mode-support/20240111-015711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20240110175221.2335480-4-Frank.Li%40nxp.com
patch subject: [PATCH v2 3/7] Documentation: i3c: Add I3C target mode controller and function
reproduce: (https://download.01.org/0day-ci/archive/20240112/202401120713.p7a3HyFl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401120713.p7a3HyFl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/driver-api/i3c/target/i3c-target-cfs.rst references a file that doesn't exist: Documentation/I3C/target/pci-target.rst
>> Documentation/driver-api/i3c/target/i3c-target.rst:38: WARNING: Title underline too short.
>> Documentation/driver-api/i3c/target/i3c-target-cfs.rst:73: WARNING: Title underline too short.
>> Documentation/driver-api/i3c/target/i3c-tty-howto.rst:45: WARNING: Title underline too short.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
