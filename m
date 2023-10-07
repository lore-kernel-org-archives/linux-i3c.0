Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06118E81E1F
	for <linux-i3c@archiver.kernel.org>; Sat,  7 Oct 2023 05:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5ANugFchIaiOAEYnGjip+UA7RVx26BTdUr7NCeeVA0=; b=WIXv/OHSi3yzcI
	qMkHuLnQSaVHzW/2M6hxPtmVt7Qea6Al24YLTrTtJZqeoSVr0NNz0N4XwRK17mOKCujVkkZcwuJuS
	gKI0L5N3dxhxGLF2xTwhb+G5SFYaVSgGLQ8385aU2VbOQUzOEnP9uD/udP6JNMWMRGrOWeiMwcPUp
	3nTpCqnn1jynL9ya1mBOdgh7soPDOEabQOBBjxf2q2I62IveE/OPxjWCMlUTFMS0zC5azo0HFxTLo
	89oP6gqPwQriZzSJ4Vd+HHO5hmSfa+rSIKrz1mB1MXVVb3ZP8VOHsQ61RcqAejsTRs/uSekiibN+T
	AuEs3pGDMv5MzdcaGu2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp0DM-0071Fs-0q;
	Sat, 07 Oct 2023 05:51:00 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp0DJ-0071EO-13
	for linux-i3c@lists.infradead.org;
	Sat, 07 Oct 2023 05:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696657857; x=1728193857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dkHv+oAcL7tENq1Yd73stD/FY/Ihm49Ba/5lg337PbE=;
  b=Ui2JauOdyJvIkyMau+h8cVWaOEcrqBNSThRbxo2MIduJxoRiPn2WlbvH
   Vu4qXIIUr+hg03ThqCYt3xcQxRhFjRKzBkCBsQmI/Tpeyjq/z2+Crwi6o
   U/gwO3Dc642S6R897sorwY1PB2P3/kgEs4ntB8O/HL+fIjnpXZB94QL6e
   MMfKh4ycoipVF6PkT5q5RlooCXF9vEAbBb1UvukeWCk36nYmllFHpEJtz
   9+zn1axrTSPn4c1ocEU6RBXdOgtWo0lfhFn+A1xrcqHRP4KRzyOwMbBA5
   IavlMoUYrZSJfSdszNDrlqO/XX2mQTmhlrHrDQkovqTKWBKvJnVvszNOx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="368973972"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; 
   d="scan'208";a="368973972"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 22:50:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="822754753"
X-IronPort-AV: E=Sophos;i="6.03,205,1694761200"; 
   d="scan'208";a="822754753"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Oct 2023 22:50:47 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qp0D7-000425-2h;
	Sat, 07 Oct 2023 05:50:45 +0000
Date: Sat, 7 Oct 2023 13:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Johnston <matt@codeconstruct.com.au>,
	linux-i3c@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH net-next v4 3/3] mctp i3c: MCTP I3C driver
Message-ID: <202310071339.iWeOdKQk-lkp@intel.com>
References: <20231004031316.725107-4-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004031316.725107-4-matt@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_225057_413551_5FF37CAE 
X-CRM114-Status: GOOD (  12.32  )
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

Hi Matt,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Johnston/dt-bindings-i3c-Add-mctp-controller-property/20231004-111533
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231004031316.725107-4-matt%40codeconstruct.com.au
patch subject: [PATCH net-next v4 3/3] mctp i3c: MCTP I3C driver
config: x86_64-buildonly-randconfig-005-20231007 (https://download.01.org/0day-ci/archive/20231007/202310071339.iWeOdKQk-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231007/202310071339.iWeOdKQk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310071339.iWeOdKQk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/mctp/mctp-i3c.c:13:0:
>> drivers/net/mctp/mctp-i3c.c:710:12: error: initializer element is not constant
     I3C_CLASS(I3C_DCR_MCTP, NULL),
               ^
   include/linux/i3c/device.h:166:10: note: in definition of macro 'I3C_CLASS'
      .dcr = _dcr,      \
             ^~~~
   drivers/net/mctp/mctp-i3c.c:710:12: note: (near initialization for 'mctp_i3c_ids[0].dcr')
     I3C_CLASS(I3C_DCR_MCTP, NULL),
               ^
   include/linux/i3c/device.h:166:10: note: in definition of macro 'I3C_CLASS'
      .dcr = _dcr,      \
             ^~~~


vim +710 drivers/net/mctp/mctp-i3c.c

   708	
   709	static const struct i3c_device_id mctp_i3c_ids[] = {
 > 710		I3C_CLASS(I3C_DCR_MCTP, NULL),
   711		{ 0 },
   712	};
   713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
