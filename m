Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A41FC282D0
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Mar 2025 09:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=260SiWbuMWgYdMxpO+hC/QY5d00QHr5pwQrWsVvBwtU=; b=Rf9jypYG5GIagw
	mv8TStKcbK0wplPmh/L0HSI9dmX2GGUMhAqA6yO1vBhLH99yaRLeFWRfS2J8DRTQWhBjQsVUxHI1c
	K7Pw1uqtCFncwB4ICvlwSMFvewmnWKs0NJuDqwxh71U31NsAgZbjA69+I85HFgpy1DAvW47z+7exn
	7CYNa7opbIFyBeohN5OzIuR0+TPSgJf6Z0wGjMj90xHYkqH9RzcnebnRAxPFduNEgan37I1GKwvJh
	o+S6IHUG9urDuYxNaXHO5jDKGQuYraY7VeRIH/6vXCU7NLQmcX/cTILqapboQIkMxliMJE8g8Bhsa
	AHAexjiKiHHP5JSzaTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTmV-0000000DfU7-41yD;
	Fri, 07 Mar 2025 09:14:11 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTmT-0000000DfSl-1i6Z
	for linux-i3c@lists.infradead.org;
	Fri, 07 Mar 2025 09:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741338849; x=1772874849;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ieDk5hq7SLhEHdmfnZcCWG6ilsx5GR3sIgQa97SStdI=;
  b=d7fJqgJUCX7HsTTlY3c7HLzH8XdXLz/AP7MXuR9DRMTvrm0//7DWiuRh
   m+tQ/0guEf2fh9c/SBPZZL5LBcP2fiLCp7jZDz+bMG53pMygUjc5Zn9XE
   4cS3v7mnogWNSDbTpHHO8kMBxX1cz0s6+BYDpXKommE9ipBtCEdU0n6Sv
   SekpONOt8wQxMr7LNP+1pUrwx4TRYvxec66CbagANNz0kQyInzGwJvX5K
   zzGfJALVy8jf/2LVIfBeGW+8Yc2hXHLq8Z/gR+WcSwz4ABkefknTFrhpP
   MDu+MUIv3B9pRsqIuRWXCfVDO3Hz3m69Q9m9TYCSmY5i1qEmJMSn7FdiG
   g==;
X-CSE-ConnectionGUID: a6c5FecxR4mGrZDFJblPEg==
X-CSE-MsgGUID: QbYRdU0ITzm+wr/sGSpe8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41635124"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="41635124"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 01:14:08 -0800
X-CSE-ConnectionGUID: 3+wgSfeqQiytOnF6rnoo0g==
X-CSE-MsgGUID: TopRaI0CRtGSHYPM8nlKaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="119452714"
Received: from mylly.fi.intel.com (HELO [10.237.72.59]) ([10.237.72.59])
  by fmviesa008.fm.intel.com with ESMTP; 07 Mar 2025 01:14:07 -0800
Message-ID: <6947fe08-f479-4692-a5d7-5b54496e4909@linux.intel.com>
Date: Fri, 7 Mar 2025 11:14:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] i3c: mipi-i3c-hci: Allow only relevant INTR_STATUS
 bit updates
To: Frank Li <Frank.li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250228141802.1344453-1-jarkko.nikula@linux.intel.com>
 <Z8HduKx0dzRAqRev@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Z8HduKx0dzRAqRev@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_011409_495019_871ACFEA 
X-CRM114-Status: GOOD (  21.97  )
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

Sorry the delay, somehow I missed your comments to this patch :-|

On 2/28/25 6:00 PM, Frank Li wrote:
> On Fri, Feb 28, 2025 at 04:17:59PM +0200, Jarkko Nikula wrote:
>> Since MIPI I3C HCI specification version v0.8 INTR_STATUS bits 9:0 are
>> reserved. Version v0.5 has bits 9 and 5:0 in use but not handled by the
>> current driver code and not needed in DMA transfers.
>>
>> PIO transfers with v0.5 would require changes to both
>> core.c: i3c_hci_irq_handler() and pio.c: hci_pio_irq_handler() though.
> 
> If reasonable, why not change core.c and pio.c?
> 
I had two reasons for that. The v0.5 compatible IP I use in testing 
doesn't support PIO transfers and thus didn't want to add code that is 
not tested.

Then I believe perhaps nobody will release HW with this old IP and thus 
it would be dead code anyway.

>>
>> For these reasons don't enable signal updates from INTR_STATUS bits 9:0.
>>
>> This change is a no-op for specification versions v0.8 and beyond but
>> gets rid of "unexpected INTR_STATUS" errors if somebody (read me) wants
>> to run code on old v0.5 IP version.
> 
> I think, simple said
> "Get rid of "unexpected INTR_STATUS" errors at old v0.5 IP version and
> no-op for version above v0.8."
> 
Makes sense, will change.

>>
>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>> ---
>>   drivers/i3c/master/mipi-i3c-hci/core.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>> index a71226d7ca59..e139d7e4d252 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>> @@ -699,9 +699,10 @@ static int i3c_hci_init(struct i3c_hci *hci)
>>   	if (ret)
>>   		return -ENXIO;
>>
>> -	/* Disable all interrupts and allow all signal updates */
>> +	/* Disable all interrupts */
>>   	reg_write(INTR_SIGNAL_ENABLE, 0x0);
>> -	reg_write(INTR_STATUS_ENABLE, 0xffffffff);
>> +	/* Allow signal updates relevant to IP versions 0.8 and beyond */
>> +	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
> 
> Generally, just enable needed IRQ in driver. Define some BITS for
> difference type IRQs.
> 
I was thinking too these need changes too but decided those are better 
to do in another patch(es).

Currently all of these generic interrupt sources are disabled so they 
won't generate interrupt but their status will be printed when handler 
is called due to DMA/PIO interrupt. Known bits 10 INTR_HC_INTERNAL_ERR 
and 11 INTR_HC_SEQ_CANCEL will print their message and unknowns just 
"unexpected INTR_STATUS" with hex of unhandled status bits.

Bits 12:14 can be defined since v1.2 describes them. I'm open for ideas 
does it make more sense to allow signal updates only from known sources 
or keep all bits enabled so that in future IP versions "unexpected 
INTR_STATUS" can be seen from user reports if something odd happens and 
driver is not yet handling that.

Another change is should known generic interrupt sources be enabled so 
handler will be called immediately when that condition occurs.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
