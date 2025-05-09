Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A079FC3ABBC
	for <linux-i3c@archiver.kernel.org>; Fri,  9 May 2025 08:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=intR4rye5wngJRxq7y++3bVGq8d1/n0e8l7tZzva73M=; b=VTgjLrinXoZ7cS
	TpRjU/BI7Uv5SsFzkvFS/sNqRAClmXO7dIjEGrua24Gxq7BKTCzsnKMUsZjxFzqpJ/NltBvaOFqNZ
	MhFbUcxMz+uhH5F40y2Gx2CLiRSqNZrvFlkVXXo95zvvMF5OijRy/rbZYg/ex8cwtSBngE8eu0S7k
	pKxHiQv+gbEEJsEE+clvv8Nk0Hfhy3n32Zw41K5DwNY/cpUKa1gOv2hDElKQN5YL7j6UpcMleb9to
	3g/I2GZgQrWJrvv9mnbqrOOhyFHXIGca5eN7Kp1RtxN8JOtfovwFMg7s/Vq4ErChT+qTdlTGsr5Oh
	FQxiMU5xFlkCYK3RSDxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJYU-000000030kO-1Jm4;
	Fri, 09 May 2025 08:58:06 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIon-00000002sTa-1f62
	for linux-i3c@lists.infradead.org;
	Fri, 09 May 2025 08:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746778253; x=1778314253;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2DNmR+TH1qCCjaE1/SbrS25VNh8cE1emAmNfpETHcGI=;
  b=EyS57SUMDyldbnH8Ox0/EPOO3YLPmnFeH63MhTvgKxG4iNpvAySeuV4Q
   iXsrrYLfqHzx+3JvzlWnvBgA+SRw9+KTy8k5XREXxXPUal2g6bWwwVoi9
   DSrk9pgUfK06Y95n/sOnp5bkG3Q5Clmra2j9m+oOoTfM0EkfCaoRVZDVd
   UJd45eScNyMUzGzWASX/gFNRiuKwWf+Mh31N4Of0Ifdx6Mr1E2ikg6U9D
   4AJVCPlM7QvHFa1fxjyvSQBH2mlHxqSY7qARvNurd5ILh2gX/AodVAyLf
   1mA8ndtbVaRbNDPLnD2Gp+tO+Ex4eFHKCHks9FvmP3o6hJhwKKX6wW5wo
   A==;
X-CSE-ConnectionGUID: T5o3R+qcQOm+UrtLWXM6PQ==
X-CSE-MsgGUID: eTcETWw6R06oMP64qwEJ9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59259374"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="59259374"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 01:10:47 -0700
X-CSE-ConnectionGUID: fP9FKv08S2SiqoXFGLqCkA==
X-CSE-MsgGUID: 6yFUYbK6SJqE5Q0LoR/IYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141325389"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 May 2025 01:10:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDIob-000Bo7-1E;
	Fri, 09 May 2025 08:10:41 +0000
Date: Fri, 9 May 2025 16:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com,
	Frank.Li@nxp.com, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Message-ID: <202505091515.KKkEYL9A-lkp@intel.com>
References: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_011053_471847_FD750B2E 
X-CRM114-Status: GOOD (  11.46  )
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

Hi Aman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15-rc5 next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/drivers-i3c-Add-driver-for-NXP-P3H2x4x-i3c-hub-device/20250508-125929
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250508045711.2810207-1-aman.kumarpandey%40nxp.com
patch subject: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
reproduce: (https://download.01.org/0day-ci/archive/20250509/202505091515.KKkEYL9A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091515.KKkEYL9A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1801: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'htmldocs' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
