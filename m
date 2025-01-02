Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBF0E77188
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Jan 2025 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RWQ/UZXBsVUZiRkBSAeU2GZDyOuve7bVQVbY8yYPRM=; b=blnD1vhrLDU7Yr
	dCWug/gMpyLA4fQoU/xxj0jYE84BHqDeGJCrkWjtZXU23iH9eSZfXnhZg6oVVxmaQYl65I7IvM5OT
	VimPoO603L2CE0sKz0vUpPwH40LnWzqXJkExEgA6rh//IJAsT/CTpnQFEXh1ySgMtYygnDRx62bIX
	xwUsI08bBbkzQv6cc4+V67cXDU/cFQ2tY4uMnBCy8Id9Zn+YnZtHDJ9+AujNF2LZLwPtmZMhbEogZ
	p1KNyVYCayADINyFBcYY1V5dVNSt7KeGklm8ngI2ETr3yc4pEoRzj57f6Kbh2w24kUKi7fLv9Ju9y
	9+ga9kOotP6r8AQ8QaEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTM2r-0000000AaIi-2kxB;
	Thu, 02 Jan 2025 14:19:29 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTM2p-0000000AaI8-3ObS
	for linux-i3c@lists.infradead.org;
	Thu, 02 Jan 2025 14:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735827568; x=1767363568;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rm94Wn4LvKiu88EToTbZs1ptXX/jO3nGcHuSO/KyWDw=;
  b=i2apnsVyL9FiKs3xYbZ4RApXwQdkST8aljsY40WK1R7ZEETX2JKa/3Ji
   tWxJdOeb8tDYAkrxpt0Nhe4H5No73hg3aXo3jWniXLqGcwyPNhx4+uttT
   FOr1XED1f7j6tgEd/Lf/Qh/0Az9+oqrxlCj4GBAWjfasKqYopvJpA983X
   CUCa8m89jYzXGxUAp0g+MvScfdQm+XtssqL9o0AOtaEkgS1BWEWRGq2jP
   ZwqjOYv95xBwjx9nOVDcPK4RFpVusJp0YL37RKw98rHS7iBjCBUBFmqT+
   PNRGuwLvJ9LwXv29YLdY8N9PA+YwPYMiEafhPsYpI4ZdTdmk5AFqDoaZc
   Q==;
X-CSE-ConnectionGUID: ouPP+4mHTfaKWbhFs2tedg==
X-CSE-MsgGUID: 1dVJbOs6TziOhVOjdiDIqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35765652"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="35765652"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 06:19:13 -0800
X-CSE-ConnectionGUID: jvEewcFBSQSc47fU8lfD7A==
X-CSE-MsgGUID: YOazHrQqRHWuwLA3uTw5uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="102018216"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by fmviesa009.fm.intel.com with ESMTP; 02 Jan 2025 06:19:10 -0800
Message-ID: <76f97f65-28ad-4d7f-894c-e2d1f241e973@linux.intel.com>
Date: Thu, 2 Jan 2025 16:19:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper
 instead of open coding it
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
 <20241229101234.2896-5-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20241229101234.2896-5-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_061927_897787_748F7EDD 
X-CRM114-Status: GOOD (  10.05  )
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

On 12/29/24 12:12 PM, Wolfram Sang wrote:
> The kernel has now a generic helper for getting parity with easier to
> understand semantics. Make use of it.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v1:
> 
> * renamed from 'get_parity8' to 'parity8'
> * rebased to 6.13-rc4
> 
>   drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
Please rename s/get_parity8/parity8/ also in the subject line of patches 
3-5.

For this patch:

Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
