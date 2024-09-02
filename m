Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D391CD13CF
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Sep 2024 06:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkPTuN2qx61DEMXEU5RAFLpj9f3Bf1Yr0ZAQAYSdqbo=; b=0cPMxQ6eF9fIku
	6iEfYy80DcRTH+nx4/0BrzgS3S/3nf+2c61VtG2x2WVYOoS9Tc0tGLSapwdiMHZJNc3DtVf2tG3sq
	UMm7CafUTdOO6JLgh9Pf89xE7f2L93kYpLfdrlzapkX1wMCkQlFCg06ajI/fKg3W4v7QNoK36iSpn
	W4B/r4sVSPywqJ7bD80dLUV7Y4td6x433vCni3jDUT5R4xiN38zkhSrW6z/fq68O+FInd2NDN6Isl
	Gwl2IIlbHQfIVvC81JZjacmgcuH936W8KJ/AksLYxAXVSceOQXE5xFdGddC6BNys0ifBlJ/HunOs7
	cHyrY/9IyxLyJDoYSFbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl0Ln-0000000D7l2-07Lh;
	Mon, 02 Sep 2024 06:15:43 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl0Lk-0000000D7kV-04qZ
	for linux-i3c@lists.infradead.org;
	Mon, 02 Sep 2024 06:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725257740; x=1756793740;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oQeEtOb2bMnH/NIz8TrJl1Iq8ZuigwPcNPy/sTgYkxk=;
  b=X4zzpH/fw4eu6YS9rQgrQDPiaRg2YPKzcs0TVDCd3n+mb5sRCxlw7dWD
   WVsqKrIX7TnVeAKQUZBS6F2OPaqjDS+j+qPcGqdRhqSBxs3uDJYWEE9af
   W2YkmKRnlvo54O+DH3HgWjFa2vTQiBlLyU8BYeDDBCOVBCXPsF1oTtHsS
   iE8Xhhuj3ODD9vTnwGwJEsJA8zWEJmUoXqfAxQ2ty4jv6fc+3nrpnuJCk
   UmwkjUSfa/RKty9YKzOKIGY1N6WxE54PIVxSDASGVxnroehoeJIGfLSL/
   vZlfnSVMaMyji36jEZGjFNDL63FauDZLRvLOfM/61HaeHLNg9vdpmoKNf
   w==;
X-CSE-ConnectionGUID: X5X4mN42Q7ai2ABK1qIvlg==
X-CSE-MsgGUID: GFd0R5TmQoGXQdywg30fGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="35189756"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="35189756"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 23:15:36 -0700
X-CSE-ConnectionGUID: Cx2XLCMKT8W4OJJK43fvqA==
X-CSE-MsgGUID: 8dI3IJJARGic2o30bY8kCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64196909"
Received: from mylly.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP; 01 Sep 2024 23:15:34 -0700
Message-ID: <17e2bf2a-0c9d-4668-8f01-23651ce1970f@linux.intel.com>
Date: Mon, 2 Sep 2024 09:15:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] i3c: mipi-i3c-hci: Read HC_CONTROL_PIO_MODE only
 after i3c hci v1.1
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240829091713.736217-1-Shyam-sundar.S-k@amd.com>
 <20240829091713.736217-3-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240829091713.736217-3-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_231540_174572_23F24EE7 
X-CRM114-Status: UNSURE (   9.10  )
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

On 8/29/24 12:17 PM, Shyam Sundar S K wrote:
> The HC_CONTROL_PIO_MODE bit was introduced in the HC_CONTROL register
> starting from version 1.1. Therefore, checking the HC_CONTROL_PIO_MODE bit
> on hardware that adheres to older specification revisions (i.e., versions
> earlier than 1.1) is incorrect. To address this, add an additional check
> to read the HCI version before attempting to read the HC_CONTROL_PIO_MODE
> status.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/core.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
