Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3581AC52D7C
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 10:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3c7tppmYdvXqUZMyFQcUF6zHEknVhS44d+yoZsjE94=; b=0itseabvI9++j5
	VBgS2SauzaZl3mxLoJNtIhgXNugY9BJuIRA81ajYouqjyHxHnQkF5SIlH/NAMoXYRM8M7Dp+tjvjN
	6yd0uHlFun2uOVeMc9yZqMA/dDenXCBdMi/twQd8s/SetJ45f+wDeU+8qnX40uqLn5VeSSGm025p2
	HILzz+afV1TKpIc2riqw1JEkaJXCfG0NZSPJuyjLrXX1fQahGTCa88b5H2iOEqJRTGikBaq+2a6GG
	pXyy4KxkKHKYkZulcNzuT1Y8h3tCQj9DjmYg7j8qdRdEfRMMtx/ebKF6yynHkgJpHqcqB4BqMYJu6
	4tn0rH5pyj+z+FPI4OLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shRGC-0000000GGAi-3hZa;
	Fri, 23 Aug 2024 10:11:12 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shRG9-0000000GG9G-3JTc
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 10:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724407870; x=1755943870;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QpcuazOnyseJ5P/75JZGJzYJIZkjK3slrOjOLNMHRNs=;
  b=fU2Txd61y2RhKnc8QSx8lchPU09zN0AHw268Aue97/znEo4xa4gLoTgf
   RkKucMSzALgWg9dJJjJxxTrNdN1Q0+JdbbauCX8C7LQtiuVqTUpOkp1va
   IKEfiY6oF4qolLIyAgiLEhDNDrsU3rv5GsFY+ukiMdT9e88kKiRnl2AU0
   SnouodEZdy1ZxbW+tT6TV9z99jKhmjbCwaGFJz72zirpgTi3QNbEssC7Q
   9aISNdpaPWZRinRrhoPrEGcX5wZSIISbhyH45Ij9CM8XkAKiEV6uT708k
   H6uz9pRr/hpelWQ3eupAlz//5WnfPa8HykjX6iRqmnhvRt7nI+U81EOj5
   g==;
X-CSE-ConnectionGUID: RnOGXm4/SnKPl3R3WtAbgQ==
X-CSE-MsgGUID: o73PfFYjTwGZGdXWLxndlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40383828"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="40383828"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 03:11:10 -0700
X-CSE-ConnectionGUID: zUmtfBfnSdKz9AUiOW87fQ==
X-CSE-MsgGUID: Aux2LsAWTdiaA7cLk17DHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="61758366"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by fmviesa008.fm.intel.com with ESMTP; 23 Aug 2024 03:11:08 -0700
Message-ID: <9cc7f7a1-72b5-42fd-b5eb-6cd1cf59f3e7@linux.intel.com>
Date: Fri, 23 Aug 2024 13:11:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] i3c: mipi-i3c-hci: Add a quirk to set timing
 parameters
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
 <20240821133554.391937-6-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240821133554.391937-6-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_031109_913932_6E678B5C 
X-CRM114-Status: UNSURE (   8.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 8/21/24 4:35 PM, Shyam Sundar S K wrote:
> The AMD HCI controller is currently unstable at 12.5 MHz. To address this,
> a quirk is added to configure the clock rate to 9 MHz as a workaround,
> with proportional adjustments to the Open-Drain (OD) and Push-Pull (PP)
> values.
> 
> Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
> Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/Makefile     |  3 +-
>   drivers/i3c/master/mipi-i3c-hci/core.c       |  6 +++-
>   drivers/i3c/master/mipi-i3c-hci/hci.h        |  2 ++
>   drivers/i3c/master/mipi-i3c-hci/hci_quirks.c | 33 ++++++++++++++++++++
>   4 files changed, 42 insertions(+), 2 deletions(-)
>   create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks.c
> 
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
