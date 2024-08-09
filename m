Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649B4C52D7C
	for <linux-i3c@archiver.kernel.org>; Fri,  9 Aug 2024 13:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFAbvjlaqbOiJlKEBaTMK9Y7kypTQhKSPBdBMjYWz2I=; b=oWjHIDpNOZgQJJ
	2I6cA+4bjBRrfhlnSj7o9k2oCKj0xwmPaWSX5k+4XAopyAF2EobKaON7RQ0iXZt8KxRobBVJAT3D4
	wa9Zik4DGAuza1FJ09aFcm6J7CgGT8QjFc74bG6uZewy6lNQ6bRIXfTe/KrJENX2TGy551VTRuzgb
	zDYHbvJkey4UrZkZZxtBRChp2Qtq6l/76slnAVSjfCLpuji7FdJqeig6fpp/0yJuAm/hFkjDjtVzC
	zkPbgSIWUSQjfVf7i3Z/0BxUqJb8zRrThBsg9IFU/4BGZOrgmyuHCcjYgcHSW2AfVUmIaFMzIu0SD
	NIEW0N61KPRQV3zQ3XHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scPZ2-0000000BJeY-0UsU;
	Fri, 09 Aug 2024 13:21:52 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scPYz-0000000BJe4-2P92
	for linux-i3c@lists.infradead.org;
	Fri, 09 Aug 2024 13:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723209709; x=1754745709;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TvNTOB1HAdlyewJxARdqizVcew5pentezXVbEbwtJjA=;
  b=HWYU0oC4BzXm3/W5kA567XjpUDwGRvKgB2MByd6bGzEVkWa+nToGdbTj
   3XATy+wiUk8F2puNSlHtxIbn4peUiC7T5klB+1UnBh+NoNrzFvCUjcV0W
   Op5z2R7yoptd8HYwVB8AWJ6GRVjAjwslnfwcmfKrNb+mFD4ZCEyenwekv
   aCA6WJOunY/Kn5NMTUprAmqeWcDahJ9+kPlcsD8vujZBMlAtNi8bVcIgA
   m/mwRjeMIDPSd8AmYGhZYpDun4gNIeExtHwGtwX0rhZORHQVy/OQMN4m+
   s7pw7psMu/iyKH5beR7AMct8namnRkz4WVzOD1zPNSpUwZ8Zb5OnYb/7S
   Q==;
X-CSE-ConnectionGUID: 6yUbcBwPSxiV/m1WA3WxBg==
X-CSE-MsgGUID: ZnqfVONvRveqe78ujeR+GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21534262"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="21534262"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 06:21:49 -0700
X-CSE-ConnectionGUID: nPGcVCpUS2G2mwpirOyZYw==
X-CSE-MsgGUID: IoZ+H990TyendS6CA/mgpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="80799582"
Received: from unknown (HELO [10.237.72.57]) ([10.237.72.57])
  by fmviesa002.fm.intel.com with ESMTP; 09 Aug 2024 06:21:47 -0700
Message-ID: <9e8b9a98-a61f-4a75-8869-fdc674cce7c1@linux.intel.com>
Date: Fri, 9 Aug 2024 16:21:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 4/6] i3c: mipi-i3c-hci: Relocate helper macros
 to HCI header file
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
 <20240807052359.290046-5-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240807052359.290046-5-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_062149_695725_C37870F7 
X-CRM114-Status: UNSURE (   7.40  )
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

On 8/7/24 8:23 AM, Shyam Sundar S K wrote:
> The reg_* helper macros are currently limited to core.c. Moving them to
> hci.h will allow their functionality to be utilized in other files outside
> of core.c.
> 
> Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
> Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/core.c | 6 ------
>   drivers/i3c/master/mipi-i3c-hci/hci.h  | 5 +++++
>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
