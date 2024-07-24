Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F55C3DA63
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jul 2024 02:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cB7V76VmHLQ1XMBXyS0EgiV9Qw0Sxq6a2Bgp1d2uRgQ=; b=I4Ep9oZsqsJ4/G
	qtrSekqAptqEvgMQm932pYrXFrraajfJ4DDTBD4YL2890kr3KAVAMgAsNy7obbw9aaQrhYP8+WWE7
	TTgpYKQH3YVIHcwk8F+PQDMT9P7xiTAVrFn/5lHx6QT1apw5zzn6SGENNM/1PEkVd2JXiRo9EZFwt
	RkTRj2jEs43NtiYUcDI6hExijPO+tjIL105ujZXKiZ1JtOl0xnsEdPWspa+bDPFGskUMjbqAtrSr1
	fZ1iF0iA8Yp8v6UlDFsdCTQQ9tun8KYm2SlKUKahL7oMwVmpkkkPqTs9km2HVrFmis1mOiEKy+4Mx
	vK+mpY4IjfIAG6WRIxvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWRxA-0000000EAPR-1sfo;
	Wed, 24 Jul 2024 02:42:08 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWRx7-0000000EAOh-44sB
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jul 2024 02:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721788926; x=1753324926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jz6b+V0sp/QHCbI8lkUIWgxo8QZ3onL7lWJZDxQp45w=;
  b=PMe3AtUJtzI9VNEDimQa8HRct0UW1v0jHLv3VyADc+oGZbJJ3nfuQata
   y95CSQAGdObFfkM4uyv/trngQH60CV9oaGjQaw3F7LsA+aJBxDIUI8UNV
   87RwiNlomqWqGJr0bEfLsr42x5hy4KJPGnDHIAOZ5Yow5oHjx9+yBuWy2
   j4WBYqYXanLRSDlzcwdPI3Sb/NwUoOCewKpFNFnA9Me6qYfln1VZVYwov
   pUN2oIrVfqEYIn9u9EquN/uDhE71q/K9ULfrvfH0ab+q4c2K4q7UIuNx3
   IDQ7dd41sELnl+fyTi7RZxnG+WDfXx9EOSAEqnWPKgNNxAQT3kGCAP/Jl
   Q==;
X-CSE-ConnectionGUID: UpeSi9afQCeyiIfpFCTeEQ==
X-CSE-MsgGUID: q9uftnkzSZqSEZOJV86glg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19139074"
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="19139074"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 19:42:05 -0700
X-CSE-ConnectionGUID: oAqvGr1CQJCN1qNZUUJqvA==
X-CSE-MsgGUID: NqCRA05dT6OJOGwJhwh1Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,232,1716274800"; 
   d="scan'208";a="52460857"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Jul 2024 19:42:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWRx1-000ma6-2v;
	Wed, 24 Jul 2024 02:41:59 +0000
Date: Wed, 24 Jul 2024 10:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 4/5] i3c: mipi-i3c-hci: Add a quirk to set timing
 parameters
Message-ID: <202407241020.dsJauFym-lkp@intel.com>
References: <20240723173538.3493935-5-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240723173538.3493935-5-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_194206_046592_AA44E6B5 
X-CRM114-Status: GOOD (  14.08  )
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
[also build test ERROR on v6.10 next-20240723]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Sundar-S-K/i3c-mipi-i3c-hci-Add-MIPI0100-ACPI-ID-to-the-I3C-Support-List/20240724-013958
base:   linus/master
patch link:    https://lore.kernel.org/r/20240723173538.3493935-5-Shyam-sundar.S-k%40amd.com
patch subject: [PATCH 4/5] i3c: mipi-i3c-hci: Add a quirk to set timing parameters
config: arm-randconfig-004-20240724 (https://download.01.org/0day-ci/archive/20240724/202407241020.dsJauFym-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407241020.dsJauFym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407241020.dsJauFym-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i3c/master/mipi-i3c-hci/hci_quirks.c: In function 'amd_i3c_hci_quirks_init':
>> drivers/i3c/master/mipi-i3c-hci/hci_quirks.c:25:13: error: 'boot_cpu_data' undeclared (first use in this function)
      25 |         if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD) {
         |             ^~~~~~~~~~~~~
   drivers/i3c/master/mipi-i3c-hci/hci_quirks.c:25:13: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/i3c/master/mipi-i3c-hci/hci_quirks.c:25:41: error: 'X86_VENDOR_AMD' undeclared (first use in this function); did you mean 'X86_VENDOR_ANY'?
      25 |         if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD) {
         |                                         ^~~~~~~~~~~~~~
         |                                         X86_VENDOR_ANY


vim +/boot_cpu_data +25 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c

    22	
    23	void amd_i3c_hci_quirks_init(struct i3c_hci *hci)
    24	{
  > 25		if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD) {
    26			hci->quirks |= HCI_QUIRK_AMD_PIO_MODE;
    27			hci->quirks |= HCI_QUIRK_AMD_OD_PP_TIMING;
    28		}
    29	}
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
