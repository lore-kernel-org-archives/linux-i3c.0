Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE94E77199
	for <linux-i3c@archiver.kernel.org>; Wed,  8 Jan 2025 12:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WNuCwHNfetKKE/3tt3/gcrReag7sHueNjT0LdIUb7+M=; b=f1P7pGGXmi6s5K
	o624kllqgE78Ry0wDIV3dasSsiC5Pvrgk+cORpIegRw66Gk4M5IIV/uba0muAS+vQ9UZ6CohTQx/i
	9MLp4Bm5Faq7gh4/whsjCyDTFvoL9xCQ0c3cteEvoG8Qm2JPB2pI3zAJRTyBdL+3a3WZ6ybmeVoUU
	WXNG6VEDoYEQuILWtlTTL9Mq5xFZolzIXS5heD5hthF5MJ0NW9RF/y58ncZ2h2l38JRqswCn/0bQB
	Sm/82GE2etCN2akjRMDcRaGkoOs17ApNgu7+GnMdLNQyj0EIycDtMzTuYXguk8Tk/j06ujxvGkjTb
	5EeMWM9hY9eHm9RawMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVaM-00000008VwX-2TZd;
	Wed, 08 Jan 2025 12:54:58 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUsU-00000008MYc-1Cgp
	for linux-i3c@lists.infradead.org;
	Wed, 08 Jan 2025 12:09:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736338178; x=1767874178;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YqHndkqCZGZQ1m1wA55w0BgPMQve6HjzYGQpFNVSOH4=;
  b=I5OOwu4hYbl/BMlwYwQz4f1zVgn0gNPr1ikEH7mhsr3ZGFqHj3WOEXcH
   LcjCrj2inZdfD4Hm5NwcZclXOO+/5T0bv6ATa94Pj+KppDAU/Itnm2PNA
   ap3MmAtcXUovKW3d2G0AJTzLU4zBVkDlsrbjzAzHegKDkZZCO6H7ZGl/c
   So/YyT58EnHWjkvYHy2a7jA/PUI+mesBKKTQrNGdJ2ZAi3rg+h3ezfrL1
   OzknrtUe92lcjz96KC34gF+Kf5I8zvdk8b+rHkX1WnUdYUoL1ZVs7j1/7
   t735+Rzh/7IWhXmU4arY1WrjqbF+2QrWuSOJgPRVFj8W/HIVcSiJWlbuV
   A==;
X-CSE-ConnectionGUID: i8FjkyqsSWGBcmQJX+BABA==
X-CSE-MsgGUID: fiBd+w2NSs2Lk7IMGix8ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="39379678"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="39379678"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 04:09:37 -0800
X-CSE-ConnectionGUID: wiU198vIQwuRhmomtyW7SA==
X-CSE-MsgGUID: HMlxTK96RfSbrPMvx0YhOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="103568196"
Received: from mylly.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jan 2025 04:09:35 -0800
Message-ID: <3117d2d9-260a-4e02-8c22-4e078e01ddd5@linux.intel.com>
Date: Wed, 8 Jan 2025 14:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] i3c: mipi-i3c-hci: use parity8 helper instead of
 open coding it
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
 <20250107090204.6593-5-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250107090204.6593-5-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_040938_370418_57C89AC9 
X-CRM114-Status: GOOD (  10.59  )
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

On 1/7/25 11:02 AM, Wolfram Sang wrote:
> The kernel has now a generic helper for getting parity with easier to
> understand semantics. Make use of it. Here, it also fixes a bug because
> the correct algorithm is using XOR ('^=') instead of ADD ('+=').
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> 
> Change since v3:
> 
> * updated commit message to mention the bugfix
> 
> I intentionally did not add a Fixes tag because this fix depends on
> patch 1. The proper fix for backporting would change this to XOR, I'd
> think.
> 
Stable rules allow also cherry picking additional patches. To me picking 
patch 1 and 4 sounds better than an intermediate fix since bug has been 
here from the beginning. IMHO not so urgent than a regression.

Looks like we have been lucky. First dynamic address is 0x9 and previous 
algorithm gets the same calculated dat_w0 value for at least for the 
addresses 0x9 and 0xa.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
