Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620E0C5AE59
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Jun 2025 05:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/J3exa5+yYf81XNnkD396/vQYl2ngcwIacHIo+dI08=; b=gaV/BWx9K+G63N
	t06ah+cfloTGef7nbr21r28xCWFLFu4LHa5a2W2JsflQaN1mXoa9nRY7ZfOJ0w7EjCnQTYRVB6s9Y
	Tf++PWksVv+dddDYoBCAfy/0vPnW2uh25U4vHvWLSLO9wNbDeFKEnNx/WZeN5AP4wix+XjZKift/g
	k0pA+TXHwn9RQ1Kz+YDA4QAztXAOKacugSLJGG22zVarSr//yXXa7989DPbvqu0ZCileKTqaT+tcu
	LxzHKHW+QNF8zLv30uLS5VstCNk1mAGZhResrudePCtcj6JXzL7KQpoUtQGN/vzIGVNQo5Tdj1i0g
	90XioPk8muE6UUVX2E3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN2tu-0000000Ek4O-4A46;
	Thu, 05 Jun 2025 05:12:26 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN2ts-0000000Ek3y-3DBV
	for linux-i3c@lists.infradead.org;
	Thu, 05 Jun 2025 05:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749100345; x=1780636345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cojmq5Bw19bcv4D8O2BvzUtCCdxSCkh1++xIikVWjiQ=;
  b=QjWyG0mSMR0WG1KenB/OQMTM/OWtJRIR0jjV96HoJ1N7E5upQ6zSvw3F
   4Rc+mUhgMXeaa9opcGVrx1gJnXlmRESdGpSiHYVeR3gwIXqW/eCx7ZF5w
   3btO0J6eurxAon0CWfVx67GAr93nPEgvD/643ZWZKR4H4Ct06oV+ZPpp4
   MmsYGwcuWURelrG1hF3HcWHUhNrLkifdo/ac+nagfIdDqtpJ6rGUx4/sS
   QqkT4P3cXeNdBYma+PbbFrGSiNFr/523Uhj0svA/Y5pQWQnm+oOczmZYg
   iIqiFT+p7mJg7Zieihob1z373KWu2eaOUXdAQsFefHrwzGkKLygrgZbw0
   g==;
X-CSE-ConnectionGUID: qenbf/tuRLWZy5nKelBD7A==
X-CSE-MsgGUID: VFL02RdCQEyfnzchtKWPaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68754327"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="68754327"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 22:12:18 -0700
X-CSE-ConnectionGUID: pP3Otw1VR0Op+zdYIbAlJQ==
X-CSE-MsgGUID: K9klzGtHRqiTQbrzEuROdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="149232736"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jun 2025 22:12:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN2th-0003kP-1q;
	Thu, 05 Jun 2025 05:12:13 +0000
Date: Thu, 5 Jun 2025 13:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>
Subject: Re: [PATCH 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <202506051224.6jLJ0AOh-lkp@intel.com>
References: <20250604-adi-i3c-master-v1-2-0488e80dafcb@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250604-adi-i3c-master-v1-2-0488e80dafcb@analog.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_221224_820003_44AD1540 
X-CRM114-Status: UNSURE (   9.18  )
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

Hi Jorge,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 00286d7d643d3c98e48d9cc3a9f471b37154f462]

url:    https://github.com/intel-lab-lkp/linux/commits/Jorge-Marques/dt-bindings-i3c-Add-adi-i3c-master/20250604-235108
base:   00286d7d643d3c98e48d9cc3a9f471b37154f462
patch link:    https://lore.kernel.org/r/20250604-adi-i3c-master-v1-2-0488e80dafcb%40analog.com
patch subject: [PATCH 2/2] i3c: master: Add driver for Analog Devices I3C Controller IP
config: alpha-randconfig-r111-20250605 (https://download.01.org/0day-ci/archive/20250605/202506051224.6jLJ0AOh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250605/202506051224.6jLJ0AOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051224.6jLJ0AOh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i3c/master/adi-i3c-master.c:768:28: sparse: sparse: dubious: x | !y

vim +768 drivers/i3c/master/adi-i3c-master.c

   759	
   760	static void adi_i3c_master_handle_da_req(struct adi_i3c_master *master)
   761	{
   762		u8 payload0[8];
   763		u32 addr;
   764	
   765		/* Clear device characteristics */
   766		adi_i3c_master_rd_from_rx_fifo(master, payload0, 6);
   767		addr = master->daa.addrs[master->daa.index++];
 > 768		addr = (addr << 1) | !parity8(addr);
   769	
   770		writel(addr, master->regs + REG_SDO_FIFO);
   771	}
   772	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
