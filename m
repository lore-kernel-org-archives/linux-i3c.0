Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC44C5320E
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Aug 2024 07:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/b0YcfLS2bPzMoP2YmGfCYg/c7FLxhMIUV5E+aGHB1U=; b=xxsj6Yu3TVtrh0
	OS0rjb0z0+KQ9Rq4u5bpP3zs3KDPuuUMiae7TKYULrNdW1boiAKDx8hWWBSQsaf0cUOS5cJ6A4hAH
	KgbKOXWbfDz+OlmKI3tc6slgKF7kYsHpcWbEb45DfrJ612G6sYyEvt0IXFSAwove5TakwXiHEvucP
	nEN3TG+1MP2VZ7sNON/zczG32lfZXli7HtwAHPSXXdnDVi+Ecf+HesMIUDzfPEXnBRT9gX5OGvj4E
	RBMt8aiaUZEp+7VoG6Lfp4vtvE6cp8MuzXzcm31H4+22LegvICAc9uDXt7x2kT4+mvwaix6nu1OoE
	hV0Oi3ez1DKQZhs5BJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siqKD-0000000A9cP-0mr2;
	Tue, 27 Aug 2024 07:09:09 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siqJL-0000000A9Qp-2i6O
	for linux-i3c@lists.infradead.org;
	Tue, 27 Aug 2024 07:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724742496; x=1756278496;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LRxPvwgGH3sUNqy7+5c2xlwgfCwTB41TZWDoqLrb+Bo=;
  b=TiZJflW+vuKtvlKpBeWuajYVghYV7FMy0pCefjW6SEk0BCxO6EkTZAnk
   Xn/0/tAc6e4uLIt2uYKi7/b+cd4bCgidz0uNQOlM2WGwLSN6KccBgCOCV
   BYvkVjmAru0OHKi8bZGhdFJb0T5l6RhmlvtASnqICDXpcORDTcuDTcF8s
   D8Fnjh3MZCsnci4iA/E/lRQTAaZQPcw5uIcqLwpUZd8AZXhWR7jxIvfC8
   8Dugebjj9Zw8el6KHGS2n8+uMQM2z3GaBr1ScUdzKkiWmLOxAreO3U18C
   CbyeGNyUBkM6gJdU1agCXBX2F4bVbDxNb8mAhAhooUppAx8MWxwltMJqG
   w==;
X-CSE-ConnectionGUID: rwq/szDwR66q0YJE4y/sIQ==
X-CSE-MsgGUID: 5hFH5r+sTKy5TOMdylojvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="45718054"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="45718054"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 00:08:11 -0700
X-CSE-ConnectionGUID: CISR3S4HSUWI28EeNw/SiA==
X-CSE-MsgGUID: L9XDac7bSU+Gw1KGwLd/Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="67681020"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa004.jf.intel.com with ESMTP; 27 Aug 2024 00:08:05 -0700
Message-ID: <61f5e4d6-5564-4f51-a586-f1a8693b215d@linux.intel.com>
Date: Tue, 27 Aug 2024 10:08:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] i3c: mipi-i3c-hci: Add a quirk to set PIO mode
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240823141917.692336-1-Shyam-sundar.S-k@amd.com>
 <20240823141917.692336-4-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240823141917.692336-4-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_000815_767092_957D33E8 
X-CRM114-Status: UNSURE (   9.49  )
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

On 8/23/24 5:19 PM, Shyam Sundar S K wrote:
> The AMD HCI controller currently only supports PIO mode but exposes DMA
> rings to the OS, which leads to the controller being configured in DMA
> mode. To address this, add a quirk to avoid configuring the controller in
> DMA mode and default to PIO mode.
> 
> Additionally, introduce a generic quirk infrastructure to the mipi-i3c-hci
> driver to facilitate seamless future quirk additions.
> 
> Co-developed-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
> Signed-off-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
> Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
> Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

>   drivers/i3c/master/mipi-i3c-hci/core.c | 8 +++++++-
>   drivers/i3c/master/mipi-i3c-hci/hci.h  | 1 +
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
