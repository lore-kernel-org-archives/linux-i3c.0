Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54E1C369CB
	for <linux-i3c@archiver.kernel.org>; Wed, 23 Apr 2025 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VLymqo6wRWJEfg/YAAcKmk86tBgRjgS5ZIe9tNlB960=; b=NASAWnRQYJOU7J
	cWsQAxYqDY5zZmSq+v6Q63WQjmo5YZo7lJz/NFNQTbi3OxSXq9G7ImMh0NI4vsN+REcmNc80BfqxJ
	iGsllPy8pa9S7Qm7RVmdDOcXWc9CxamztwRNye7DEKGpJWY3rT+W240lQ27SQF9KyfQpcKWRdnh78
	kpp2SFJp0I7nGcYw5Hz3fXtUtn0vHghfrX4KWbv0i/0x7bDN/Qmp8/a6lgwfKxnrHva0dgQU8k/VW
	q0yDCZG6HLwFhmgYPlBuTJVNjsEkRodTLh7IznNtxeAhF1IhCn7g46ZuuV7gHZWAuiffKJFtsodCo
	r3n6p4j6Z7jppDsltu9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VLD-00000009hQQ-1gnn;
	Wed, 23 Apr 2025 08:20:23 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UfU-00000009Y0Q-2Pib
	for linux-i3c@lists.infradead.org;
	Wed, 23 Apr 2025 07:37:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745393837; x=1776929837;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RpUSTZZdApODF+TAd61uowvH+IoPfkU1nCBlDOt75j4=;
  b=XO/3MsZu9wzLKY3oJ8MlJ4R9anOhIy+Qm4x6Sf/oBjI+mdF+/ZZpNcC0
   /jzn8TncVXmvvLlrRZENooEEY3lr7Zs8Ja11tF87+MUlnaHShvv2zYMH3
   6ZIf9oiqWUBtQipYw/RBeMVcVtQ+dweREtAkYQ9A8yMZAHlL+D9N3mSKK
   ncIZ6CozIJ0h/Vew4s4vIiyuFQYNwxhXCXXML4RcOzR6EIVnxLQ6GNrOh
   TvRds6MVZX8NDYPyTcz4VA143XZNwW6Jxvy7XJd9NpWoyesM2SuqmmX2o
   33gV1udexbOE89EAIT1XihRFuYyLJm7pBynGsvfNMTyTBqqtFAuiiChyP
   A==;
X-CSE-ConnectionGUID: P2VNMqxtQN6CNu1MB/z1+g==
X-CSE-MsgGUID: i45WdnCcRXWF57oO4tePgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46853138"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46853138"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 00:37:14 -0700
X-CSE-ConnectionGUID: B/chCFgCRGejVX8kOlY2GA==
X-CSE-MsgGUID: 2YCjZy13QZqg166ULnS8tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137316547"
Received: from unknown (HELO [10.237.72.50]) ([10.237.72.50])
  by fmviesa004.fm.intel.com with ESMTP; 23 Apr 2025 00:37:13 -0700
Message-ID: <6526cebc-810f-4857-83b2-b8c1e4e62fc3@linux.intel.com>
Date: Wed, 23 Apr 2025 10:37:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] i3c: mipi-i3c-hci: Allow only relevant INTR_STATUS
 bit updates
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>
References: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250409140401.299251-1-jarkko.nikula@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_003716_865771_204AD750 
X-CRM114-Status: GOOD (  11.41  )
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

Hi Frank

On 4/9/25 5:03 PM, Jarkko Nikula wrote:
> Since MIPI I3C HCI specification version v0.8 INTR_STATUS bits 9:0 are
> reserved. Version v0.5 has bits 9 and 5:0 in use but not handled by the
> current driver code and not needed in DMA transfers.
> 
> PIO transfers with v0.5 would require changes to both
> core.c: i3c_hci_irq_handler() and pio.c: hci_pio_irq_handler() though.
> 
> For these reasons don't enable signal updates from INTR_STATUS bits 9:0.
> 
> It allow to get rid of "unexpected INTR_STATUS" error messages on old
> v0.5 IP version and is a no-op for later versions starting from v0.8.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> v3: Changed the last commit log sentence and clarified more the comment
> about INTR_STATUS_ENABLE signal updates according to Frank Li's suggestion.
> ---
>   drivers/i3c/master/mipi-i3c-hci/core.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
Was this and patch 3/5 now ok in your point of view?

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
