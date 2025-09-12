Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CA3CA101F
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Sep 2025 07:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkyYvuA5tqQu2nKfa1YmoqIf5klVROdZgWtIHO/97O8=; b=l+zzD75T0tmGhA
	UJVNuUeZUUozcgX9xA6tmkoHZcGsJEcVTrvHmd1IN8WtdELK9RgIwfyW7png8bgHiArS+Pv2klDiU
	3I3Vg7Ly4on9VVCSbv3bEcqdTOpEqs+vDEh0iheqhdpdvQTT6GYcYeg2dWB5fZO5TCnKWrI36iq3E
	Zv9f4e3Xzot48Hj1/MdtBDsgtxD6Dkw2EAaSnn7eU6wUUHZ7/GoIIR6GW0AFuiA4x4+7oEJfUuhw/
	BxfeAxkPdDV/+4essPAS4mBCEuwLj2EPKJDBE8TCiXmBP4yJfxCLFZufBvHsmU1Dj86cTLrsKxXMX
	zmgXVPUFbmKufc5zOvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyAJ-00000007dcM-3gjZ;
	Fri, 12 Sep 2025 07:25:51 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwyAH-00000007dbS-1Q41
	for linux-i3c@lists.infradead.org;
	Fri, 12 Sep 2025 07:25:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757661950; x=1789197950;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fYg5a9tv9GgNXC/pL6zjH+Lmtw4wBZht3NK1mwmHYIM=;
  b=S8Tfj0TuWW+F9wPKIlSiYySUUKtIhhA686iCmm0rAZpW/N30JYI4rqjM
   kqoETBB2+t7Pr+GdI0RAiaB+Ojni/74jEMEqeqHD4fwo3fupDM2npGh64
   +c6klhqzRlihHscxNBqFPnrSD4EJ7NU+IIWwB4opFk9vhRUuqFsmwi86y
   +4poFE4cPqWPvaCtt2mVH8CQMrux8iB158McsxN7CgsRsXJXIzUamH1nP
   g7ue3YDBQ3lQBoOmejS8qIc2DbOMIhQqIw8uOgqRuSXEKml48op9uQTUi
   WnnZhLKTAOyqnu6ua5n40NctGSCAwbJpBbGk2DiVGO5EyO9QRCRX2RGyz
   g==;
X-CSE-ConnectionGUID: 5Cey/o2FR9WhddHAPQnRSg==
X-CSE-MsgGUID: 6AI8w5YLRh+DStgoDffUDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="63634624"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="63634624"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 00:25:49 -0700
X-CSE-ConnectionGUID: fL/t5BmGRtSJCNQeBq+bzA==
X-CSE-MsgGUID: izf+ifIlT6aFYCuqvc3AOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="173193514"
Received: from mylly.fi.intel.com (HELO [10.237.72.52]) ([10.237.72.52])
  by orviesa010.jf.intel.com with ESMTP; 12 Sep 2025 00:25:47 -0700
Message-ID: <9f95707c-08d7-4985-b9b6-2161cf60059e@linux.intel.com>
Date: Fri, 12 Sep 2025 10:25:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] i3c: mipi-i3c-hci: Convert DBG() prints to dev_dbg()
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>
References: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_002549_420891_39AC9F35 
X-CRM114-Status: UNSURE (   7.02  )
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

On 8/27/25 1:30 PM, Jarkko Nikula wrote:
> Hi
> 
> A recent error report and reporter's difficulties to enable interrupt
> status prints motivated me to (finally) convert all local DBG() prints
> to dev_dbg().
> 
> Jarkko Nikula (5):
>    i3c: mipi-i3c-hci: Change interrupt status prints to dev_dbg()
>    i3c: mipi-i3c-hci: Remove nonexistent ring interrupt
>    i3c: mipi-i3c-hci: Uniform ring number printouts
>    i3c: mipi-i3c-hci: Remove function enter DBG() printouts
>    i3c: mipi-i3c-hci: Convert remaining DBG() prints to dev_dbg()
> 
>   drivers/i3c/master/mipi-i3c-hci/cmd_v1.c   |  9 ++-
>   drivers/i3c/master/mipi-i3c-hci/cmd_v2.c   |  7 ++-
>   drivers/i3c/master/mipi-i3c-hci/core.c     | 34 +++-------
>   drivers/i3c/master/mipi-i3c-hci/dma.c      | 27 ++++----
>   drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 11 ++--
>   drivers/i3c/master/mipi-i3c-hci/hci.h      |  3 -
>   drivers/i3c/master/mipi-i3c-hci/pio.c      | 73 +++++++++++++---------
>   7 files changed, 81 insertions(+), 83 deletions(-)
> 
Hi Frank, was this set ok in your point of view?

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
